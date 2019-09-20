from django.urls import path
from django.contrib.auth.decorators import login_required

from .views import (
    CustomerCreateView,
    CustomerDetailView,
    CustomerUpdateView,
    CustomerDeleteView,
    MainView,
    CustomerListView,
    VehicleCreateView,
    VehicleUpdateView,
    VehicleDeleteView,
    OrderCreateView,
    OrderListView,
    OrderUpdateView,
    OrderDeleteView,
)


app_name = 'manager'

urlpatterns = [
    path('', login_required(MainView.as_view()), name='main'),
    path('search/', login_required(CustomerListView.as_view()), name='search_customer'),

    path('create_customer/', login_required(CustomerCreateView.as_view()), name='create_customer'),
    path('update_customer/<int:pk>/', login_required(CustomerUpdateView.as_view()), name='update_customer'),
    path('customer_card/<int:pk>/', login_required(CustomerDetailView.as_view()), name='customer_card'),
    path('<int:pk>/del/', login_required(CustomerDeleteView.as_view()), name='delete_customer'),

    path('customer_card/create_vehicle/<int:owner_id>/',
         login_required(VehicleCreateView.as_view()), name='create_vehicle'),
    path('update_vehicle/<int:pk>/', login_required(VehicleUpdateView.as_view()), name='update_vehicle'),
    path('delete_vehicle/<int:pk>/', login_required(VehicleDeleteView.as_view()), name='delete_vehicle'),

    path('create_order/<int:vehicle_id>/', login_required(OrderCreateView.as_view()), name='create_order'),
    path('update_order/<int:pk>/', login_required(OrderUpdateView.as_view()), name='update_order'),
    path('delete_order/<int:pk>/', login_required(OrderDeleteView.as_view()), name='delete_order'),
    path('orders_list/<int:vehicle_id>/', login_required(OrderListView.as_view()), name='orders_list'),
]
