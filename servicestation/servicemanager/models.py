from django.db import models
from django.urls import reverse

from .utils import get_default_birth_date, validate_vehicle_year, validate_legal_age


class Customer(models.Model):
    first_name = models.CharField(max_length=100)
    last_name = models.CharField(max_length=100)
    birth_date = models.DateField(default=get_default_birth_date(), validators=[validate_legal_age])
    # E.164: Country code (max 3 digits), Subscriber number (max 12 digits)
    phone = models.CharField(max_length=15)  # unique=True?
    email = models.EmailField(unique=True)
    created_timestamp = models.DateTimeField(auto_now_add=True)
    updated_timestamp = models.DateTimeField(auto_now=True)

    country = models.CharField(max_length=120)
    state = models.CharField(max_length=120)
    city = models.CharField(max_length=120)
    street = models.CharField(max_length=120)
    house = models.CharField(max_length=20)
    # appartment = models.CharField(max_length=5)
    postal_code = models.CharField(max_length=12)

    def __str__(self):
        return f"{self.first_name} {self.last_name}: {self.email}"

    def get_absolute_url(self):
        return reverse("manager:customer_card", kwargs={"pk": self.pk})


class Vehicle(models.Model):
    owner = models.ForeignKey(Customer, on_delete=models.CASCADE)
    make = models.CharField(max_length=70)
    model = models.CharField(max_length=120)
    year = models.PositiveSmallIntegerField(validators=[validate_vehicle_year])
    vin = models.CharField(max_length=17)

    def __str__(self):
        return f"{self.vin}"

    def get_absolute_url(self):
        return reverse("manager:customer_card", kwargs={"pk": self.owner.pk})


class Order(models.Model):
    vehicle = models.ForeignKey(Vehicle, on_delete=models.CASCADE)
    date = models.DateTimeField(auto_now_add=True)
    amount = models.DecimalField(max_digits=7, decimal_places=2)
    STATUS_CHOICES = [
        ('Completed', 'completed'),
        ('In progress', 'in progress'),
        ('Cancelled', 'cancelled'),
    ]
    status = models.CharField(max_length=11, choices=STATUS_CHOICES, default='In progress')

    def __str__(self):
        return f"{self.vehicle.vin} {self.date}"
