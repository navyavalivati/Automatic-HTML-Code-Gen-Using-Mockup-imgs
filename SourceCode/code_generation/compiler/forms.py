from django import forms

from compiler.models import RegisterModel


class Registerform(forms.ModelForm):
    class Meta:
        model=RegisterModel
        fields = ("first_name", "last_name", "email", "password", "password_confirmation")