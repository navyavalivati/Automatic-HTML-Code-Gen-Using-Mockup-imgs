from __future__ import print_function




import os

from os.path import basename


from compiler.classes.Compiler import Compiler
from compiler.classes.Utils import Utils


import cv2
import sys
from django.core.files.storage import FileSystemStorage
from django.shortcuts import render, redirect
from django.views.decorators.csrf import csrf_exempt
from django.http import JsonResponse
import numpy as np
import urllib
import json
import os
import requests
from tkinter import *
from PIL import Image
from PIL import ImageTk
from tkinter import filedialog
import tkinter.filedialog
import cv2
from skimage import exposure
import pickle
import sys
import imutils
from matplotlib import pyplot as plt
from skimage.measure import compare_ssim
from scipy import linalg
import numpy
import argparse



# Create your views here.
from code_generation.settings import BASE_DIR
from compiler.models import RegisterModel, UploadModel, CheckModel


def login(request):
    if request.method =="POST":
        email = request.POST.get('email')
        password = request.POST.get('password')
        try:
            check = RegisterModel.objects.get(email=email, password=password)
            request.session['userid'] = check.id
            return redirect('upload_page')
        except:
            pass
    return render(request,'compiler/login.html')


def register(request):
    if request.method =="POST":
        first_name = request.POST.get('first_name')
        last_name = request.POST.get('last_name')
        userid = request.POST.get('userid')
        email = request.POST.get('email')
        password = request.POST.get('password')
        password_confirmation = request.POST.get('password_confirmation')

        RegisterModel.objects.create(first_name=first_name, last_name=last_name,userid=userid,email= email, password=password,password_confirmation=password_confirmation )
    return render(request,'compiler/register.html')

def upload_page(request):

    myfile = ''


    if request.method == "POST" and request.FILES['myfile']:
        myfile = request.FILES['myfile']


        UploadModel.objects.create(image=myfile)
    return render(request,'compiler/upload_page.html')





def viewresult(request):
    def select_image1():
        # grab a reference to the image panels
        global panelA, panelB

        # open a file chooser dialog and allow the user to select an input
        # image
        path = filedialog.askopenfilename()
        input_file = ''

        input_file = path

        FILL_WITH_RANDOM_TEXT = True
        TEXT_PLACE_HOLDER = "[]"

        dsl_path = "compiler/assets/web-dsl-mapping.json"
        compiler = Compiler(dsl_path)

        def render_content_with_text(key, value):
            if FILL_WITH_RANDOM_TEXT:
                if key.find("btn") != -1:
                    value = value.replace(TEXT_PLACE_HOLDER, Utils.get_random_text())
                elif key.find("title") != -1:
                    value = value.replace(TEXT_PLACE_HOLDER, Utils.get_random_text(length_text=5, space_number=0))
                elif key.find("text") != -1:
                    value = value.replace(TEXT_PLACE_HOLDER,
                                          Utils.get_random_text(length_text=56, space_number=7, with_upper_case=False))
            return value

        file_uid = basename(input_file)[:basename(input_file).find(".")]
        print(file_uid)
        path = input_file[:input_file.find(file_uid)]
        print(path)

        input_file_path = "{}{}.gui".format(path, file_uid)
        print(input_file_path)
        output_file_path = "{}{}.html".format(path, file_uid)
        ted = output_file_path
        print(ted)

        compiler.compile(input_file_path, output_file_path, rendering_function=render_content_with_text)


    # initialize the window toolkit along with the two image panels
    root = Tk()
    panelA = None
    panelB = None

    # create a button, then when pressed, will trigger a file chooser
    # dialog and allow the user to select an input image; then add the
    # button the GUI
    btn = Button(root, text="Select an Brain MRI image", command=select_image1)
    btn.pack(side="bottom", fill="both", expand="yes", padx="10", pady="10")
    root.mainloop()


    return render(request, 'compiler/viewresult.html')

def image(request):
    def select_image1():
        # grab a reference to the image panels
        global panelA, panelB

        # open a file chooser dialog and allow the user to select an input
        # image
        path = filedialog.askopenfilename()

        # ensure a file path was selected
        if len(path) > 0:
            image = cv2.imread(path)
            image = imutils.resize(image, height=500)
            picture = image
            gray = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)
            ted = gray
            ret, thresh1 = cv2.threshold(gray, 120, 255, cv2.THRESH_BINARY)
            (score, diff) = compare_ssim(ted, thresh1, full=True)
            diff = (diff * 255).astype("uint8")

            val1 = format(score)
            print("VALUE (1.0) IS ANALYSIS, :{}", "\n", val1)
            analysisva = val1

            thresh = cv2.threshold(diff, 0, 255,
                                   cv2.THRESH_BINARY_INV | cv2.THRESH_OTSU)[1]
            cnts = cv2.findContours(thresh.copy(), cv2.RETR_EXTERNAL,
                                    cv2.CHAIN_APPROX_SIMPLE)
            cnts = imutils.grab_contours(cnts)



            ret, thresh = cv2.threshold(thresh1, 0, 255, cv2.THRESH_BINARY_INV + cv2.THRESH_OTSU)
            dst = cv2.GaussianBlur(thresh1, (5, 5), cv2.BORDER_DEFAULT)
            edges = cv2.Canny(thresh1, 100, 200)
            kernel = np.ones((5, 5), np.uint8)
            img_erosion = cv2.erode(thresh1, kernel, iterations=1)
            edged = cv2.Canny(gray, 50, 100)
            image = cv2.cvtColor(image, cv2.COLOR_BGR2RGB)
            image = Image.fromarray(image)
            edged = Image.fromarray(edged)
            image = ImageTk.PhotoImage(image)
            edged = ImageTk.PhotoImage(edged)


            cv2.imshow(' Grayscale', ted)
            cv2.imshow(' Threshold', thresh1)
            cv2.imshow("Dilation", numpy.hstack((thresh1, dst)))
            cv2.imshow('Erosion', img_erosion)
            cv2.waitKey(0)
            #sys.stdout.close()
            cv2.destroyAllWindows()

            name = request.session['userid']


        if panelA is None or panelB is None:
            panelA = Label(image=image)
            panelA.image = image
            panelA.pack(side="left", padx=10, pady=10)
            panelB = Label(image=edged)
            panelB.image = edged
            panelB.pack(side="right", padx=10, pady=10)


        else:
            panelA.configure(image=image)
            panelB.configure(image=edged)
            panelA.image = imagepanelB.image = edged

    brainimg = request.POST.get('brainimg')
    # initialize the window toolkit along with the two image panels
    root = Tk()
    panelA = None
    panelB = None

    # create a button, then when pressed, will trigger a file chooser
    # dialog and allow the user to select an input image; then add the
    # button the GUI
    btn = Button(root, text="Select an image", command=select_image1)
    btn.pack(side="bottom", fill="both", expand="yes", padx="10", pady="10")
    root.mainloop()

    return render(request,'compiler/image.html')



