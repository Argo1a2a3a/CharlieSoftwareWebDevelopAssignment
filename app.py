from flask import Flask, render_template, request, redirect, session, url_for
import sqlite3
from datetime import date

app = Flask(__name__)
app.secret_key = "secret-key"


def get_db():
    conn = sqlite3.connect("schema.db")
    conn.row_factory = sqlite3.Row
    return conn


@app.route("/")
def index():
    db = get_db()

    # Get all movies
    movies = db.execute("SELECT * FROM movies").fetchall()

    # Get all reviews
    reviews = db.execute(
        """
        SELECT r.ID, r.Review, r.Rating, r.Movies_Id, r.Users_Id, u.Username
        FROM reviews r
        JOIN users u ON r.Users_Id = u.ID
        """
    ).fetchall()

    # Map reviews to their movies
    reviews_by_movie = {}
    for r in reviews:
        reviews_by_movie.setdefault(r["Movies_Id"], []).append(r)

    return render_template(
        "index.html", movies=movies, reviews_by_movie=reviews_by_movie
    )


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

    db = get_db()
    review_id = request.args.get("review_id")
    existing_review = None

    if review_id:
        existing_review = db.execute(
            "SELECT * FROM reviews WHERE ID=? AND Users_Id=?",
            (review_id, session["user_id"]),
        ).fetchone()

    if request.method == "POST":
        review_text = request.form["review"]
        rating = request.form["rating"]
        today = date.today().isoformat()

        if existing_review:
            db.execute(
                "UPDATE reviews SET Review=?, Rating=?, Date=? WHERE ID=?",
                (review_text, rating, today, review_id),
            )
        else:
            db.execute(
                "INSERT INTO reviews (Date, Review, Rating, Movies_Id, Users_Id) VALUES (?, ?, ?, ?, ?)",
                (today, review_text, rating, movie_id, session["user_id"]),
            )
        db.commit()
        return redirect(url_for("index"))

    return render_template(
        "review_form.html", movie_id=movie_id, review=existing_review
    )


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
