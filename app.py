# Imports Flask tools for building the web application
from flask import Flask, render_template, request, redirect, session, url_for

# Imports SQLite for database access
import sqlite3

# Imports date to store the review submission date
from datetime import date

# Creates the Flask application
app = Flask(__name__)

# Secret key used to manage user sessions (login state)
app.secret_key = "secret-key"


# Function to connect to the SQLite database
def get_db():
    conn = sqlite3.connect("schema.db")  # Connects to the database file
    conn.row_factory = sqlite3.Row  # Allows access to columns by name
    return conn


# Route for the home page
@app.route("/")
def index():
    db = get_db()

    # Retrieves all movies from the database
    movies = db.execute("SELECT * FROM movies").fetchall()

    # Retrieves all reviews and joins them with user data
    reviews = db.execute(
        """
        SELECT r.ID, r.Review, r.Rating, r.Movies_Id, r.Users_Id, u.Username
        FROM reviews r
        JOIN users u ON r.Users_Id = u.ID
        """
    ).fetchall()

    # Groups reviews by their movie ID
    reviews_by_movie = {}
    for r in reviews:
        reviews_by_movie.setdefault(r["Movies_Id"], []).append(r)

    # Sends movies and reviews to the index page
    return render_template(
        "index.html", movies=movies, reviews_by_movie=reviews_by_movie
    )


# Route for user registration
@app.route("/register", methods=["GET", "POST"])
def register():
    # If the form is submitted
    if request.method == "POST":
        username = request.form["username"]  # Gets the username
        password = request.form["password"]  # Gets the password
        db = get_db()

        # Inserts the new user into the database
        db.execute(
            "INSERT INTO users (Username, Password) VALUES (?, ?)", (username, password)
        )
        db.commit()

        # Redirects the user to the login page
        return redirect(url_for("login"))

    # Displays the registration page
    return render_template("register.html")


# Route for user login
@app.route("/login", methods=["GET", "POST"])
def login():
    # If the login form is submitted
    if request.method == "POST":
        username = request.form["username"]
        password = request.form["password"]
        db = get_db()

        # Checks if the user exists in the database
        user = db.execute(
            "SELECT * FROM users WHERE Username=? AND Password=?",
            (username, password),
        ).fetchone()

        # If the user exists, log them in
        if user:
            session["user_id"] = user["ID"]  # Stores user ID in session
            return redirect(url_for("index"))
        else:
            return "Invalid credentials"

    # Displays the login page
    return render_template("login.html")


# Route to log the user out
@app.route("/logout")
def logout():
    session.clear()  # Clears the session data
    return redirect(url_for("index"))


# Route to add or edit a review
@app.route("/review/<int:movie_id>", methods=["GET", "POST"])
def review(movie_id):
    # Redirects to login if user is not logged in
    if "user_id" not in session:
        return redirect(url_for("login"))

    db = get_db()

    # Gets the review ID if editing an existing review
    review_id = request.args.get("review_id")
    existing_review = None

    # Retrieves the existing review if it belongs to the logged-in user
    if review_id:
        existing_review = db.execute(
            "SELECT * FROM reviews WHERE ID=? AND Users_Id=?",
            (review_id, session["user_id"]),
        ).fetchone()

    # If the review form is submitted
    if request.method == "POST":
        review_text = request.form["review"]  # Review text
        rating = request.form["rating"]  # Review rating
        today = date.today().isoformat()  # Current date

        # Updates the review if it already exists
        if existing_review:
            db.execute(
                "UPDATE reviews SET Review=?, Rating=?, Date=? WHERE ID=?",
                (review_text, rating, today, review_id),
            )
        # Inserts a new review if it does not exist
        else:
            db.execute(
                """
                INSERT INTO reviews (Date, Review, Rating, Movies_Id, Users_Id)
                VALUES (?, ?, ?, ?, ?)
                """,
                (today, review_text, rating, movie_id, session["user_id"]),
            )

        db.commit()
        return redirect(url_for("index"))

    # Displays the review form page
    return render_template(
        "review_form.html", movie_id=movie_id, review=existing_review
    )


# Route to delete a review
@app.route("/review/delete/<int:review_id>", methods=["POST"])
def delete_review(review_id):
    # Redirects to login if user is not logged in
    if "user_id" not in session:
        return redirect(url_for("login"))

    db = get_db()

    # Deletes the review only if it belongs to the logged-in user
    db.execute(
        "DELETE FROM reviews WHERE ID=? AND Users_Id=?",
        (review_id, session["user_id"]),
    )
    db.commit()

    return redirect(url_for("index"))


# Runs the Flask application
if __name__ == "__main__":
    app.run(port=5000, debug=True)
