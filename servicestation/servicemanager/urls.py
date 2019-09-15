from django.urls import path

from .views import (
    CustomerCreateView,
    CustomerDetailView,
    CustomerUpdateView,
    CustomerDeleteView,
    MainView,
    CustomerListView,
    VehicleCreateView,
)


app_name = 'manager'

urlpatterns = [
    path('', MainView.as_view(), name='main'),
    path('search/', CustomerListView.as_view(), name='search_customer'),
    # path('found/', CustomerListView.as_view(), name='found_customer'),

    path('create_customer/', CustomerCreateView.as_view(), name='create_customer'),
    path('update_customer/<int:pk>/', CustomerUpdateView.as_view(), name='update_customer'),
    path('customer_card/<int:pk>/', CustomerDetailView.as_view(), name='customer_card'),
    path('<int:pk>/del/', CustomerDeleteView.as_view(), name='delete_customer'),

    path('customer_card/create_vehicle/<int:owner_id>/', VehicleCreateView.as_view(), name='create_vehicle'),
]
