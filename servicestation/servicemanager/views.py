from django.shortcuts import render, redirect
from django.conf import settings
from django.views.generic.edit import CreateView, UpdateView
from django.views.generic.detail import DetailView

from .models import Customer
from .forms import CustomerForm


class CustomerCreateView(CreateView):
    model = Customer
    template_name = 'servicemanager/manage_customer.html'
    form_class = CustomerForm

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['api_key'] = getattr(settings, 'GOOGLE_API_KEY')
        context['card_title'] = "Create a customer card"
        return context
    # success_url = 'manager:customer_card'


class CustomerUpdateView(UpdateView):
    model = Customer
    template_name = 'servicemanager/manage_customer.html'
    form_class = CustomerForm

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['card_title'] = "Edit the customer card"

        return context

    # def get_object(self, queryset=None):
    #     obj_id = self.kwargs.get("id")
    #     return get_object_or_404(Customer, id=obj_id)


class CustomerDetailView(DetailView):
    model = Customer

    # def get_object(self, queryset=None):
    #     obj_id = self.kwargs.get("pk")

    def get_context_data(self, **kwargs):
        from django.core import serializers

        serialized_data = serializers.serialize("python", Customer.objects.all().filter(pk=self.kwargs.get('pk')))
        data = serialized_data[0]['fields']

        context = super().get_context_data(**kwargs)
        context['data'] = data

        can_delete = True
        if can_delete:
            context['can_delete'] = 'true'

        return context


def customer_delete_view(request):
    if request.method == "POST":
        pass
