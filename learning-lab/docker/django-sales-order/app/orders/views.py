from django.shortcuts import render, redirect, get_object_or_404
from django.urls import reverse
from django.forms import modelform_factory
from django.contrib import messages

from .models import Customer, CustomerAddress, SKU, SalesOrder
from .forms import (
    CustomerForm,
    AddressForm,
    SKUForm,
    SalesOrderForm,
    SalesOrderLineFormSet,
)


def index(request):
    context = {
        "customers": Customer.objects.count(),
        "skus": SKU.objects.count(),
        "orders": SalesOrder.objects.count(),
    }
    return render(request, "orders/index.html", context)


def list_customers(request):
    return render(request, "orders/customer_list.html", {"customers": Customer.objects.all()})


def customer_create(request):
    form = CustomerForm(request.POST or None)
    if form.is_valid():
        form.save()
        messages.success(request, "Customer saved")
        return redirect("customer-list")
    return render(request, "orders/customer_form.html", {"form": form})


def list_skus(request):
    return render(request, "orders/sku_list.html", {"skus": SKU.objects.all()})


def sku_create(request):
    form = SKUForm(request.POST or None)
    if form.is_valid():
        form.save()
        messages.success(request, "SKU saved")
        return redirect("sku-list")
    return render(request, "orders/sku_form.html", {"form": form})


def list_addresses(request):
    addresses = CustomerAddress.objects.select_related("customer").all()
    return render(request, "orders/address_list.html", {"addresses": addresses})


def address_create(request):
    form = AddressForm(request.POST or None)
    if form.is_valid():
        form.save()
        messages.success(request, "Address saved")
        return redirect("address-list")
    return render(request, "orders/address_form.html", {"form": form})


def order_list(request):
    orders = SalesOrder.objects.select_related("customer", "shipping_address").prefetch_related("lines__sku")
    return render(request, "orders/order_list.html", {"orders": orders})


def order_create(request):
    order = SalesOrder()
    form = SalesOrderForm(request.POST or None, instance=order)
    formset = SalesOrderLineFormSet(request.POST or None, instance=order)
    if form.is_valid() and formset.is_valid():
        order = form.save()
        formset.instance = order
        formset.save()
        messages.success(request, "Order created")
        return redirect("order-list")
    return render(request, "orders/order_form.html", {"form": form, "formset": formset})


def order_update(request, pk):
    order = get_object_or_404(SalesOrder, pk=pk)
    form = SalesOrderForm(request.POST or None, instance=order)
    formset = SalesOrderLineFormSet(request.POST or None, instance=order)
    if form.is_valid() and formset.is_valid():
        order = form.save()
        formset.save()
        messages.success(request, "Order updated")
        return redirect("order-list")
    return render(request, "orders/order_form.html", {"form": form, "formset": formset, "editing": True, "order": order})
