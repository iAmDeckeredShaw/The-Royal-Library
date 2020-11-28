from flask import Flask, render_template, request, session, redirect, flash
# from flask_mail import Mail
from flask_sqlalchemy import SQLAlchemy
from datetime import datetime
import json
import math

with open('config.json', 'r') as f:
    params = json.load(f).get('params')

local_server = True
app = Flask(__name__)
app.config['SECRET_KEY'] = "the_weather_is_very_clear"
# app.config.update(
#     MAIL_SERVER='smtp.gmail.com',
#     MAIL_PORT='465',
#     MAIL_USE_SSL=True,
#     MAIL_USERNAME=params['gmail-user'],
#     MAIL_PASSWORD=params['gmail-password']
# )
# mail = Mail(app)
if local_server:
    app.config['SQLALCHEMY_DATABASE_URI'] = params['local_uri']
else:
    app.config['SQLALCHEMY_DATABASE_URI'] = params['prod_uri']

db = SQLAlchemy(app)


class Contacts(db.Model):
    sno = db.Column(db.Integer, primary_key = True)
    name = db.Column(db.String(20), unique = False, nullable = False)
    emailId = db.Column(db.String(20), unique = False, nullable = False)
    phoneNo = db.Column(db.String(20), unique = False, nullable = False)
    message = db.Column(db.String(100), unique = False, nullable = False)
    date = db.Column(db.String(20), unique = False, nullable = True)


class Posts(db.Model):
    id = db.Column(db.Integer, primary_key = True)
    name = db.Column(db.String(40), unique = False, nullable = False)
    title = db.Column(db.String(40), unique = False, nullable = False)
    subtitle = db.Column(db.String(50), unique = False, nullable = False)
    content = db.Column(db.String(200), unique = False, nullable = False)
    img_file = db.Column(db.String(20), unique = False, nullable = True)
    date = db.Column(db.String(20), unique = False, nullable = True)
    slug = db.Column(db.String(20), unique = False, nullable = False)


@app.route('/delete/<string:id>')
def delete(id):
    if 'user' in session and session['user'] == params["admin_username"]:
        post = Posts.query.filter_by(id = id).first()
        db.session.delete(post)
        db.session.commit()
        return redirect('/dashboard')
    return redirect('/login')


@app.route('/logout')
def logout():
    session.pop('user')
    return redirect('/login')


@app.route('/')
def home():

    all_posts = Posts.query.order_by(Posts.id.desc()).all()
    total = len(all_posts)
    max_no_of_posts_per_page = int(params.get('max_no_of_posts'))
    last = int(math.ceil(int(total / max_no_of_posts_per_page)))
    curr = request.args.get('curr')
    if curr is None:
        curr = 0
    curr = int(curr)
    start = curr * max_no_of_posts_per_page
    end = start
    if total - start < max_no_of_posts_per_page:
        end += (total - start)
    else:
        end += max_no_of_posts_per_page

    all_posts = all_posts[start:end]
    u = "/?curr="
    # pagination logic

    # first page
    if curr == 0:
        prev = "#"
        next = u + str(curr + 1)
    # last page
    elif curr == last:
        next = "#"
        prev = u + str(curr - 1)
    else:
        # middle page

        prev = u + str(curr - 1)
        next = u + str(curr + 1)

    return render_template('index.html', params = params, posts = all_posts, next = next, prev = prev, curr=curr, last=last)


@app.route('/post/<string:slug>', methods = ['GET'])
def post(slug):
    single_post = Posts.query.filter_by(slug = slug).first()
    return render_template("post.html", params = params, post = single_post)


@app.route('/login', methods = ['GET', 'POST'])
def login():
    posts = Posts.query.all()
    if 'user' in session and session['user'] == params["admin_username"]:
        return redirect('/dashboard')
    if request.method == 'POST':
        username = request.form.get('uname')
        password = request.form.get('pass')
        if username == params.get('admin_username') and password == params.get('admin_password'):
            session['user'] = username
            return redirect('/dashboard')

    return render_template("login.html", params = params)


@app.route('/edit/<string:id>', methods = ['GET', 'POST'])
def edit(id):
    if 'user' in session and session['user'] == params["admin_username"]:

        if request.method == 'POST':
            # take all the parameters

            name = request.form.get('name')
            title = request.form.get('title')
            subtitle = request.form.get('subtitle')
            content = request.form.get('content')
            image_file = request.form.get('img_file')
            date_time = request.form.get('datetime')

            ''' if we want to add new post '''
            if id == '0':
                # just add to the database
                new_post = Posts(name = name, title = title, subtitle = subtitle,
                                 content = content, img_file = image_file, date = date_time)
                db.session.add(new_post)
                db.session.commit()
                slug = 'post' + str(new_post.id)
                new_post.slug = slug
                db.session.commit()

            else:
                ''' if we want to edit something '''
                # parameters of post by id should be filled already
                p = Posts.query.filter_by(id = id).first()
                # make a slug out of id
                slug = 'post' + str(id)
                p.name = name
                p.title = title
                p.subtitle = subtitle
                p.content = content
                p.img_file = image_file
                p.slug = slug
                db.session.commit()
            # return redirect('/edit/' + str(id))
        post = Posts.query.filter_by(id = id).first()
        return render_template('edit.html', params = params, post = post, id = id)


@app.route('/dashboard', methods = ['GET', 'POST'])
def dashboard():
    if 'user' in session and session['user'] == params["admin_username"]:
        posts = Posts.query.all()
        return render_template("dashboard.html", params = params, posts = posts)
    return redirect('/login')


@app.route('/about')
def about():
    return render_template("about.html", params = params)


@app.route('/contact', methods = ['GET', 'POST'])
def contact():
    if request.method == 'POST':
        name = request.form.get('name')
        email = request.form.get('email')
        phone = request.form.get('phone')
        message = request.form.get('msg')

        entry = Contacts(name = name, phoneNo = phone, message = message, date = datetime.now(), emailId = email)
        db.session.add(entry)
        db.session.commit()
        # mail.send_message('New message from ' + name,
        #                   sender=email,
        #                   recipients=[params['gmail-user']],
        #                   body=message + "\n" + phone
        #                   )
        flash(' We have received your response successfully','success')
    return render_template("contact.html", params = params)


app.run(debug = True)
