from django.urls import path

from . import views

urlpatterns = [
    path('', views.index, name='dashboard'),
    path('customers/', views.list_customers, name='customer-list'),
    path('customers/new/', views.customer_create, name='customer-create'),
    path('skus/', views.list_skus, name='sku-list'),
    path('skus/new/', views.sku_create, name='sku-create'),
    path('addresses/', views.list_addresses, name='address-list'),
    path('addresses/new/', views.address_create, name='address-create'),
    path('orders/', views.order_list, name='order-list'),
    path('orders/new/', views.order_create, name='order-create'),
    path('orders/<int:pk>/edit/', views.order_update, name='order-edit'),
]
