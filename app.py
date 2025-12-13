from flask import Flask, render_template, request, redirect, session, url_for
import sqlite3
from datetime import date


app = Flask(__name__)
app.secret_key = "secret-key"  # Needed for sessions


def get_db():
    conn = sqlite3.connect("schema.db")
    conn.row_factory = sqlite3.Row
    return conn


@app.route("/")
def index():
    db = get_db()
    movies = db.execute(
        """
        SELECT m.ID, m.Name, m.Genre, m.Year, m.Summary,
               r.ID as ReviewID, r.Review, r.Rating, r.Date, u.Username
        FROM movies m
        LEFT JOIN reviews r ON m.ID = r.Movies_Id
        LEFT JOIN users u ON r.Users_Id = u.ID
    """
    ).fetchall()
    return render_template("index.html", movies=movies)


@app.route("/register", methods=["GET", "POST"])
def register():
    if request.method == "POST":
        username = request.form["username"]
        password = request.form["password"]
        db = get_db()
        db.execute(
            "INSERT INTO users (Username, Password) VALUES (?, ?)", (username, password)
        )
        db.commit()
        return redirect(url_for("login"))
    return render_template("register.html")


@app.route("/login", methods=["GET", "POST"])
def login():
    if request.method == "POST":
        username = request.form["username"]
        password = request.form["password"]
        db = get_db()
        user = db.execute(
            "SELECT * FROM users WHERE Username=? AND Password=?", (username, password)
        ).fetchone()
        if user:
            session["user_id"] = user["ID"]
            return redirect(url_for("index"))
        else:
            return "Invalid credentials"
    return render_template("login.html")


@app.route("/logout")
def logout():
    session.clear()
    return redirect(url_for("index"))


@app.route("/review/<int:movie_id>", methods=["GET", "POST"])
def review(movie_id):
    if "user_id" not in session:
        return redirect(url_for("login"))
    if request.method == "POST":
        review_text = request.form["review"]
        rating = request.form["rating"]
        today = date.today().isoformat()
        db = get_db()
        db.execute(
            "INSERT INTO reviews (Date, Review, Rating, Movies_Id, Users_Id) VALUES (?, ?, ?, ?, ?)",
            (today, review_text, rating, movie_id, session["user_id"]),
        )
        db.commit()
        return redirect(url_for("index"))
    return render_template("review_form.html", movie_id=movie_id)


@app.route("/review/update/<int:review_id>", methods=["POST"])
def update_review(review_id):
    if "user_id" not in session:
        return redirect(url_for("login"))
    review_text = request.form["review"]
    rating = request.form["rating"]
    db = get_db()
    db.execute(
        "UPDATE reviews SET Review=?, Rating=? WHERE ID=? AND Users_Id=?",
        (review_text, rating, review_id, session["user_id"]),
    )
    db.commit()
    return redirect(url_for("index"))


@app.route("/review/delete/<int:review_id>", methods=["POST"])
def delete_review(review_id):
    if "user_id" not in session:
        return redirect(url_for("login"))
    db = get_db()
    db.execute(
        "DELETE FROM reviews WHERE ID=? AND Users_Id=?", (review_id, session["user_id"])
    )
    db.commit()
    return redirect(url_for("index"))


if __name__ == "__main__":
    app.run(port=5000, debug=True)
