# from django.shortcuts import render
from django.shortcuts import redirect, get_object_or_404
from django.urls import reverse
from django.conf import settings
from django.views.generic.base import TemplateView
from django.views.generic.edit import CreateView, UpdateView, DeleteView
from django.views.generic.detail import DetailView
from django.views.generic.list import ListView

from .models import Customer, Vehicle, Order
from .forms import CustomerForm, SearchForm, VehicleForm, OrderForm


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
    success_url = 'manager:customer_card'


class VehicleCreateView(CreateView):
    model = Vehicle
    template_name = 'servicemanager/manage_vehicle.html'
    form_class = VehicleForm

    def get_object(self, queryset=None):
        obj_id = self.kwargs.get("owner_id")
        return get_object_or_404(Customer, id=obj_id)

    # def dispatch(self, request, *args, **kwargs):
    #     print("***** dispatch *****", '\n\t', request, '\n\t', args, '\n\t', kwargs)
    #     # self.get_context_data(owner_id=kwargs['owner_id'])
    #     return super().post(request, *args, **kwargs)

    # def post(self, request, *args, **kwargs):
    #     print("*****POST*****", '\n', request.POST, '\n', args, '\n', kwargs)
    #     customer_pk = self.kwargs.get('pk')
    #     customer_obj = Customer.objects.all().filter(pk=customer_pk).first()
    #     print(customer_obj.id)
    #     form = self.get_form()
    #     print(form)
    #     # if form.is_valid():
    #     #     return self.form_valid(form)
    #     # else:
    #     #     return self.form_invalid(form)
    #
    #     return super().post(request, *args, **kwargs)

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        owner = self.get_object()
        context['car_form'] = context['form']
        del context['form']
        context['owner'] = owner
        return context

    def get_success_url(self):
        # return reverse('manager:customer_card', pk=self.owner.pk)
        owner = self.get_object()
        return reverse('manager:customer_card', args=[owner.pk])


class OrderCreateView(CreateView):
    model = Order
    template_name = 'servicemanager/manage_order.html'
    form_class = OrderForm

    def get_object(self, queryset=None):
        obj_id = self.kwargs.get("vehicle_id")
        print('\tOrderCreateView car id', obj_id)
        return get_object_or_404(Vehicle, id=obj_id)

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        vehicle = self.get_object()
        context['vehicle'] = vehicle
        print(context)
        return context

    def get_success_url(self):
        vehicle = self.get_object()
        return reverse('manager:orders_list', args=[vehicle.id])


class OrderUpdateView(UpdateView):
    model = Order
    template_name = 'servicemanager/manage_order.html'
    form_class = OrderForm

    def get_success_url(self):
        order_obj = self.get_object()
        return reverse('manager:orders_list', args=[order_obj.vehicle.id])

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['card_title'] = "Edit the order"
        context['page_title'] = "Edit Order"
        obj = self.get_object()
        context['vehicle'] = obj.vehicle

        return context


class VehicleUpdateView(UpdateView):
    model = Vehicle
    template_name = 'servicemanager/manage_vehicle.html'
    form_class = VehicleForm

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['card_title'] = "Edit the vehicle"
        context['page_title'] = "Edit Vehicle"
        context['car_form'] = context['form']
        del context['form']
        obj = self.get_object()
        context['owner'] = obj.owner
        return context


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

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        # from django.core import serializers
        # serialized_data = serializers.serialize("python", Customer.objects.all().filter(pk=self.kwargs.get('pk')))
        # data = serialized_data[0]['fields']
        # context['data'] = data

        can_delete = True
        if can_delete:
            context['can_delete'] = 'true'

        customer_pk = self.kwargs.get('pk')
        customer_obj = Customer.objects.all().filter(pk=customer_pk).first()
        vehicle_qs = customer_obj.vehicle_set.all()
        context['vehicles'] = vehicle_qs
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


class OrderListView(ListView):
    model = Order
    template_name = "servicemanager/orders_list.html"

    def get_object(self, queryset=None):
        vehicle_id = self.kwargs.get("vehicle_id")
        return get_object_or_404(Vehicle, id=vehicle_id)

    def get_queryset(self):
        vehicle = self.get_object()
        qs = self.model.objects.filter(
            vehicle_id__exact=vehicle.id
        )
        return qs

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)

        vehicle = self.get_object()
        context['vehicle'] = vehicle
        qs = self.get_queryset()
        msg = ''
        orders_list = []

        if not qs.exists():
            msg = f"There are no orders for this car yet."
            print(msg)
        else:
            for obj in qs:
                orders_list.append(obj)

        if msg:
            context['msg'] = msg
        if orders_list:
            context['orders_list'] = orders_list

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
        return context
