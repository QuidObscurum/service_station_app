import datetime

from django.core.exceptions import ValidationError
from django.utils.translation import gettext_lazy as _


def validate_legal_age(value):
    required_date = get_default_birth_date()
    if value > required_date:
        raise ValidationError(
            _('Customers must be of legal age (at least 18 years old).'),
        )


def get_default_birth_date():
    today = datetime.date.today()
    required_year = today.year - 18
    required_date = datetime.datetime(required_year, today.month, today.day).date()
    return required_date


def validate_vehicle_year(value):
    current_year = datetime.date.today().year
    if current_year < value < 1886:
        raise ValidationError(
            _('%(value)s is not a valid manufacture year.'),
            params={'value': value},
        )


def validate_amount(value):
    current_year = datetime.date.today().year
    if current_year < value < 1886:
        raise ValidationError(
            _('%(value)s is not a valid manufacture year.'),
            params={'value': value},
        )
