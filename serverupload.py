
from flask import Flask, app
import os
import urllib.request
from flask import Flask, flash, request, redirect, url_for, render_template
from werkzeug.utils import secure_filename
import pymysql

UPLOAD_FOLDER = 'static/uploads/'

app = Flask(__name__)
app.secret_key = "secret key"
app.config['UPLOAD_FOLDER'] = UPLOAD_FOLDER
app.config['MAX_CONTENT_LENGTH'] = 16 * 1024 * 1024



ALLOWED_EXTENSIONS = set(['png', 'jpg', 'jpeg', 'gif'])

def allowed_file(filename):
    return '.' in filename and filename.rsplit('.', 1)[1].lower() in ALLOWED_EXTENSIONS

@app.route('/')
def upload_form():
    return render_template('upload.html')

@app.route('/', methods=['POST'])
def upload_image():
    if 'file' not in request.files:
        flash('No file part')
        return redirect(request.url)
    file = request.files['file']
    if file.filename == '':
        flash('No image selected for uploading')
        return redirect(request.url)
    if file and allowed_file(file.filename):
        filename = secure_filename(file.filename)
        upload_namaminuman = request.form['mdl_nama_minuman']
        upload_idharga = request.form['mdl_id_harga']
        upload_idkategori = request.form['mdl_id_kategori']
        file.save(os.path.join(app.config['UPLOAD_FOLDER'], filename))
        connection = pymysql.connect(host='127.0.0.1',user='naejaesan',password='naejaesan1998-X',database='naejaesan',cursorclass=pymysql.cursors.DictCursor)
        with connection.cursor() as cursor:
            cursor.execute(f"INSERT INTO tb_minuman (nama_minuman, id_harga, id_kategori, img_minuman) VALUES (%s, %s, %s, %s)",(upload_namaminuman,upload_idharga,upload_idkategori,filename))
        connection.commit()

#print('upload_image filename: ' + filename)
        flash('Image successfully uploaded and displayed below')
        return render_template('upload.html', filename=filename)
    else:
        flash('Allowed image types are -> png, jpg, jpeg, gif')
        return redirect(request.url)

@app.route('/display/<filename>')
def display_image(filename):
#print('display_image filename: ' + filename)
    return redirect(url_for('static', filename='uploads/' + filename), code=301)

@app.route('/testing')
def card():
    connection = pymysql.connect(host='127.0.0.1',user='naejaesan',password='naejaesan1998-X',database='naejaesan',cursorclass=pymysql.cursors.DictCursor)
    with connection.cursor() as cursor:
        cursor.execute(f"SELECT * FROM tb_minuman")
        imageupload = cursor.fetchall()
        print(imageupload)
    return render_template('testing.html', imageupload=imageupload)


if __name__ == "__main__":
    app.run(host='0.0.0.0', port='8080', debug=True)