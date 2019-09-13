# from django.shortcuts import render
from django.shortcuts import redirect
from django.urls import reverse
from django.conf import settings
from django.views.generic.base import TemplateView
from django.views.generic.edit import CreateView, UpdateView, DeleteView
from django.views.generic.detail import DetailView
from django.views.generic.list import ListView

from .models import Customer
from .forms import CustomerForm, SearchForm


class CustomerCreateView(CreateView):
    model = Customer
    template_name = 'servicemanager/manage_customer.html'
    form_class = CustomerForm

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['api_key'] = getattr(settings, 'GOOGLE_API_KEY')
        context['card_title'] = "Create a customer card"
        context['page_title'] = "Create Customer"
        return context
    # success_url = 'manager:customer_card'


class CustomerUpdateView(UpdateView):
    model = Customer
    template_name = 'servicemanager/manage_customer.html'
    form_class = CustomerForm

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['card_title'] = "Edit the customer card"
        context['page_title'] = "Edit Customer"

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


class CustomerListView(ListView):
    model = Customer
    template_name = "servicemanager/search_customer.html"
    form_class = SearchForm

    def get_queryset(self):
        # if self.request.method == 'GET':
        #     query_dict = self.request.GET
        first_name = self.request.GET.get('first_name')
        last_name = self.request.GET.get('last_name')

        # if first_name is None or last_name is None:
        #     print("Please, provide the full name")  # FORM ERROR MSG
        # else:
        qs = self.model.objects.filter(
            last_name__exact=last_name
        ).filter(
            first_name__exact=first_name
        )
        return qs

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['form'] = self.form_class

        print("+++ ListView+++", self.get_queryset())
        qs = self.get_queryset()
        msg = ''
        customer_list = []

        if not qs.exists():
            first_name = self.request.GET.get('first_name')
            last_name = self.request.GET.get('last_name')
            if first_name is not None and last_name is not None:
                msg = f"Didn't find {first_name} {last_name}"
        # elif len(qs) == 1:
        #     customer = qs.first()  # for return redirect("manager:customer_card", pk=found_customer.pk)
        else:
            msg = f"Found {len(qs)} customers:"
            for obj in qs:
                customer_list.append(obj)

        if msg:
            context['msg'] = msg
        if customer_list:
            context['customer_list'] = customer_list

        return context


class CustomerDeleteView(DeleteView):
    model = Customer

    def get_success_url(self):
        return reverse("manager:main")


class MainView(TemplateView):
    template_name = "servicemanager/search_customer.html"
    form_class = SearchForm
    # model = Customer

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['form'] = self.form_class
        print("===== MainViewREQUEST =====", self.request.GET)

        return context
