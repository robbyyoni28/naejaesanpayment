from flask import Flask, render_template, request, redirect, url_for, Response, session, jsonify, make_response,redirect, url_for, abort, \
send_from_directory
import pymysql.cursors, os
import datetime
from werkzeug.utils import secure_filename

app = Flask(__name__)

app.secret_key = "fVck_1D34LiS"
app.config['MAX_CONTENT_LENGTH'] = 16 * 1920 * 1080
app.config['UPLOAD_EXTENSIONS'] = ['.jpg', '.png', '.gif', '.jpeg']
app.config['UPLOAD_PATH'] = 'static'


def validate_image(stream):
    header = stream.read(512)  # 512 bytes should be enough for a header check
    stream.seek(0)  # reset stream pointer
    format = imghdr.what(None, header)
    if not format:
        return None
    return '.' + (format if format != 'jpeg' else 'jpg')

@app.route('/uploader')
def uploader():
    files = os.listdir(app.config['UPLOAD_PATH'])
    return render_template('upload.html', files=files)

@app.route('/uploader', methods=['POST'])
def upload_files():
    uploaded_file = request.files['file']
    upload_namaminuman = request.form['mdl_nama_minuman']
    upload_idharga = request.form['mdl_id_harga']
    upload_idkategori = request.form['mdl_id_kategori']
    filename = secure_filename(uploaded_file.filename)
    if filename != '':
        file_ext = os.path.splitext(filename)[1]
        connection = pymysql.connect(host='127.0.0.1',user='naejaesan',password='naejaesan1998-X',database='naejaesan',cursorclass=pymysql.cursors.DictCursor)
        with connection.cursor() as cursor:
            cursor.execute(f"INSERT INTO tb_minuman (nama_minuman, id_harga, id_kategori, img_minuman) VALUES (%s, %s, %s, %s)",(upload_namaminuman,upload_idharga,upload_idkategori,filename))
        connection.commit()
            
        if file_ext not in app.config['UPLOAD_EXTENSIONS'] or \
                file_ext != validate_image(uploaded_file.stream):
            abort(400)
        uploaded_file.save(os.path.join(app.config['UPLOAD_PATH'], filename))
    return redirect(url_for('index'))

@app.route('/static/<filename>')
def upload(filename):
    return send_from_directory(app.config['UPLOAD_PATH'], filename)


@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'GET':
        session.clear()
        return render_template('login.html')
    
    if request.method == 'POST':
        request.form = request.json
        # variable tersebut kemudian di-parsing ke masing masing variable berikut
        inputan_username = request.form['inputan_username']
        inputan_password = request.form['inputan_password']

        connection = pymysql.connect(host='127.0.0.1',user='naejaesan',password='naejaesan1998-X',database='naejaesan',cursorclass=pymysql.cursors.DictCursor)
        with connection.cursor() as cursor:

            # menjalankan fungsi query yang terdapat dalam cursor.execute mengambil inputan dari form login 
            # mencocokkan nik dan password yanng dikirim user pada form login ke db
            cursor.execute(f"SELECT * FROM tb_pegawai WHERE username='{inputan_username}' AND password='{inputan_password}'")
            # hasil pencocokkan tadi disimpan ke variabel satu data
            satudata = cursor.fetchone()
            print(satudata)

            if satudata is None:
                return Response("data tidak ditemukan oleh server", status=404)
            else:
                print(satudata['nama'])

                # blok dibawah digunakan untuk memilahh data user kemudian disimpan ke variable session
                session['USER_ID'] = satudata['id_pegawai']
                session['USER_FULL_NAME'] = satudata['nama']
                session['USER_LEVEL'] = satudata['level']
                session['USER_USERNAME'] = satudata['username']
                

                return render_template('login.html')

@app.route('/pemesanan', methods=['GET', 'POST'])
def pemesanan():
    if len(session) == 0:
        return redirect('/login?msg=SESSION_KOSONG')

    connection = pymysql.connect(host='127.0.0.1',user='naejaesan',password='naejaesan1998-X',database='naejaesan',cursorclass=pymysql.cursors.DictCursor)
    with connection.cursor() as cursor:
        iso8601 = datetime.datetime.now().astimezone().replace(microsecond=0).isoformat()
        # cursor.execute(f"SELECT * FROM tb_absensi_datang")
        cursor.execute(f"SELECT*FROM tb_minuman ")
        imageupload = cursor.fetchall()
        print(imageupload)
    return render_template('pemesanan.html', imageupload=imageupload)
@app.route('/testing', methods=['GET', 'POST'])
def testing():
    if len(session) == 0:
        return redirect('/login?msg=SESSION_KOSONG')

    # connection = pymysql.connect(host='127.0.0.1',user='root',password='j-lo09',database='naejaesan',cursorclass=pymysql.cursors.DictCursor)
    # with connection.cursor() as cursor:
    #     iso8601 = datetime.datetime.now().astimezone().replace(microsecond=0).isoformat()
    #     # cursor.execute(f"SELECT * FROM tb_absensi_datang")
    #     cursor.execute(f"SELECT*FROM tb_minuman ")
    #     tb_minuman = cursor.fetchall()
    #     print(tb_minuman)
    connection = pymysql.connect(host='127.0.0.1',user='naejaesan',password='naejaesan1998-X',database='naejaesan',cursorclass=pymysql.cursors.DictCursor)
    with connection.cursor() as cursor:
        iso8601 = datetime.datetime.now().astimezone().replace(microsecond=0).isoformat()
        # cursor.execute(f"SELECT * FROM tb_absensi_datang")
        cursor.execute(f"SELECT*FROM tb_minuman ")
        tb_minuman = cursor.fetchall()
        print(tb_minuman)        
    return render_template('testing.html', tb_minuman=tb_minuman)

@app.route("/logout")
def logout():
    session.clear()
    return redirect('/login?msg=ANDA_SUDAH_LOGOUT')

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=8081, debug=True)
 
