from django.urls import path

from .views import (
    CustomerCreateView,
    CustomerDetailView,
    CustomerUpdateView,
)


app_name = 'manager'

urlpatterns = [
    path('create_customer/', CustomerCreateView.as_view(), name='create_customer'),
    path('update_customer/<int:pk>/', CustomerUpdateView.as_view(), name='update_customer'),
    path('customer_card/<int:pk>/', CustomerDetailView.as_view(), name='customer_card')

]
