from flask import Flask, request, render_template_string

app = Flask(__name__)

@app.route("/")
def home():
    if request.args.get('c'):
        return render_template_string(request.args.get('c'))
    else:
        return "Hello, send something inside the param 'c'!"

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=80)  # Ensure it binds to 0.0.0.0 on port 80

