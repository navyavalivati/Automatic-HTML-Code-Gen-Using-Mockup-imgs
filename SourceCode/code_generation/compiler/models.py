from django.db import models
from tkinter import CASCADE

# Create your models here.


class RegisterModel(models.Model):
    first_name=models.CharField(max_length=300)
    last_name=models.CharField(max_length=200)
    userid = models.CharField(max_length=200)
    email=models.CharField(max_length=200)
    password=models.CharField(max_length=200)
    password_confirmation=models.CharField(max_length=200)

class UploadModel(models.Model):
    image=models.FileField()

class CheckModel(models.Model):
    check_tile=models.CharField(max_length=200)
    check_des=models.CharField(max_length=500)
    check_imgid=models.ForeignKey(UploadModel)
    img_path=models.CharField(max_length=200)
    check_userid=models.ForeignKey(RegisterModel)
    txt_filed=models.CharField(max_length=1000)
    cate_list=models.CharField(max_length=200)

class Html_Page(models.Model):
    htmlfile= models.FileField()

