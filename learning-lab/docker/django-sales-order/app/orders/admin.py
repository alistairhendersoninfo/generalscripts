from django.contrib import admin

from . import models


@admin.register(models.Customer)
class CustomerAdmin(admin.ModelAdmin):
    list_display = ("name", "email", "phone")
    search_fields = ("name", "email")


@admin.register(models.CustomerAddress)
class AddressAdmin(admin.ModelAdmin):
    list_display = ("customer", "label", "city", "state")
    list_filter = ("state", "country")


@admin.register(models.SKU)
class SKUAdmin(admin.ModelAdmin):
    list_display = ("code", "description", "unit_price", "is_active")
    list_filter = ("is_active",)
    search_fields = ("code", "description")


class SalesOrderLineInline(admin.TabularInline):
    model = models.SalesOrderLine
    extra = 1


@admin.register(models.SalesOrder)
class SalesOrderAdmin(admin.ModelAdmin):
    list_display = ("id", "customer", "order_date", "status", "total")
    list_filter = ("status", "order_date")
    inlines = [SalesOrderLineInline]
