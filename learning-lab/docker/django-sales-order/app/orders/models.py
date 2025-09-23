from django.db import models


class Customer(models.Model):
    name = models.CharField(max_length=255)
    email = models.EmailField(unique=True)
    phone = models.CharField(max_length=50, blank=True)

    def __str__(self) -> str:
        return self.name


class CustomerAddress(models.Model):
    customer = models.ForeignKey(Customer, related_name='addresses', on_delete=models.CASCADE)
    label = models.CharField(max_length=120)
    line1 = models.CharField(max_length=255)
    line2 = models.CharField(max_length=255, blank=True)
    city = models.CharField(max_length=120)
    state = models.CharField(max_length=120)
    postal_code = models.CharField(max_length=20)
    country = models.CharField(max_length=120, default='USA')

    def __str__(self) -> str:
        return f"{self.label} - {self.city}"


class SKU(models.Model):
    code = models.CharField(max_length=60, unique=True)
    description = models.CharField(max_length=255)
    unit_price = models.DecimalField(max_digits=10, decimal_places=2)
    is_active = models.BooleanField(default=True)

    def __str__(self) -> str:
        return f"{self.code} - {self.description}"


class SalesOrder(models.Model):
    STATUS_CHOICES = [
        ('draft', 'Draft'),
        ('confirmed', 'Confirmed'),
        ('fulfilled', 'Fulfilled'),
    ]

    customer = models.ForeignKey(Customer, on_delete=models.PROTECT)
    shipping_address = models.ForeignKey(CustomerAddress, on_delete=models.PROTECT)
    order_date = models.DateField()
    status = models.CharField(max_length=20, choices=STATUS_CHOICES, default='draft')
    notes = models.TextField(blank=True)

    def __str__(self) -> str:
        return f"Order {self.id} - {self.customer.name}"

    @property
    def total(self) -> float:
        return sum(line.extended_price for line in self.lines.all())


class SalesOrderLine(models.Model):
    order = models.ForeignKey(SalesOrder, related_name='lines', on_delete=models.CASCADE)
    sku = models.ForeignKey(SKU, on_delete=models.PROTECT)
    quantity = models.PositiveIntegerField(default=1)
    unit_price = models.DecimalField(max_digits=10, decimal_places=2)

    @property
    def extended_price(self) -> float:
        return self.quantity * self.unit_price

    def __str__(self) -> str:
        return f"{self.order_id} - {self.sku.code}"
