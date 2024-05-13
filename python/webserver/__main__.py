from flask import Flask, make_response
import os
import requests
port = int(os.environ.get('port', 6721)) if str(os.environ.get('port', 6721)).isnumeric() else 6721 


def checkIfTelemetry():
    if os.environ.get("telemetry") == "true":
        import sentry_sdk
        sentry_sdk.init(
            dsn="https://9bfca3020d96903e19641bc170a91f1f@o4505607290093568.ingest.us.sentry.io/4507250701107200",
            traces_sample_rate=1.0,
            profiles_sample_rate=1.0,
        )

checkIfTelemetry()
app = Flask(__name__)
app.env = "production"
@app.route('/')
def serve_index():
    root_dir = os.path.abspath(os.path.join(os.path.dirname(__file__), '/www/'))
    with open(os.path.join(root_dir, 'index.html'), 'r') as file:
        content = file.read()
    return content
@app.route('/about')
def serve_about():
    root_dir = os.path.abspath(os.path.join(os.path.dirname(__file__), '/www/pages/'))
    with open(os.path.join(root_dir, 'about.html'), 'r') as file:
        content = file.read()
    return content
@app.route('/settings')
def serve_settings():
    root_dir = os.path.abspath(os.path.join(os.path.dirname(__file__), '/www/pages/'))
    with open(os.path.join(root_dir, 'settings.html'), 'r') as file:
        content = file.read()
    return content
@app.route('/network')
def serve_network():
    root_dir = os.path.abspath(os.path.join(os.path.dirname(__file__), '/www/pages/'))
    with open(os.path.join(root_dir, 'network.html'), 'r') as file:
        content = file.read()
    return content
@app.route('/health')
def serve_health():
    try:
        response = requests.get(f"http://localhost:{port}/")
        if response.status_code == 200:
            return "200 OK"
        else:
            response = make_response(f"ERROR: {response.status_code}", response.status_code)
            response.status_code = 503
            response.headers["Content-Type"] = "text/plain"
            return response
            
    except requests.exceptions.RequestException as e:
        return f"FAILED: {str(e)}"

if __name__ == '__main__':
    
    app.run(host='0.0.0.0', port=port)