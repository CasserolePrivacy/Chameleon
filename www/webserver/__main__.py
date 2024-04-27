from flask import Flask
import os
port = int(os.environ.get('port', 6721)) if os.environ.get('port', 6721).isnumeric() else 6721
app = Flask(__name__)
app.env = "production"
@app.route('/')
def serve_index():
    root_dir = os.path.abspath(os.path.join(os.path.dirname(__file__), '..'))
    with open(os.path.join(root_dir, 'index.html'), 'r') as file:
        content = file.read()
    return content
@app.route('/about')
def serve_about():
    root_dir = os.path.abspath(os.path.join(os.path.dirname(__file__), '../pages'))
    with open(os.path.join(root_dir, 'about.html'), 'r') as file:
        content = file.read()
    return content

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=port)