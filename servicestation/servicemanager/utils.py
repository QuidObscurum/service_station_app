import datetime
import re

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
    if value < 0:
        raise ValidationError(
            _('Order amount %(value)s cannot be negative.'),
            params={'value': value},
        )
    elif value > 10000:
        raise ValidationError(
            _('Order amount %(value)s cannot be more than 10,000 USD.'),
            params={'value': value},
        )


def validate_name(value):
    value = value.strip()
    res = re.search("[0-9]", value)
    if res is not None:
        raise ValidationError(
            _('%(value)s is not a valid name.'),
            params={'value': value},
        )
    from string import punctuation
    res = re.search(f"[{punctuation}]", value)
    if res is not None:
        raise ValidationError(
            _('%(value)s is not a valid name.'),
            params={'value': value},
        )
