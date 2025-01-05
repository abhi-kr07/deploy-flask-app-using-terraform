from flask import Flask

app = Flask(__name__)

@app.route("/")
def hello():
    # Return an HTML page with inline CSS for styling
    return '''
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Welcome to Abhishek Terraform Application!</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                text-align: center;
                margin: 0;
                padding: 0;
                background: linear-gradient(to right, #4facfe, #00f2fe);
                color: #ffffff;
            }
            header {
                background-color: rgba(0, 0, 0, 0.5);
                padding: 20px;
                font-size: 24px;
                font-weight: bold;
            }
            h1 {
                font-size: 3em;
                margin: 20px 0;
                animation: fadeIn 3s;
            }
            p {
                font-size: 1.2em;
                margin: 10px 0;
            }
            @keyframes fadeIn {
                0% { opacity: 0; }
                100% { opacity: 1; }
            }
            footer {
                position: absolute;
                bottom: 10px;
                width: 100%;
                font-size: 0.9em;
                color: rgba(255, 255, 255, 0.7);
            }
        </style>
    </head>
    <body>
        <header>Welcome to My Flask App</header>
        <h1>Hello, DevOps!</h1>
        <p>Congratulations on deploying this Flask app with Terraform.</p>
        <footer>&copy; 2025 Terraform & Flask Demo</footer>
    </body>
    </html>
    '''

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=80)
