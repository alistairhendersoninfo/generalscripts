from django import forms
from django.forms import inlineformset_factory

from .models import Customer, CustomerAddress, SKU, SalesOrder, SalesOrderLine


class CustomerForm(forms.ModelForm):
    class Meta:
        model = Customer
        fields = ["name", "email", "phone"]
        widgets = {
            "name": forms.TextInput(attrs={"class": "input"}),
            "email": forms.EmailInput(attrs={"class": "input"}),
            "phone": forms.TextInput(attrs={"class": "input"}),
        }


class AddressForm(forms.ModelForm):
    class Meta:
        model = CustomerAddress
        fields = [
            "customer",
            "label",
            "line1",
            "line2",
            "city",
            "state",
            "postal_code",
            "country",
        ]
        widgets = {field: forms.TextInput(attrs={"class": "input"}) for field in fields}


class SKUForm(forms.ModelForm):
    class Meta:
        model = SKU
        fields = ["code", "description", "unit_price", "is_active"]
        widgets = {
            "code": forms.TextInput(attrs={"class": "input"}),
            "description": forms.TextInput(attrs={"class": "input"}),
            "unit_price": forms.NumberInput(attrs={"class": "input", "step": "0.01"}),
            "is_active": forms.CheckboxInput(attrs={"class": "checkbox"}),
        }


class SalesOrderForm(forms.ModelForm):
    class Meta:
        model = SalesOrder
        fields = ["customer", "shipping_address", "order_date", "status", "notes"]
        widgets = {
            "order_date": forms.DateInput(attrs={"type": "date", "class": "input"}),
            "notes": forms.Textarea(attrs={"rows": 3, "class": "textarea"}),
        }

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        if "customer" in self.fields:
            self.fields["customer"].widget.attrs.update({"class": "select"})
        if "shipping_address" in self.fields:
            self.fields["shipping_address"].widget.attrs.update({"class": "select"})
        if "status" in self.fields:
            self.fields["status"].widget.attrs.update({"class": "select"})


SalesOrderLineFormSet = inlineformset_factory(
    SalesOrder,
    SalesOrderLine,
    fields=["sku", "quantity", "unit_price"],
    extra=1,
    can_delete=True,
    widgets={
        "sku": forms.Select(attrs={"class": "select"}),
        "quantity": forms.NumberInput(attrs={"class": "input", "min": 1}),
        "unit_price": forms.NumberInput(attrs={"class": "input", "step": "0.01"}),
    },
)
