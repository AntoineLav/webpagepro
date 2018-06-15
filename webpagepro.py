from flask import Flask, render_template, send_from_directory
app = Flask(__name__, 
			static_url_path='')

@app.route('/')
def hello_world():
	return render_template('webpagepro.html')

@app.route('/img/<path:path>')
def send_img(path):
	return send_from_directory('static/img', path)