from django.db import models
class register_tb(models.Model):
	username=models.CharField(max_length=255)
	email = models.CharField(max_length=255)
	password = models.CharField(max_length=255)

class adminregister_tb(models.Model):
	adminname=models.CharField(max_length=255)
	email = models.CharField(max_length=255)
	password = models.CharField(max_length=255)
	contact = models.CharField(max_length=255)
	image=models.ImageField(upload_to="register/")
class product_tb(models.Model):
	Productname=models.CharField(max_length=255)
	Oldprice=models.CharField(max_length=255)
	Newprice=models.CharField(max_length=255)
	Description=models.CharField(max_length=255)
	Image=models.ImageField(upload_to="product/")
	Catagory=models.CharField(max_length=255)

class cart_tb(models.Model):
	Prodid= models.ForeignKey(product_tb, on_delete=models.CASCADE)
	Userid= models.ForeignKey(register_tb, on_delete=models.CASCADE)
	Quantity=models.CharField(max_length=255)
	Total=models.CharField(max_length=255)
	Status=models.CharField(max_length=255,default="pending")



class payment_tb(models.Model):
	uid= models.ForeignKey(register_tb, on_delete=models.CASCADE)
	status=models.CharField(max_length=225)
	total=models.CharField(max_length=225)
	date=models.DateField()
	time=models.TimeField()

class offers_tb(models.Model):
	Newprice=models.CharField(max_length=255)
	Image=models.ImageField(upload_to="product/")
	Quantity=models.CharField(max_length=255)



# Create your models here.
