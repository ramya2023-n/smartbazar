from django.urls import path
from app1 import views

urlpatterns = [
    path('', views.index),
    path('register/', views.register),
    path('login/', views.login),
    path('help/', views.help),
    path('contact/', views.contact),
    path('logout/', views.logout),
    path('store1/', views.store1),    
    path('productview/', views.productview),    
    path('addtocart/', views.addtocart),    
    path('cart_update/',views.cart_update),
    path('cart_remove/',views.cart_remove),
    path('cart/',views.cart),
    path('search/',views.search),
    path('payment/',views.payment),
    path('forgot/',views.forgot),
    path('changepasword/',views.changepasword),
    path('billpdf/',views.billpdf),
    path('order/',views.order),
    path('offers/',views.offers),


    ######################################
    path('adminindex/', views.adminindex),
    path('adminregister/', views.adminregister),
    path('adminlogin/', views.adminlogin),
    path('adminlogout/', views.adminlogout),
    path('adminprofile/', views.adminprofile),
    path('adeditprofile/', views.adeditprofile),
    path('userdetails/', views.userdetails),
    path('addproducts/', views.addproducts),
    path('productdetails/', views.productdetails),
    path('product_update/', views.product_update),
    path('product_delete/', views.product_delete),
    path('admin_info/', views.admin_info),
    path('userorder/',views.userorder),
    path('ad_offers/', views.ad_offers),
    
    ##ajax view
    path('ajaxview/',views.ajaxview),




    ]