from django.shortcuts import render
from django.http import HttpResponse,HttpResponseRedirect
from django.template import loader
from .models import *
import os 
import datetime
import random
import string
from django.conf import settings
from django.core.mail import send_mail
# Create your views here.

def index(request):
	E=product_tb.objects.filter(Catagory="Electronics")
	F=product_tb.objects.filter(Catagory="Fashionstore")
	P=product_tb.objects.filter(Catagory="Photogifts")
	H=product_tb.objects.filter(Catagory="HomeFurniture")
	S=product_tb.objects.filter(Catagory="Sports")
	products=product_tb.objects.all()
	product={"Electronics":E,"Fashion":F,"Photogifts":P,"Homefurniture":H,"Sports":S,"products":products}
	return render(request,"index.html",product)


def help(request):
    return render(request,"help.html")

    ######contact admin
def contact(request):
	if request.method == "POST":
		name=request.POST['Name']
		email=request.POST['Email']
		msg=request.POST['Message']
		x = ''.join(random.choices(name + string.digits, k=8))
		y = ''.join(random.choices(string.ascii_letters + string.digits, k=7))
		subject = 'Contact Form'
		message = f'There is message from {name} email {email}. The message is {msg}. Thankyou.'
		email_from = settings.EMAIL_HOST_USER 
		recipient_list = [settings.EMAIL_HOST_USER, ] 
		send_mail( subject, message, email_from, recipient_list ) 
		x = ''.join(random.choices(name + string.digits, k=8))
		y = ''.join(random.choices(string.ascii_letters + string.digits, k=7))
		subject = ' thank for submitting Contact Form'
		message = f'Hi {name}, Thankyou for submitting form.'
		email_from = settings.EMAIL_HOST_USER 
		recipient_list = [email, ] 
		send_mail( subject, message, email_from, recipient_list ) 

		return render(request,"index.html")
	else:
		return render(request,"contact.html")


		##############search 


def search(request):
	if request.method=="POST":
		pname=request.POST['Search']
		mydata=product_tb.objects.filter(Productname=pname)
		return render(request,"search.html",{"data1":mydata})
	else:
		return render(request,"index.html")


#######View Offers

def offers(request):
		data=product_tb.objects.all()
		return render(request,"useroffers.html",{"data1":data})
	



##user register
def register(request):
	if request.method == "POST":
		name=request.POST["name"]
		email=request.POST["email"]
		password=request.POST["password"]
		cpassword=request.POST["cpassword"]
		check=register_tb.objects.filter(email=email)
		if password == cpassword:
			if check:
				return render(request,"register.html",{"error":"email already registered"})
			else:
				add=register_tb(username=name,email=email,password=password)
				add.save()
				return render(request,"index.html",{"success":"successfully registered"})
		else:
			return render(request,"register.html",{"error1":"passwords doesn't match"})
	else:
		return render(request,"register.html")

###user login
def login(request):
    if request.method=="POST":        
        useremail=request.POST['email']
        userpassword=request.POST['password']        
        check=register_tb.objects.filter(email=useremail,password=userpassword)
        if check:
            for x in check:
                request.session["userid"]=x.id
                request.session["username"]=x.username
                return render(request,"index.html")
        else:            
            return render(request,"login.html",{"error":"not a registerd user"})
    else:
        return render(request,"login.html")   
        ###user logout

def logout(request):
	if request.session.has_key('userid'):
		del request.session["userid"]
		del request.session["username"]
	return render(request,"index.html")

###to view products in each catagory
def store1(request):
    ad=request.GET['cat']
    product=product_tb.objects.filter(Catagory=ad)
    return render(request,"store.html",{"product":product})

	### particular product description
def productview(request):
	if request.session.has_key('userid'):
		pid=request.GET['prodid']
		data=product_tb.objects.filter(id=pid)
		return render(request,"productview.html",{"data1":data})
	else:
		return HttpResponseRedirect("/login/")


### add to cart 
def addtocart(request):
	if request.session.has_key('userid'):
		if request.method == "POST":
			pid=request.GET["pid"]
			prd=product_tb.objects.get(id=pid)
			uid=request.session['userid']
			usr=register_tb.objects.get(id=uid)
			product=product_tb.objects.filter(id=pid)
			for x in product:
				price=x.Newprice
			deliv=(int(price)*10)/100
			total=0
			total=int(deliv)+int(price)
			data1=cart_tb.objects.filter(Userid=usr,Prodid=prd,Status="pending")
			if data1:
				total1=0
				for x in data1:
					qty=int(x.Quantity)
					qty+=1
					price=x.Prodid.Newprice
					price1=x.Total
					total1=total1+float(price1)
				total=0
				deliv=(float(price)*10)/100
				total=int(deliv)+(float(price)*int(qty))
				add=cart_tb.objects.filter(Userid=usr,Prodid=prd,Status="pending").update(Total=total,Quantity=qty)
				datas=cart_tb.objects.filter(Userid=usr,Status="pending")
				return render(request,"cartview.html",{"data2":datas,"total":total1})
			else:
				add=cart_tb(Prodid=prd,Userid=usr,Quantity=1,Total=total)
				add.save()
			datas=cart_tb.objects.filter(Userid=usr,Status="pending")
			total=0
			for x in datas:
				price=x.Total
				total=total+float(price)
				return render(request,"cartview.html",{"data2":datas,"total":total})
		else:
			pid=request.GET['pid']
			datas=product_tb.objects.filter(id=pid)
			return render(request,"productview.html",{"data2":datas})
	else:
			return HttpResponseRedirect("/login/")

### show user cart
def cart(request):
    uid=request.session['userid']
    usr=register_tb.objects.get(id=uid)
    datas=cart_tb.objects.filter(Userid=usr,Status="pending")
    total=0
    for x in datas:
        price=x.Total
        total=total+float(price)
    return render(request,"cartview.html",{"data2":datas,"total":total})
   
##### update cart
def cart_update(request):
    cid=request.GET['cid']
    quantity=request.POST['qty']
    cart=cart_tb.objects.filter(id=cid)
    for x in cart:
        price=x.Prodid.Newprice
    Newprice=(float(price)*int(quantity))+((float(price)*10)/100)
    cart_tb.objects.filter(id=cid).update(Quantity=quantity,Total=Newprice)
    return HttpResponseRedirect("/cart/")


### delete cart items
def cart_remove(request):
    cid=request.GET['cid']
    cart_tb.objects.filter(id=cid).delete()
    return HttpResponseRedirect("/cart/")


####user payment
def payment(request):
    if request.method == "POST":
        uid=request.session['userid']
        uidd=register_tb.objects.get(id=uid)
        cdate=datetime.datetime.now().date()
        ctime=datetime.datetime.now().time()
        total=request.POST['total']
        add=payment_tb(uid=uidd,status="paid",total=total,date=cdate,time=ctime)
        add.save()
        cart_tb.objects.filter(Userid=uidd,Status="pending").update(Status="paid")
        return HttpResponseRedirect("/")
    else:
       total=request.GET['gt']
       return render(request,'payment/index.html',{"total":total})

###forgot password
def forgot(request):
	if request.method=="POST":
		mail=request.POST['email']
		chk=register_tb.objects.filter(email=mail)
		if chk:
			for x in chk:
				name=x.username
				uid=x.id
				subject = 'forget password Form'
				message = f'Hi {name}. This email is to reset your Password. Click the link to reset password http://127.0.0.1:8000/changepasword/?uid={uid} .Thankyou.'
				email_from = settings.EMAIL_HOST_USER 
				recipient_list = [mail, ] 
				send_mail( subject, message, email_from, recipient_list )
			return render(request,"index.html",{"msg":"Email Has been sent"})
		else:
			return render(request,"forgot.html")
	else:
		return render(request,"forgot.html")

 ######change password

def changepasword(request):    
	if request.session.has_key("userid"):
	    if request.method=="POST":
	        uid=request.session['userid']
	        password1=request.POST["password"]
	        cpassword=request.POST["rpassword"]
	        if password1 == cpassword:
	            add=register_tb.objects.filter(id=uid).update(password=password1)
	            return render(request,"index.html",{"success":"saved"})
	    else:
	        return render(request,"changepasword.html")
	elif request.method=="POST":
	    uid=request.POST['uid']
	    password1=request.POST["password"]
	    cpassword=request.POST["rpassword"]
	    if password1 == cpassword:
	        add=register_tb.objects.filter(id=uid).update(password=password1)
	        return render(request,"index.html",{"success":"saved"})
	    else:
	        uid=request.GET['userid']
	        return render(request,"changepassword.html",{"error":"password mismatch",'uid':uid})
	else:
	    uid=request.GET['uid']
	    return render(request,"changepassword.html",{'uid':uid})

#############bill print


from reportlab.pdfgen import canvas 
from django.views.generic import View
from bazarproj.utils import render_to_pdf

def billpdf(request):
    a=request.GET.get('billid')    
    users=cart_tb.objects.filter(id=a,Status='paid')
    pdf=render_to_pdf('billprint.html',{'aa':users})
    return HttpResponse(pdf,content_type='application/pdf')

def order(request):
	d=request.GET['oid']
	data=cart_tb.objects.filter(Userid=d)
	return render(request,"order.html",{"d1":data})




####################################################ADMIN#########################
## admin index
def adminindex(request):
    return render(request,"admin/adminlogin.html")

##admin register
def adminregister(request):
	if request.method == "POST":
		adname=request.POST["aname"]
		ademail=request.POST["aemail"]
		adpassword=request.POST["apassword"]
		adphone=request.POST["aphone"]
		img=request.FILES["aimage"]
		check=adminregister_tb.objects.filter(email=ademail)
		if check:
			return render(request,"admin/adminregister.html",{"error":"email already registered"})
		else:
			add=adminregister_tb(adminname=adname,email=ademail,password=adpassword,contact=adphone,image=img)
			add.save()
			return render(request,"admin/adminlogin.html",{"success":"successfully registered"})
	else:
		return render(request,"admin/adminregister.html")

######ADMIN LOGIN


def adminlogin(request):
	if request.method == "POST":
		reg_em=request.POST['email']
		reg_pswd=request.POST['password']
		check=adminregister_tb.objects.filter(email=reg_em,password=reg_pswd)
		if check:
			for x in check:
				request.session["adminid"]=x.id
				request.session["adminname"]=x.adminname
				return render(request,"admin/index.html",{"d1":check})
		else:
			return render(request,"admin/adminregister.html",{"err":"Unregistered"})
	else:
		return render(request,"admin/adminlogin.html")

		#########ADMIN LOGOUT

def adminlogout(request):
	if request.session.has_key('adminid'):
		del request.session["adminid"]
		del request.session["adminname"]
	return render(request,"index.html")

	######ADMIN PROFILE VIEW
def adminprofile(request):
    adid=request.GET['aid']
    mydata=adminregister_tb.objects.filter(id=adid)
    return render(request,"admin/adminprofile.html",{"d1":mydata})

### REGISTERED USER DETAILS
def userdetails(request):
	mydata=register_tb.objects.all()
	return render(request,"admin/userdetails.html",{"data1":mydata})

	#####ADD NEW PRODUCT
def addproducts(request):

	if request.method == "POST":
		ad_productname=request.POST["pname"]
		ad_oldprice=request.POST["oldprice"]
		ad_newprice=request.POST["newprice"]
		ad_pdescription=request.POST["proddesciption"]
		ad_image=request.FILES["image"]
		ad_select=request.POST["s1"]
		add=product_tb(Productname=ad_productname,Oldprice=ad_oldprice,Newprice=ad_newprice,
		Description=ad_pdescription,Image=ad_image,Catagory=ad_select)
		add.save()
		data=product_tb.objects.all()
		return render(request,"admin/productdetails.html",{"d":data})
	else:
		adid=request.GET['adid']
		d=adminregister_tb.objects.filter(id=adid)
		return render(request,"admin/addproducts.html",{"d1":d})


#### spcial offers

def ad_offers(request):
	if request.method == "POST":
		ad_image=request.FILES["image"]
		ad_newprice=request.POST["newprice"]
		ad_qty=request.POST["quantity"]
		add=offers_tb(Newprice=ad_newprice,Image=ad_image,Quantity=ad_qty)
		add.save()
	return render(request,"admin/offers.html",{"s":"Added"})



	###SHOW PRODUCT DETAILS
def productdetails(request):
		data=product_tb.objects.all()
		return render(request,"admin/productdetails.html",{"d":data})


	########EDIT ADMIN PROFILE
def adeditprofile(request):
	if request.method == "POST":
		adname=request.POST["name"]
		ademail=request.POST["email"]
		adpassword=request.POST["password"]
		aid=request.session['adminid']
		checkbox=request.POST["imgup"]
		if checkbox == "yes":
			ad_image=request.FILES["image"]
			oldrec=adminregister_tb.objects.filter(id=aid)
			updrec=adminregister_tb.objects.get(id=aid)
			for x in oldrec:
				imageurl=x.image.url
				pathtoimage=os.path.dirname(os.path.dirname(os.path.abspath(__file__)))+imageurl
				if os.path.exists(pathtoimage):
					os.remove(pathtoimage)
					print('Successfully deleted')
			updrec.image=ad_image
			updrec.save()
			print("-----------------")
		add=adminregister_tb.objects.filter(id=aid).update(adminname=adname,email=ademail,password=adpassword)
		return render(request,"admin/index.html",{"success":"saved"})
	else:
		aid=request.session['adminid']
		add=adminregister_tb.objects.filter(id=aid)
		return render(request,"admin/adeditprofile.html",{"data1":add})

######PRODUCT UPDATE

def product_update(request):
	if request.method == "POST":
		ad_productname=request.POST["pname"]
		ad_oldprice=request.POST["oldprice"]
		ad_newprice=request.POST["newprice"]
		ad_pdescription=request.POST["proddesciption"]
		ad_select=request.POST["s1"]
		pid=request.GET['prodid']
		checkbox=request.POST["imgup"]
		if checkbox == "yes":
			ad_image=request.FILES["image"]
			oldrec=product_tb.objects.filter(id=pid)
			updrec=product_tb.objects.get(id=pid)
			for x in oldrec:
				imageurl=x.Image.url
				pathtoimage=os.path.dirname(os.path.dirname(os.path.abspath(__file__)))+imageurl
				if os.path.exists(pathtoimage):
					os.remove(pathtoimage)
					print('Successfully deleted')
			updrec.Image=ad_image
			updrec.save()
		add=product_tb.objects.filter(id=pid).update(Productname=ad_productname,Oldprice=ad_oldprice,Newprice=ad_newprice,
            Description=ad_pdescription,Catagory=ad_select)
		return HttpResponseRedirect("/productdetails/")
	else:
		pid=request.GET['prodid']
		mydata=product_tb.objects.filter(id=pid)
		return render(request,"admin/product_update.html",{"data2":mydata})


 ###PRODUCT DELETE

def product_delete(request):
	if request.session.has_key('adminid'):
		pid=request.GET['prodid']
		oldrec=product_tb.objects.filter(id=pid)
		for x in oldrec:
			imageurl=x.Image.url
			pathtoimage=os.path.dirname(os.path.dirname(os.path.abspath(__file__)))+imageurl
			if os.path.exists(pathtoimage):
				os.remove(pathtoimage)
				print('Successfully deleted')
		mydata=product_tb.objects.filter(id=pid).delete()
		return HttpResponseRedirect("/productdetails/")
	else:
		return HttpResponseRedirect('/adminlogin/')


def userorder(request):
	if request.session.has_key('adminid'):
	    data=cart_tb.objects.all()
	    return render(request,"admin/userorder.html",{"data1":data})
	else:
	    return render(request,"admin_login")




#####admininfo using AJAX#############


def admin_info(request):
	if request.session.has_key('adminid'):
		data=adminregister_tb.objects.all()
		return render(request,"admin/admin_info.html",{"data1":data})
	else:
		return HttpResponseRedirect('/adminlogin/')


from django.http import JsonResponse

###AJAX VIEW FOR ADMIN INFO

def ajaxview(request):
    a=request.GET.get('adminid')
    b=adminregister_tb.objects.filter(id=a)
    for x in b:
        v=x.adminname
        w=x.email
        y=x.password
       
    dat={"aa":v,"bb":w,"cc":y}
    print(dat)
    return JsonResponse(dat)    
	


		




