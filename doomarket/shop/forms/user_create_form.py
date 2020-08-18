from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.models import User
from django import forms


class CreateUserForm(UserCreationForm):
    error_messages = {
        'password_mismatch': 'Поля паролей не совпадают',
    }

    class Meta:
        model = User
        fields = ['username', 'email', 'password1', 'password2']