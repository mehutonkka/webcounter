from flask import Flask, redirect, render_template, request
from counter import Counter

app = Flask(__name__)
cnt = Counter()

@app.route("/")
def index():
    return render_template("index.html", value=cnt.value)

@app.route("/increment", methods=["POST"])
def increment():
    cnt.increase()
    return redirect("/")

@app.route("/reset", methods=["POST"])
def reset_count():
    cnt.reset()
    return redirect("/")

@app.route("/set", methods=["POST"])
def set_count():
    new_value = request.form.get("new_value", type=int)
    if new_value is not None and new_value >= 0:
        cnt.value = new_value
    return redirect("/")