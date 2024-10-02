# from django.db import models
# from django.contrib.auth.models import AbstractUser

# class CustomUser(AbstractUser):
#     date_of_birth = models.DateField(null=True, blank=True)
#     phone_number = models.CharField(max_length=10, blank=True, null=True)
#     city = models.CharField(max_length=15, blank=True, null=True)

#     groups = models.ManyToManyField(
#         'auth.Group',
#         related_name='custom_user_groups',
#         blank=True,
#         verbose_name='groups',
#         help_text='The groups this user belongs to. A user will get all permissions granted to each of their groups.',
#     )
#     user_permissions = models.ManyToManyField(
#         'auth.Permission',
#         related_name='custom_user_user_permissions',
#         blank=True,
#         verbose_name='user permissions',
#         help_text='Specific permissions for this user.',
#         error_messages={
#             'unique': 'The permission already exists for this user.',
#         },
#     )
#     class Meta:
#         managed = False
#         db_table = "pickup_user"

#     def __str__(self):
#         return self.username
    
# # class Game(models.Model):
# #     start_time = models.DateTimeField()
# #     end_time = models.DateTimeField()
# #     num_players = models.IntegerField()
# #     max_players = models.IntegerField()

# #     class Meta:
# #         managed = False
# #         db_table = "game"

#     # def __str__(self):
#     #     return self.username
