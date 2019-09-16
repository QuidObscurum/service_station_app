from django import forms
from .models import Customer, Vehicle, Order


class SearchForm(forms.ModelForm):
    class Meta:
        model = Customer
        fields = ['first_name', 'last_name']
        widgets = {
            'first_name': forms.TextInput(attrs={
                'placeholder': "First Name", "class": "input",
            }),
            'last_name': forms.TextInput(attrs={
                'placeholder': "Last Name", "class": "input",
            }),
        }


class CustomerForm(forms.ModelForm):
    address = forms.CharField(
        required=False,
        widget=forms.TextInput(attrs={
            'id': "autocomplete",
            'placeholder': "Enter the address",
            'onFocus': "geolocate()",
            'type': "text",
            "class": "input",
        })
    )

    class Meta:
        model = Customer
        fields = ['first_name', 'last_name', 'birth_date', 'phone', 'email', 'country',
                  'state', 'city', 'street', 'house', 'postal_code']
        widgets = {
            'first_name': forms.TextInput(attrs={
                'placeholder': "First Name", "class": "input",
            }),
            'last_name': forms.TextInput(attrs={
                'placeholder': "Last Name", "class": "input",
            }),
            'birth_date': forms.TextInput(attrs={
                'type': "date", "class": "input",
            }),
            'phone': forms.TextInput(attrs={
                'placeholder': "Phone", "class": "input",
            }),
            'email': forms.TextInput(attrs={
                'placeholder': "E-mail", "class": "input",
            }),
            'country': forms.TextInput(attrs={
                'id': 'country', 'disabled': 'true', 'placeholder': "Country", "class": "input disabled",
            }),
            'state': forms.TextInput(attrs={
                'id': 'administrative_area_level_1', 'disabled': 'true', 'placeholder': "State",
                "class": "input disabled",
            }),
            'city': forms.TextInput(attrs={
                'id': 'locality', 'disabled': 'true', 'placeholder': "City", "class": "input disabled",
            }),
            'street': forms.TextInput(attrs={
                'id': 'route', 'disabled': 'true', 'placeholder': "Street", "class": "input disabled",
            }),
            'house': forms.TextInput(attrs={
                'id': 'street_number', 'disabled': 'true', 'placeholder': "House", "class": "input disabled",
            }),
            'postal_code': forms.TextInput(attrs={
                'id': 'postal_code', 'disabled': 'true', 'placeholder': "Postal Code", "class": "input disabled",
            }),
        }


class VehicleForm(forms.ModelForm):
    class Meta:
        context_object_name = 'car_form'
        model = Vehicle
        fields = ['owner', 'make', 'model', 'year', 'vin']
        widgets = {
            # 'owner': forms.HiddenInput(attrs={
            #     "class": "input",
            # }),
            'make': forms.TextInput(attrs={
                'placeholder': "Make", "class": "input",
            }),
            'model': forms.TextInput(attrs={
                'placeholder': "Model", "class": "input",
            }),
            'year': forms.TextInput(attrs={
                'placeholder': "Year", "class": "input",
            }),
            'vin': forms.TextInput(attrs={
                'placeholder': "VIN", "class": "input",
            })
        }


class OrderForm(forms.ModelForm):
    class Meta:
        model = Order
        fields = ['vehicle', 'date', 'amount', 'status']
