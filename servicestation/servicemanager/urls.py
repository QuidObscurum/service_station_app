from django.urls import path

from .views import (
    CustomerCreateView,
    CustomerDetailView,
    CustomerUpdateView,
    CustomerDeleteView,
)


app_name = 'manager'

urlpatterns = [
    path('create_customer/', CustomerCreateView.as_view(), name='create_customer'),
    path('update_customer/<int:pk>/', CustomerUpdateView.as_view(), name='update_customer'),
    path('customer_card/<int:pk>/', CustomerDetailView.as_view(), name='customer_card'),
    path('<int:pk>/del', CustomerDeleteView.as_view(), name='delete_customer'),
]
