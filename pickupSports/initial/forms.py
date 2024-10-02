from django import forms
from django.contrib.auth.forms import UserCreationForm
from phonenumber_field.formfields import PhoneNumberField
import pymysql.cursors
from requests import request
from django.core.validators import MaxLengthValidator
#from views import start_date
from pickupSports.settings import DATABASES

class UserRegistrationForm(UserCreationForm):
    username = forms.CharField(validators=[
        MaxLengthValidator(64)  # Set your desired maximum length
    ])
    email = forms.EmailField(required=True)
    first_name = forms.CharField(required=True)
    last_name = forms.CharField(required=True)
    date_of_birth = forms.DateField(widget=forms.TextInput(attrs={'type': 'date'}))
    phone_number = forms.CharField(required=False)
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
    globals()['city_choices'] = [
        
    ]
    for i in result:
        globals()['city_choices'].append((i['city'], i['city']))
    city = forms.ChoiceField(choices=globals()['city_choices'], widget=forms.Select)


class UserLoginForm(forms.Form):
    email_or_username = forms.CharField(required=True)
    password = forms.CharField(widget=forms.PasswordInput())
    class Meta:
        fields = ['email/username','password']
    
class GroundForm(forms.Form):
    ground_choices = forms.ChoiceField(choices=(), widget=forms.Select)
    def __init__(self,*args, **kwargs):
        try:
            self.username_n = kwargs.pop('username_n')
            super(GroundForm, self).__init__(*args, **kwargs)
            connection = pymysql.connect(host=DATABASES["default"]["HOST"],
                                    user=DATABASES["default"]["USER"],
                                    password=DATABASES["default"]["PASSWORD"],
                                    database=DATABASES["default"]["NAME"],
                                    cursorclass=pymysql.cursors.DictCursor)
                    
            with connection:
                with connection.cursor() as cursor:
                    cursor.execute(f"SELECT get_user_city('{self.username_n}') AS Result;")
                    city = cursor.fetchone()
                    city = city['Result']
                    cursor.callproc("get_ground", args=[city])
                    result = cursor.fetchall()
                connection.commit()

            # # choices = [(ground['ground_id'], ground['ground_name']) for ground in result]
            # # self.fields['ground_choices'].choices = choices
            # choices = [(ground['ground_id'], ground['ground_name']) for ground in result]
            # self.fields['ground_choices'] = forms.ChoiceField(choices=choices, widget=forms.Select)

            # self.fields['ground_choices'].widget.choices = [(ground["ground_id"], ground["ground_name"]) for ground in result]
            #GroundForm.ground_choices.widget.choices = [(ground["ground_id"], ground["ground_name"]) for ground in result]
            #GroundForm.base_fields['ground_choices'].widget.choices = [(ground["ground_id"], ground["ground_name"]) for ground in result]
            self.fields['ground_choices'].choices = [
                (ground['ground_id'], ground['ground_name']) for ground in result
            ]
            # choices = []
            # for ground in result:
            #     choices.append((ground["ground_id"], ground["ground_name"]))
            # self.fields['ground_choices'].choices = [
            #     (ground['ground_id'], ground['ground_name']) for ground in result
            # ]
        except:
            super(GroundForm, self).__init__(*args, **kwargs)
    ground_choices = forms.ChoiceField(choices=[])

class GameCreationForm(forms.Form):
    def __init__(self, ground_id, *args, **kwargs):
        super(GameCreationForm, self).__init__(*args, **kwargs)
        self.ground_id = ground_id
        connection = pymysql.connect(host=DATABASES["default"]["HOST"],
                             user=DATABASES["default"]["USER"],
                             password=DATABASES["default"]["PASSWORD"],
                             database=DATABASES["default"]["NAME"],
                             cursorclass=pymysql.cursors.DictCursor)
            
        with connection:
            with connection.cursor() as cursor:
                cursor.callproc("get_section", args=[self.ground_id])
                result = cursor.fetchall()
                cursor.callproc("get_sports")
                result_sports = cursor.fetchall()
            connection.commit()
        self.fields['section_choices'].choices = [
            (section['section_id'], section['section_name']) for section in result
        ]


        self.fields['sport_choices'].choices = [
            (sport['sport_name'], sport['sport_name']) for sport in result_sports
        ]
    
    
    start_time = forms.DateTimeField(widget=forms.DateTimeInput(attrs = {'type':'datetime-local'}))
    end_time = forms.DateTimeField(widget=forms.DateTimeInput(attrs = {'type':'datetime-local'}))
    max_players = forms.IntegerField(label="Expected players")
    section_choices = forms.ChoiceField(choices=[], label="Section")
    sport_choices =  forms.ChoiceField(choices=[], label= "Sport")

class UserManagerRegistrationForm(UserCreationForm):
    username = forms.CharField(validators=[
        MaxLengthValidator(64)  # Set your desired maximum length
    ])
    email = forms.EmailField(required=True)
    first_name = forms.CharField(required=True)
    last_name = forms.CharField(required=True)
    date_of_birth = forms.DateField(widget=forms.TextInput(attrs={'type': 'date'}))
    phone_number = forms.CharField(required=False)
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
    globals()['city_choices'] = [

    ]
    for i in result:
        globals()['city_choices'].append((i['city'], i['city']))
    city = forms.ChoiceField(choices=globals()['city_choices'], widget=forms.Select)

    
class GameUpdateForm(forms.Form):
    def __init__(self, *args, **kwargs):
        min_value = kwargs.pop('min_value', None)
        start_time = kwargs.pop('start_time', None)
        end_time = kwargs.pop('end_time', None)
        num_players = kwargs.pop('num_players', None)
        max_players = kwargs.pop('max_players', None)
        self.start_time = start_time
        self.end_time = end_time
        self.max_players = max_players
        self.num_players = num_players
        self.min_value = min_value
        super(GameUpdateForm, self).__init__(*args, **kwargs)
    def clean_num_players(self):
        value = self.cleaned_data['num_players']
        if self.min_value is not None and value < self.min_value:
            raise forms.ValidationError(f'This field must be greater than or equal to {self.min_value}.')

        return value

    start_time = forms.DateTimeField(widget=forms.DateTimeInput(attrs={'type': 'datetime-local'}))
    end_time = forms.DateTimeField(widget=forms.DateTimeInput(attrs={'type': 'datetime-local'}))
    num_players = forms.IntegerField()
    max_players = forms.IntegerField(label="Expected players")


class PlayerUpdateForm(forms.Form):

    def __init__(self, *args, **kwargs):
        max_players = kwargs.pop('max_players', None)
        super(PlayerUpdateForm, self).__init__(*args, **kwargs)
        self.max_players = max_players

    def clean_num_players(self):
        num_players = self.cleaned_data.get('num_players')
        if num_players and self.max_players and num_players > self.max_players:
            raise forms.ValidationError("Number of players cannot be greater than max players.")
        return num_players
    start_time = forms.DateTimeField(widget=forms.DateTimeInput(attrs={'type': 'datetime-local'}))
    end_time = forms.DateTimeField(widget=forms.DateTimeInput(attrs={'type': 'datetime-local'}))
    num_players = forms.IntegerField()
    max_players = forms.IntegerField(label="Number of players")


class FeedBackForm(forms.Form):
    RATING_CHOICES = [
        (1, '1'),
        (2, '2'),
        (3, '3'),
        (4, '4'),
        (5, '5'),
    ]
    # SECTION_CHOICES = [
    #     (1, '1'),
    #     (2, '2'),
    #     (3, '3'),
    #     (4, '4'),
    #     (5, '5'),
    # ] 
    
    feedback = forms.CharField(widget=forms.Textarea(attrs={'rows': 4, 'cols': 40}), required=False)
    rating = forms.ChoiceField(choices=RATING_CHOICES, widget=forms.RadioSelect)
    # section = forms.ChoiceField(choices=SECTION_CHOICES, widget=forms.Select)

class UserLoginForm(forms.Form):
    username = forms.CharField(required=True)
    password = forms.CharField(widget=forms.PasswordInput())
    class Meta:
        fields = ['username','password']

class SearchGame(forms.Form):
    sport_choices = [
        (1, '1'),
        (2, '2'),
        (3, '3'),
        (4, '4'),
        (5, '5'),
    ]
    sport = forms.ChoiceField(choices = sport_choices, widget=forms.Select)

class SelectCity(forms.Form):
    connection = pymysql.connect(host=DATABASES["default"]["HOST"],
                             user=DATABASES["default"]["USER"],
                             password=DATABASES["default"]["PASSWORD"],
                             database=DATABASES["default"]["NAME"],
                             cursorclass=pymysql.cursors.DictCursor)
            
    with connection:
        with connection.cursor() as cursor:
            # Create a new record
            # sql = "INSERT INTO `game` (`start_time`, `end_time`, `num_players`, `max_players`) VALUES (%s, %s, %s, %s);"
            # cursor.execute(sql, (start_time, end_time, num_players, max_players))
            cursor.callproc("get_city")
            result = cursor.fetchall()
        connection.commit()
    city_choices = [
        
    ]
    for i in result:
        city_choices.append((i['city'], i['city']))
    city = forms.ChoiceField(choices=city_choices, widget=forms.Select)

class GroundSelection(forms.Form):
    connection = pymysql.connect(host=DATABASES["default"]["HOST"],
                             user=DATABASES["default"]["USER"],
                             password=DATABASES["default"]["PASSWORD"],
                             database=DATABASES["default"]["NAME"],
                             cursorclass=pymysql.cursors.DictCursor)
            
    with connection:
        with connection.cursor() as cursor:
            # Create a new record
            # sql = "INSERT INTO `game` (`start_time`, `end_time`, `num_players`, `max_players`) VALUES (%s, %s, %s, %s);"
            # cursor.execute(sql, (start_time, end_time, num_players, max_players))
            cursor.callproc("get_city")
            result = cursor.fetchall()
        connection.commit()
    ground_choices = [
        
    ]

class CityForm(forms.Form):
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
    globals()['city_choices'] = [
        
    ]
    for i in result:
        globals()['city_choices'].append((i['city'], i['city']))
    
    city = forms.ChoiceField(choices=globals()['city_choices'], widget=forms.Select)

class Comment(forms.Form):
    comment = forms.CharField(widget=forms.Textarea(attrs={'rows': 4, 'cols': 40}), required=True, label="Comment...", )

class SportGame(forms.Form):
    globals()["sport_choices"] = []
    def __init__(self,*args, **kwargs):
        try:
            self.username_n = kwargs.pop('username_n')
            super(SportGame, self).__init__(*args, **kwargs)
            connection = pymysql.connect(host=DATABASES["default"]["HOST"],
                                    user=DATABASES["default"]["USER"],
                                    password=DATABASES["default"]["PASSWORD"],
                                    database=DATABASES["default"]["NAME"],
                                    cursorclass=pymysql.cursors.DictCursor)
                    
            with connection:
                with connection.cursor() as cursor:
                    cursor.execute(f"SELECT get_user_city('{self.username_n}') AS Result;")
                    city = cursor.fetchone()
                    city = city['Result']
                    cursor.callproc("sport_game", args=[city, self.username_n])
                    result = cursor.fetchall()

                connection.commit()
            for i in result:
                globals()["sport_choices"].append((i['sport_name'], i['sport_name']))
            
            self.fields['sport_choices'].choices = [
            (sport['sport_name'], sport['sport_name']) for sport in result
        ]
        except Exception as e:
            print(e)
            super(SportGame, self).__init__(*args, **kwargs)
    sport_choices =  forms.ChoiceField(choices = globals()["sport_choices"], widget=forms.Select)

class AddCityForm(forms.Form):
    city = forms.CharField(required=True)
    state = forms.CharField(required=True)
    country = forms.CharField(required=True)

class AddGroundForm(forms.Form):
    def __init__(self, *args, **kwargs):
        super(AddGroundForm, self).__init__(*args, **kwargs)
        connection = pymysql.connect(host=DATABASES["default"]["HOST"],
                                 user=DATABASES["default"]["USER"],
                                 password=DATABASES["default"]["PASSWORD"],
                                 database=DATABASES["default"]["NAME"],
                                 cursorclass=pymysql.cursors.DictCursor)

        with connection:
            with connection.cursor() as cursor:
                cursor.execute("SELECT * FROM location AS result;")
                result = cursor.fetchall()
            connection.commit()
        self.fields['city'].choices = [
            (location['city'], location['city']) for location in result
        ]

    ground_name = forms.CharField(required=True)
    city = forms.ChoiceField(choices=[], required=True)
    zipcode = forms.IntegerField()


class AddSectionForm(forms.Form):
    section_name = forms.CharField(required=True)
    field_type = forms.CharField()
    indoor = forms.TypedChoiceField(
        coerce=lambda x: x == 'True',  # Convert 'True'/'False' to True/False
        choices=((1, 'Yes'), (0, 'No')),
        widget=forms.RadioSelect
    )

class AddSportForm(forms.Form):
    sport_name = forms.CharField(required=True)
    teams = forms.TypedChoiceField(
        coerce=lambda x: x == 'True',  # Convert 'True'/'False' to True/False
        choices=((1, 'Yes'), (0, 'No')),
        widget=forms.RadioSelect
    )

class UpdateSectionForm(forms.Form):
    section_name = forms.CharField(required=True)
    field_type = forms.CharField()
    indoor = forms.TypedChoiceField(
        coerce=lambda x: x == 'True',  # Convert 'True'/'False' to True/False
        choices=((1, 'Yes'), (0, 'No')),
        widget=forms.RadioSelect
    )

class FindFeedbackForm(forms.Form):
    ground_id = forms.ChoiceField(choices=[], required=True, label="Ground")
    def __init__(self, *args, **kwargs):
        self.username_n = kwargs.pop('username_n', None)
        super(FindFeedbackForm, self).__init__(*args, **kwargs)
        connection = pymysql.connect(host=DATABASES["default"]["HOST"],
                                 user=DATABASES["default"]["USER"],
                                 password=DATABASES["default"]["PASSWORD"],
                                 database=DATABASES["default"]["NAME"],
                                 cursorclass=pymysql.cursors.DictCursor)

        with connection:
            with connection.cursor() as cursor:
                cursor.execute(f"SELECT get_user_city('{self.username_n}') AS Result;")
                city = cursor.fetchone()
                city = city['Result']
                cursor.callproc("get_ground", args=[city])
                
                result = cursor.fetchall()
                print(result)
            connection.commit()
        self.fields['ground_id'].choices = [
            (ground['ground_id'], ground['ground_name']) for ground in result
        ]

    
    
