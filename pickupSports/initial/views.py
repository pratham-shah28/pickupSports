import base64
import io
from django.contrib.auth import login
from django.shortcuts import redirect, render
from django.http import HttpResponse
import pymysql
from requests import request
from .forms import AddCityForm, AddGroundForm, AddSectionForm, AddSportForm, FindFeedbackForm, UpdateSectionForm, forms
from initial.forms import UserRegistrationForm, GameCreationForm, GameUpdateForm, FeedBackForm, UserLoginForm, SearchGame, SelectCity, GroundForm, CityForm, SportGame, Comment, UserManagerRegistrationForm
from pickupSports.settings import DATABASES
from django.contrib import messages
import hashlib
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns


globals()["connection"] = None

def index(request):
    return HttpResponse("Hello, world. You're at the polls index.")

def start(request):
    return render(request, 'start.html')

def home(request):
    if 'username' not in request.session:
        messages.success(request, 'Please login first')
        return redirect("/")
    username = request.session.get('username')


    globals()["connection"] = pymysql.connect(host=DATABASES["default"]["HOST"],
                             user=DATABASES["default"]["USER"],
                             password=DATABASES["default"]["PASSWORD"],
                             database=DATABASES["default"]["NAME"],
                             cursorclass=pymysql.cursors.DictCursor)
    connection = globals()["connection"]
    
    with connection:
        with connection.cursor() as cursor:
            cursor.execute(f"SELECT check_if_staff('{username}') AS result;")
            result = cursor.fetchone()
            result = result['result']
        connection.commit()

    if result == 1:
        return render(request, 'manager_home.html', {'username': username})
    else:
        return render(request, 'home.html', {'username': username})

def register(request):
    if request.method == 'POST':

        form = UserRegistrationForm(request.POST)
        if form.is_valid():
            request.session["username"] = form.cleaned_data["username"]

            connection = pymysql.connect(host=DATABASES["default"]["HOST"],
                             user=DATABASES["default"]["USER"],
                             password=DATABASES["default"]["PASSWORD"],
                             database=DATABASES["default"]["NAME"],
                             cursorclass=pymysql.cursors.DictCursor)
            try:
                with connection:
                    with connection.cursor() as cursor:
                        a = cursor.callproc('create_user', args=(form.cleaned_data["username"],
                                                            form.cleaned_data["email"],
                                                            form.cleaned_data["date_of_birth"],
                                                            form.cleaned_data["phone_number"],
                                                            (hashlib.sha256(form.cleaned_data["password1"].encode()).hexdigest()),
                                                            form.cleaned_data["last_name"],
                                                            form.cleaned_data["first_name"],
                                                            form.cleaned_data["city"]))
                    connection.commit()
                    messages.success(request, 'Registration successful.')
            except Exception as e:

                messages.success(request, 'Registration failed, user with these credentials already exist')
                form = UserRegistrationForm()

            return redirect("/") # Change 'home' to the URL you want to redirect to after registration
    else:
        form = UserRegistrationForm()
    return render(request, 'register.html', {'form': form})

def register_manager(request):
    if request.method == 'POST':

        form = UserManagerRegistrationForm(request.POST)
        if form.is_valid():
            request.session["username"] = form.cleaned_data["username"]

            connection = pymysql.connect(host=DATABASES["default"]["HOST"],
                             user=DATABASES["default"]["USER"],
                             password=DATABASES["default"]["PASSWORD"],
                             database=DATABASES["default"]["NAME"],
                             cursorclass=pymysql.cursors.DictCursor)
            try:
                with connection:
                    with connection.cursor() as cursor:
                        a = cursor.callproc('create_manager', args=(form.cleaned_data["username"],
                                                            form.cleaned_data["email"],
                                                            form.cleaned_data["date_of_birth"],
                                                            form.cleaned_data["phone_number"],
                                                            (hashlib.sha256(form.cleaned_data["password1"].encode()).hexdigest()),
                                                            form.cleaned_data["last_name"],
                                                            form.cleaned_data["first_name"],
                                                            form.cleaned_data["city"]))
                    connection.commit()
                    messages.success(request, 'Registration successful.')
            except Exception as e:

                messages.success(request, 'Registration failed, manager with these credentials already exist')
                form = UserManagerRegistrationForm()

            return redirect("/") # Change 'home' to the URL you want to redirect to after registration
    else:
        form = UserManagerRegistrationForm()
    return render(request, 'register_manager.html', {'form': form})


def game(request):
    if 'username' not in request.session:
        messages.success(request, 'Please login first')
        return redirect("/")
    
    username = request.session.get('username')
    if request.method != 'POST':
        #form1 = GroundForm(username_n=globals()["username"])
        form1 = GroundForm(username_n=username)
        return render(request, 'game.html', { 'form1': form1})
    else:
        ground = request.POST.get("ground_choices")
        if request.method == 'POST' and request.POST.get("start_time"):
            start_time = request.POST.get("start_time")
            end_time = request.POST.get("end_time")
            if start_time >= end_time:
                messages.error(request, "Start time has to be less than end time")
                return redirect('/game')
            num_players = 1
            max_players = request.POST.get("max_players")
            section_id = request.POST.get("section_choices")
            sport = request.POST.get("sport_choices")

            connection = pymysql.connect(host=DATABASES["default"]["HOST"],
                            user=DATABASES["default"]["USER"],
                            password=DATABASES["default"]["PASSWORD"],
                            database=DATABASES["default"]["NAME"],
                            cursorclass=pymysql.cursors.DictCursor)
            
            with connection:
                with connection.cursor() as cursor:
                    # Create a new record
                    sql = "INSERT INTO `game` (`start_time`, `end_time`, `num_players`, `max_players`, `section_id`, `creator_username`, `sport_name`) VALUES (%s, %s, %s, %s, %s, %s, %s);"
                    # cursor.execute(sql, (start_time, end_time, num_players, max_players, section_id, username, sport))
                    cursor.callproc("create_game",args=[start_time,end_time,num_players,max_players,sport,section_id,username])
                    #cursor.execute(f"INSERT INTO `game` (`start_time`, `end_time`, `num_players`, `max_players`, `section_id`) VALUES ('{start_time}', '{end_time}', {num_players}, '{max_players}', '{section_id}')")
                connection.commit()
            #connection.close()

            return redirect("/home") # Change 'home' to the URL you want to redirect to after registration
        else:
            form2 = GameCreationForm(ground)
        return render(request, 'game.html', {'form2': form2})



def feedback(request):
    # if 'username' not in request.session:
    #     messages.success(request, 'Please login first')
    #     return redirect("/")
    
    # if request.method == 'POST':
    #     form = FeedBackForm(request.POST)
    #     if form.is_valid():
    #         feedback_description = form.cleaned_data["feedback"]
    #         section = form.cleaned_data["section"]
    #         rating = form.cleaned_data["rating"]
    #         connection = pymysql.connect(host=DATABASES["default"]["HOST"],
    #                          user=DATABASES["default"]["USER"],
    #                          password=DATABASES["default"]["PASSWORD"],
    #                          database=DATABASES["default"]["NAME"],
    #                          cursorclass=pymysql.cursors.DictCursor)
    #         with connection:
    #             with connection.cursor() as cursor:
    #                 sql = "INSERT INTO `game` (`start_time`, `end_time`, `num_players`, `max_players`) VALUES (%s, %s, %s, %s);"
    #                 cursor.execute(sql, (start_time, end_time, num_players, max_players))
    #             connection.commit()

    #         return redirect("/") # Change 'home' to the URL you want to redirect to after registration
    # else:
    #     form = FeedBackForm()
    # return render(request, 'feedback.html', {'form': form})
    if 'username' not in request.session:
        messages.success(request, 'Please login first')
        return redirect("/")
    
    username = request.session.get('username')

    connection = pymysql.connect(host=DATABASES["default"]["HOST"],
                             user=DATABASES["default"]["USER"],
                             password=DATABASES["default"]["PASSWORD"],
                             database=DATABASES["default"]["NAME"],
                             cursorclass=pymysql.cursors.DictCursor)
            
    with connection:
        with connection.cursor() as cursor:
            cursor.callproc("get_games_by_creator", args=[username])
            result = cursor.fetchall()
            cursor.callproc("get_games_joined", args=[username])
            result2 = cursor.fetchall()
            cursor.callproc("past_games", args = [username])
            result3 = cursor.fetchall()

        connection.commit()
    


    return render(request, 'feedback.html', {'game_data': result, 'game_data_2': result2, 'game_data_3': result3})

def giveFeedback(request, game_id):
    if 'username' not in request.session:
        messages.success(request, 'Please login first')
        return redirect("/")
    section_id = None
    connection = pymysql.connect(host=DATABASES["default"]["HOST"],
                             user=DATABASES["default"]["USER"],
                             password=DATABASES["default"]["PASSWORD"],
                             database=DATABASES["default"]["NAME"],
                             cursorclass=pymysql.cursors.DictCursor)
    if request.method == 'POST':
        form = FeedBackForm(request.POST)
        #rating = form.cleaned_data["rating"]
        rating = request.POST.get("rating")
        feedback = request.POST.get("feedback")
        with connection:
            with connection.cursor() as cursor:
                cursor.callproc("get_section_id", args=[game_id])
                section_id = cursor.fetchone()
                section_id = section_id['section_id'] 
                cursor.callproc("create_feedback", args=[rating, feedback,request.session.get('username'), section_id ])
            connection.commit()
        messages.success(request, "Feedback submitted.")
        return redirect("/home")

    else:    
        with connection:
            with connection.cursor() as cursor: 
                cursor.callproc("section_ground_from_game", args=[game_id])
                result = cursor.fetchall()
            connection.commit()
        feedback_data = result[0]
        section_name = feedback_data.get('section_name')
        ground_name = feedback_data.get('ground_name')
        section_id = feedback_data.get('section_id')

        initial_data = {'section_name': section_name,
                        'ground_name': ground_name
                        }
        
        extra_data = {'game_id': game_id}
        
        feedback_form = FeedBackForm()

        return render(request, 'give_feedback.html', {'feedback_data': feedback_data, 'feedback_form': feedback_form})


def login(request):
    request.session.pop('username', None)
    if request.method == 'POST':
        form = UserLoginForm(request.POST)
        if form.is_valid():
            globals()["connection"] = pymysql.connect(host=DATABASES["default"]["HOST"],
                             user=DATABASES["default"]["USER"],
                             password=DATABASES["default"]["PASSWORD"],
                             database=DATABASES["default"]["NAME"],
                             cursorclass=pymysql.cursors.DictCursor)
            connection = globals()["connection"]
            try:
                with connection:
                    with connection.cursor() as cursor:
                        username  = form.cleaned_data["username"]
                        
                        password = (hashlib.sha256(form.cleaned_data["password"].encode()).hexdigest())
                        cursor.execute(f"SELECT auth_login('{username}', NULL, '{password}') AS Result;")
                        result = cursor.fetchone()
                        result = result['Result']
                    connection.commit()
                

                    if (result == 'Login successful'):
 
                        request.session["username"] = username
                        globals()["username"] = username
                        messages.success(request, f'{result}')
                    else:
                        raise Exception("Invalid")
                #connection.close()
            

            except Exception as e:
                messages.success(request, f'{result}')
                form = UserLoginForm()

            return redirect("/home") # Change 'home' to the URL you want to redirect to after registration
    else:
        form = UserLoginForm()
    return render(request, 'login.html', {'form': form})

def searchGame(request):
    if 'username' not in request.session:
        messages.success(request, 'Please login first')
        return redirect("/")
    
    if request.method == 'POST':
        form = SearchGame(request.POST)
        if form.is_valid():
            pass
    else:
        form = SearchGame()
    return render(request, 'home.html', {'form': form})

def logout(request):
    if 'username' not in request.session:
        messages.success(request, 'Please login first')
        return redirect("/")
    
    username = request.session.get('username', None)

    if(username):
        request.session.pop('username', None)
    else:
        messages.error(request, "No username key")
    return render(request, 'logout.html')

def myGames(request):
    if 'username' not in request.session:
        messages.success(request, 'Please login first')
        return redirect("/")
    
    username = request.session.get('username')

    connection = pymysql.connect(host=DATABASES["default"]["HOST"],
                             user=DATABASES["default"]["USER"],
                             password=DATABASES["default"]["PASSWORD"],
                             database=DATABASES["default"]["NAME"],
                             cursorclass=pymysql.cursors.DictCursor)
            
    with connection:
        with connection.cursor() as cursor:
            cursor.callproc("get_games_by_creator", args=[username])
            result = cursor.fetchall()
            cursor.callproc("get_games_joined", args=[username])
            result2 = cursor.fetchall()
            cursor.callproc("past_games", args = [username])
            result3 = cursor.fetchall()
        connection.commit()
    #connection.close()
    
    return render(request, 'myGames.html', {'game_data': result, 'game_data_2': result2, 'game_data_3': result3})

def update_game(request, game_id):
    if 'username' not in request.session:
        messages.success(request, 'Please login first')
        return redirect("/")
    username = request.session.get("username")
    
    connection = pymysql.connect(host=DATABASES["default"]["HOST"],
                             user=DATABASES["default"]["USER"],
                             password=DATABASES["default"]["PASSWORD"],
                             database=DATABASES["default"]["NAME"],
                             cursorclass=pymysql.cursors.DictCursor)
    
    with connection:
        with connection.cursor() as cursor:
            sql = "SELECT `ground_id` FROM `section` JOIN `game` ON `game`.`section_id` = `section`.`section_id` WHERE `game`.`game_id` = %s;"
            cursor.execute(sql, (game_id))
            ground_id = cursor.fetchall()[0].get('ground_id')  
            cursor.callproc("get_game_by_id", args=[game_id])
            result = cursor.fetchall()
            cursor.execute(f"SELECT get_player_count('{game_id}') AS player_count;")
            player_count = cursor.fetchone()
            player_count = player_count['player_count']
        connection.commit()
    #connection.close()
    
    # [{'game_id': 1, 'start_time': datetime.datetime(2023, 11, 27, 16, 4), 'end_time': datetime.datetime(2023, 11, 28, 16, 4), 'num_players': 2, 'max_players': 1, 'sport_name': None, 'section_id': 2, 'creator_username': 'janedoe'}]
    game_data = result[0]

    start_time = game_data.get('start_time').strftime('%Y-%m-%dT%H:%M:%S')
    end_time = game_data.get('end_time').strftime('%Y-%m-%dT%H:%M:%S')
    num_players = game_data.get('num_players')
    max_players = game_data.get('max_players')

    initial_data = {'start_time': start_time,
                    'end_time': end_time,
                    'num_players': game_data.get('num_players'),
                    'max_players': game_data.get('max_players'),
                    'sport_name': game_data.get('sport_name'),
                    'section_id': game_data.get('section_id')}
    
    extra_data = {'game_id': game_id}

    if request.method == 'POST':
        update_form = GameUpdateForm(request.POST, min_value = player_count )
        if update_form.is_valid():
            start_time = update_form.cleaned_data["start_time"]
            end_time = update_form.cleaned_data["end_time"]
            max_players = update_form.cleaned_data["max_players"]
            num_players = update_form.cleaned_data["num_players"]
            connection = pymysql.connect(host=DATABASES["default"]["HOST"],
                                         user=DATABASES["default"]["USER"],
                                         password=DATABASES["default"]["PASSWORD"],
                                         database=DATABASES["default"]["NAME"],
                                         cursorclass=pymysql.cursors.DictCursor)
            

            with connection:
                with connection.cursor() as cursor:
      
                    cursor.callproc("edit_game", args=[game_id, start_time, end_time, num_players, max_players, game_data.get('sport_name'), game_data.get('section_id')])
                connection.commit()
        else:
            return render(request, 'update_game.html', {'game_data': game_data, 'form': update_form})

        return redirect("/home")
    else:
        update_form = GameUpdateForm(initial = initial_data, min_value = player_count)

    return render(request, 'update_game.html', {'game_data': game_data, 'form': update_form})

def deleteGame(request):
    if 'username' not in request.session:
        messages.success(request, 'Please login first')
        return redirect("/")
    
    username = request.session.get('username')
    connection = globals()["connection"]
    with connection:
        with connection.cursor() as cursor:
            cursor.callproc("get_games_by_creator", args=[username])
            result = cursor.fetchall()
        connection.commit()
    #connection.close()

    return render(request, 'myGames.html', {'game_data': result})

def delete_game(request, game_id):
    if 'username' not in request.session:
        messages.success(request, 'Please login first')
        return redirect("/")
    
    if request.method == 'POST':
        connection = pymysql.connect(host=DATABASES["default"]["HOST"],
                                         user=DATABASES["default"]["USER"],
                                         password=DATABASES["default"]["PASSWORD"],
                                         database=DATABASES["default"]["NAME"],
                                         cursorclass=pymysql.cursors.DictCursor)
            

        with connection:
            with connection.cursor() as cursor:
                cursor.callproc("delete_game", args=[game_id])
            connection.commit()
        return redirect("/my_games")

    return render(request, 'delete_game.html')

def changeCity(request):
    if request.method == 'POST':
        form = CityForm(request.POST)
        if form.is_valid():
            username = request.session.get("username")
            city = form.cleaned_data["city"]
            connection = pymysql.connect(host=DATABASES["default"]["HOST"],
                                         user=DATABASES["default"]["USER"],
                                         password=DATABASES["default"]["PASSWORD"],
                                         database=DATABASES["default"]["NAME"],
                                         cursorclass=pymysql.cursors.DictCursor)
            with connection:
                with connection.cursor() as cursor:
                    cursor.callproc("edit_city", args=[username, city])
                    result = cursor.fetchall()
                connection.commit()
            messages.success(request,"Edited city.")
            return redirect("/home")
    else:
        form = CityForm()
    return render(request, 'city.html', {'form': form})

def sport_games(request):
    if 'username' not in request.session:
        messages.success(request, 'Please login first')
        return redirect("/")
    
    username = request.session.get('username')

    if request.method != 'POST':
        form = SportGame(username_n=username)
        return render(request, 'availableGameSport.html', { 'form': form})
    elif request.method == 'POST' and request.POST.get("sport_choices"):
        sport = request.POST.get("sport_choices")

        connection = pymysql.connect(host=DATABASES["default"]["HOST"],
                                user=DATABASES["default"]["USER"],
                                password=DATABASES["default"]["PASSWORD"],
                                database=DATABASES["default"]["NAME"],
                                cursorclass=pymysql.cursors.DictCursor)
        with connection:
            with connection.cursor() as cursor:
                cursor.execute(f"SELECT get_user_city('{username}') AS Result;")
                city = cursor.fetchone()
                city = city['Result']
                cursor.callproc("get_games_sport_city", args=[sport, city, username])
                result = cursor.fetchall()
            connection.commit()
        #connection.close()

        return render(request, 'sportGames.html', {'game_data': result})    
    return render(request, 'myGames.html', {'game_data': result})

def joinGame(request, game_id):
    if 'username' not in request.session:
        messages.success(request, 'Please login first')
        return redirect("/")
    username = request.session.get("username")
    if request.method == 'GET':
        connection = pymysql.connect(host=DATABASES["default"]["HOST"],
                                         user=DATABASES["default"]["USER"],
                                         password=DATABASES["default"]["PASSWORD"],
                                         database=DATABASES["default"]["NAME"],
                                         cursorclass=pymysql.cursors.DictCursor)
            
        with connection:
            with connection.cursor() as cursor:
                cursor.callproc("insert_user_user_join_game", args=[username, game_id])
            connection.commit()
        #connection.close()
        messages.success(request, "Game joined successfully")
        return redirect("/home")

    return render(request, 'sportgames.html')

def leaveGame(request, game_id):
    if 'username' not in request.session:
        messages.success(request, 'Please login first')
        return redirect("/")
    username = request.session.get("username")
    connection = pymysql.connect(host=DATABASES["default"]["HOST"],
                                         user=DATABASES["default"]["USER"],
                                         password=DATABASES["default"]["PASSWORD"],
                                         database=DATABASES["default"]["NAME"],
                                         cursorclass=pymysql.cursors.DictCursor)
            
    with connection:
        with connection.cursor() as cursor:
            cursor.callproc("delete_participant", args=[game_id, username])
        connection.commit()
    return redirect('/my_games')

def comments(request, game_id):
    if 'username' not in request.session:
        messages.success(request, 'Please login first')
        return redirect("/")
    username = request.session.get("username")
    connection = pymysql.connect(host=DATABASES["default"]["HOST"],
                                         user=DATABASES["default"]["USER"],
                                         password=DATABASES["default"]["PASSWORD"],
                                         database=DATABASES["default"]["NAME"],
                                         cursorclass=pymysql.cursors.DictCursor)
    if request.method == 'POST':
        form = Comment(request.POST)
        with connection:
            with connection.cursor() as cursor:
                    cursor.callproc("insert_comment", args=[username, game_id, request.POST.get("comment")])
                    comments = cursor.fetchall()
            connection.commit()
        #connection.close()
        return redirect('/comments/{}'.format(game_id))
        
    else:
        with connection:
            with connection.cursor() as cursor:
                cursor.callproc("get_comment", args=[game_id])
                comments = cursor.fetchall()
            connection.commit()
        #connection.close()
        form = Comment()
        return render(request, 'comment.html', {'comments': comments, 'form':form})
    
def cities(request):
    if 'username' not in request.session:
        messages.success(request, 'Please login first')
        return redirect("/")

    connection = pymysql.connect(host=DATABASES["default"]["HOST"],
                             user=DATABASES["default"]["USER"],
                             password=DATABASES["default"]["PASSWORD"],
                             database=DATABASES["default"]["NAME"],
                             cursorclass=pymysql.cursors.DictCursor)
            
    with connection:
        with connection.cursor() as cursor:
            cursor.callproc("get_city")
            result = cursor.fetchall()
        connection.commit()
    #connection.close()
    


    return render(request, 'cities.html', {'city_data': result})

def addCity(request):
    if 'username' not in request.session:
        messages.success(request, 'Please login first')
        return redirect("/")
    
    if request.method == 'POST':
        form = AddCityForm(request.POST)
        connection = pymysql.connect(host=DATABASES["default"]["HOST"],
                             user=DATABASES["default"]["USER"],
                             password=DATABASES["default"]["PASSWORD"],
                             database=DATABASES["default"]["NAME"],
                             cursorclass=pymysql.cursors.DictCursor)
        
        if form.is_valid():
            city = form.cleaned_data["city"]
            state = form.cleaned_data["state"]
            country = form.cleaned_data["country"]
            with connection:
                with connection.cursor() as cursor:
                    cursor.callproc("add_city", args=[city, state, country])
                connection.commit()
            #connection.close()
            return redirect('/cities')
    else:
        form = AddCityForm()
    return render(request, 'add_city.html', {'form': form})


def grounds(request):
    if 'username' not in request.session:
        messages.success(request, 'Please login first')
        return redirect("/")

    connection = pymysql.connect(host=DATABASES["default"]["HOST"],
                                 user=DATABASES["default"]["USER"],
                                 password=DATABASES["default"]["PASSWORD"],
                                 database=DATABASES["default"]["NAME"],
                                 cursorclass=pymysql.cursors.DictCursor)

    with connection:
        with connection.cursor() as cursor:
            cursor.callproc("get_grounds")
            result = cursor.fetchall()
        connection.commit()
    #connection.close()

    return render(request, 'grounds.html', {'ground_data': result})

def addGround(request):
    if 'username' not in request.session:
        messages.success(request, 'Please login first')
        return redirect("/")

    if request.method == 'POST':
        ground_form = AddGroundForm(request.POST)
        if ground_form.is_valid():
            ground_name = request.POST.get('ground_name')
            city = request.POST.get('city')
            zipcode = request.POST.get('zipcode')

            connection = pymysql.connect(host=DATABASES["default"]["HOST"],
                                         user=DATABASES["default"]["USER"],
                                         password=DATABASES["default"]["PASSWORD"],
                                         database=DATABASES["default"]["NAME"],
                                         cursorclass=pymysql.cursors.DictCursor)

            with connection:
                with connection.cursor() as cursor:
                    cursor.callproc("add_ground", [ground_name, city, zipcode])
                connection.commit()
            #connection.close()
        return redirect("/grounds")

    else:
        ground_form = AddGroundForm()

    return render(request, 'add_ground.html', {'ground_form': ground_form})

def addSection(request, ground_id):
    if 'username' not in request.session:
        messages.success(request, 'Please login first')
        return redirect("/")

    if request.method == 'POST':
        section_form = AddSectionForm()
        if section_form.is_valid():
            section_name = section_form.cleaned_data["start_time"]
            field_type = section_form.cleaned_data["end_time"]
            indoor = section_form.cleaned_data["max_players"]

            connection = pymysql.connect(host=DATABASES["default"]["HOST"],
                                         user=DATABASES["default"]["USER"],
                                         password=DATABASES["default"]["PASSWORD"],
                                         database=DATABASES["default"]["NAME"],
                                         cursorclass=pymysql.cursors.DictCursor)

            with connection:
                with connection.cursor() as cursor:
                    cursor.callproc("add_section", args=[section_name, ground_id, field_type, indoor])
                connection.commit()
        return redirect("/grounds")
    else:
        section_form = AddSectionForm()

    return render(request, 'add_section.html', {'section_form': section_form})


def sports(request):
    if 'username' not in request.session:
        messages.success(request, 'Please login first')
        return redirect("/")

    connection = pymysql.connect(host=DATABASES["default"]["HOST"],
                                 user=DATABASES["default"]["USER"],
                                 password=DATABASES["default"]["PASSWORD"],
                                 database=DATABASES["default"]["NAME"],
                                 cursorclass=pymysql.cursors.DictCursor)

    with connection:
        with connection.cursor() as cursor:
            cursor.callproc("get_sports")
            result = cursor.fetchall()
        connection.commit()
    #connection.close()

    return render(request, 'sports.html', {'sport_data': result})

def addSport(request):
    if 'username' not in request.session:
        messages.success(request, 'Please login first')
        return redirect("/")

    if request.method == 'POST':
        sport_form = AddSportForm(request.POST)
        sport_name = request.POST.get('sport_name')
        teams = request.POST.get('teams')

        connection = pymysql.connect(host=DATABASES["default"]["HOST"],
                                     user=DATABASES["default"]["USER"],
                                     password=DATABASES["default"]["PASSWORD"],
                                     database=DATABASES["default"]["NAME"],
                                     cursorclass=pymysql.cursors.DictCursor)

        with connection:
            with connection.cursor() as cursor:
                cursor.callproc("add_sport", [sport_name, teams])
            connection.commit()
        #connection.close()
        return redirect("/sports")

    else:
        sport_form = AddSportForm()

    return render(request, 'add_sport.html', {'sport_form': sport_form})

def analytics(request):
    if 'username' not in request.session:
        messages.success(request, 'Please login first')
        return redirect("/")
    
    connection = pymysql.connect(host=DATABASES["default"]["HOST"],
                                     user=DATABASES["default"]["USER"],
                                     password=DATABASES["default"]["PASSWORD"],
                                     database=DATABASES["default"]["NAME"],
                                     cursorclass=pymysql.cursors.DictCursor)
    username = request.session.get("username")
    
    with connection:
            with connection.cursor() as cursor:
                cursor.execute(f"SELECT get_user_city('{username}') AS Result;")
                city = cursor.fetchone()
                city = city['Result']
                cursor.callproc("city_sports_count", [city])
                result1 = cursor.fetchall()
                
                # df = pd.DataFrame(data)
                labels = [entry['sport_name'] for entry in result1]
                data = [entry['sport_count'] for entry in result1]
                palette = sns.color_palette('pastel')[:len(result1)]
                fig, ax = plt.subplots(figsize=(8, 8))
                ax.pie(data, labels=labels, autopct='%1.1f%%', startangle=140, colors=palette)
                ax.set_title('Sports Distribution for games in {}'.format(city))

                # Save the plot as an image
                buffer = io.BytesIO()
                plt.savefig(buffer, format='png')
                buffer.seek(0)

                # Convert the image to base64 encoding
                image_base64 = base64.b64encode(buffer.read()).decode('utf-8')

            
    
                buffer.close()
                cursor.callproc("city_ground_count", [city])
                result2 = cursor.fetchall()
                labels2 = [entry['ground_name'] for entry in result2]
                data2 = [entry['sport_count'] for entry in result2]
                palette2 = sns.color_palette('pastel')[:len(result2)]

                fig, ax = plt.subplots(figsize=(8, 8))
                ax.pie(data2, labels=labels2, autopct='%1.1f%%', startangle=140, colors=palette)
                ax.set_title('Ground Distribution for games in {}'.format(city))

                # Save the plot as an image
                buffer = io.BytesIO()
                plt.savefig(buffer, format='png')
                buffer.seek(0)

                # Convert the image to base64 encoding
                image_base642 = base64.b64encode(buffer.read()).decode('utf-8')



                cursor.callproc("city_ground_feedback", [city])
                result3 = cursor.fetchall()
                labels3 = [entry['ground_name'] for entry in result3]
                data3 = [entry['avg_rating'] for entry in result3]
                palette3 = sns.color_palette('pastel')[:len(result3)]

                fig, ax = plt.subplots(figsize=(8, 6))
                bars = ax.bar(labels3, data3, color=sns.color_palette('pastel')[:len(result3)])
                ax.set_title('Ground ratings in {}'.format(city))

                # Save the plot as an image
                buffer = io.BytesIO()
                plt.savefig(buffer, format='png')
                buffer.seek(0)

                # Convert the image to base64 encoding
                image_base6423 = base64.b64encode(buffer.read()).decode('utf-8')
                context = {'image_base64': image_base64, 'image_base642': image_base642, 'image_base6423' : image_base6423, 'city': city}
            connection.commit()
    
    return render(request, 'analytics.html', context)

def updateSection(request, ground_id, section_id):
    if 'username' not in request.session:
        messages.success(request, 'Please login first')
        return redirect("/")

    if request.method == 'POST':
        update_section_form = UpdateSectionForm(request.POST)
        if update_section_form.is_valid():
            section_name = update_section_form.cleaned_data["section_name"]
            field_type = update_section_form.cleaned_data["field_type"]
            indoor = update_section_form.cleaned_data["indoor"]

            connection = pymysql.connect(host=DATABASES["default"]["HOST"],
                                         user=DATABASES["default"]["USER"],
                                         password=DATABASES["default"]["PASSWORD"],
                                         database=DATABASES["default"]["NAME"],
                                         cursorclass=pymysql.cursors.DictCursor)

            with connection:
                with connection.cursor() as cursor:
                    cursor.callproc("update_section", args=[section_id, section_name, field_type, indoor])
                connection.commit()
        return redirect(f"/sections/{ground_id}/")
    else:
        update_section_form = UpdateSectionForm()

    return render(request, 'update_section.html', {'update_section_form': update_section_form})


def sections(request, ground_id):
    if 'username' not in request.session:
        messages.success(request, 'Please login first')
        return redirect("/")

    connection = pymysql.connect(host=DATABASES["default"]["HOST"],
                                 user=DATABASES["default"]["USER"],
                                 password=DATABASES["default"]["PASSWORD"],
                                 database=DATABASES["default"]["NAME"],
                                 cursorclass=pymysql.cursors.DictCursor)


    with connection:
        with connection.cursor() as cursor:
            cursor.callproc("get_section", [ground_id])
            result = cursor.fetchall()
        connection.commit()
    #connection.close()

    return render(request, 'sections.html', {'section_data': result, 'ground_id': ground_id})

def viewFeedbacks(request):
    if 'username' not in request.session:
        messages.success(request, 'Please login first')
        return redirect("/")
    username = request.session.get("username")
    result = []
    if request.method == 'POST':
        form = FindFeedbackForm(username_n = username)        
        ground_id = request.POST.get("ground_id")
        connection = pymysql.connect(host=DATABASES["default"]["HOST"],
                                        user=DATABASES["default"]["USER"],
                                        password=DATABASES["default"]["PASSWORD"],
                                        database=DATABASES["default"]["NAME"],
                                        cursorclass=pymysql.cursors.DictCursor)
        #connection = globals()['connection']

        with connection:
            with connection.cursor() as cursor:
                cursor.callproc("get_feedback_search", args=[ground_id])
                result = cursor.fetchall()
            connection.commit()
            #connection.close()
        return render(request, 'view_feedbacks.html', {'form': form, 'feedback_data': result})
    else:
        form = FindFeedbackForm(username_n = username)
        return render(request, 'view_feedbacks.html', {'form': form, 'feedback_data': result})


