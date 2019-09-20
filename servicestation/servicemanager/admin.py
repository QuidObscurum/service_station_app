from django.contrib import admin
from .models import Customer, Vehicle, Order

# Register your models here.
admin.site.register(Customer)
admin.site.register(Vehicle)
admin.site.register(Order)
