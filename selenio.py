import os
import mysql.connector
import requests
from bs4 import BeautifulSoup
import json
import csv

save_folder = r'C:\Users\tpizarro\Documents\Drive'
if not os.path.exists(save_folder):
    os.makedirs(save_folder)

mydb = mysql.connector.connect(
    host="localhost",
    user="root",
    password="",
    database="tmp_volvo"
)
mycursor = mydb.cursor()

url = 'https://volvorepuestos.com.pe/repuestos-camiones-volvo/fh/frenos.html'
html_text = requests.get(url).text
soup = BeautifulSoup(html_text, 'html.parser')
product_list = soup.find_all('div', class_='product-item-info type1')

# Initialize lists to store data
data_json = []
data_csv = []

for index, product_item in enumerate(product_list, start=1):
    product_name = product_item.find('strong', class_='product name product-item-name').text.strip()
    product_price = product_item.find('span', class_='price').text.replace(' ', '').strip()
    product_marca_elem = product_item.find('div', class_='marca')
    if product_marca_elem:
        product_marca = product_marca_elem.text.strip()
        brand, code = product_marca.rsplit(maxsplit=1)
        code = code.strip()
    else:
        brand = None
        code = None
    marca_elem = product_item.find('span', class_='name-marca')
    marca = marca_elem.text.strip() if marca_elem else None
    descuento_porcentaje = None
    product_descuento_elem = product_item.find('span', class_='old-price')
    product_descuento = None
    if product_descuento_elem:
        product_descuento = product_descuento_elem.text.replace(' ', '').strip()
        product_price_float = float(product_price.replace('S/', '').replace(',', ''))
        product_descuento_float = float(product_descuento.replace('S/', '').replace(',', ''))
        descuento_monto = product_price_float - product_descuento_float
        descuento_porcentaje = ((product_price_float - product_descuento_float) / product_price_float) * 100
    image_elem = product_item.find('img', class_='product-image-photo default_image')
    image_full_path = None
    if image_elem:
        image_url = image_elem['src']
        if not image_url.startswith('http'):
            image_url = 'https://volvorepuestos.com.pe' + image_url
        try:
            image_filename = f"producto_{index}.jpg"
            image_full_path = os.path.join(save_folder, image_filename)
            image_data = requests.get(image_url).content
            with open(image_full_path, 'wb') as image_file:
                image_file.write(image_data)
        except requests.exceptions.RequestException as e:
            print(f"Error downloading image: {e}")
            image_full_path = None
    sql = """INSERT INTO catalogo 
             (Codigo, Marca, Nombre_Producto, Porcentaje_Descuento, Precio, Precio_Descontado, imagen_ruta) 
             VALUES (%s, %s, %s, %s, %s, %s, %s)"""
    val = (
        f"VO {code}" if code else None, 
        marca, 
        product_name, 
        descuento_porcentaje, 
        product_price, 
        product_descuento if product_descuento else None, 
        image_full_path
    )
    mycursor.execute(sql, val)
    mydb.commit()
    
    # Append data to the lists
    data_json.append({
        "Codigo": f"VO {code}" if code else None,
        "Marca": marca,
        "Nombre_Producto": product_name,
        "Porcentaje_Descuento": descuento_porcentaje,
        "Precio": product_price,
        "Precio_Descontado": product_descuento if product_descuento else None,
        "imagen_ruta": image_full_path
    })

    data_csv.append([
        f"VO {code}" if code else None,
        marca,
        product_name,
        descuento_porcentaje,
        product_price,
        product_descuento if product_descuento else None,
        image_full_path
    ])

print("Data saved to the database")
mydb.close()

# Saving to JSON
json_file_path = r"C:\Users\tpizarro\Documents\Respaldo\data.json"
with open(json_file_path, 'w') as json_file:
    json.dump(data_json, json_file, indent=4)

# Saving to CSV
csv_file_path = r"C:\Users\tpizarro\Documents\Respaldo\data.csv"
with open(csv_file_path, 'w', newline='', encoding='utf-8') as csv_file:
    writer = csv.writer(csv_file)
    writer.writerows(data_csv)

print(f"JSON file saved at: {json_file_path}")
print(f"CSV file saved at: {csv_file_path}")
