from django.contrib import admin
from .models import Order, OrderItem
import csv
import datetime
from django.http import HttpResponse


def export_to_csv(modeladmin, request, queryset):
    """
        Exporting order data in csv file
        1) Add object of response with content-type & content-disposition conf's
        2) Write first line with title's of field's
        3) Write data
    """
    opts = modeladmin.model._meta
    response = HttpResponse(content_type='text/csv')
    value_for_naming_today = datetime.datetime.today().strftime("%Y-%m-%d-%H.%M.%S")
    response['Content-Disposition'] = f'attachment; filename=export-{value_for_naming_today}.csv'
    writer = csv.writer(response)
    fields = [field for field in opts.get_fields() if not field.many_to_many and not field.one_to_many]

    writer.writerow([field.verbose_name for field in fields])

    for obj in queryset:
        data_row = []
        for field in fields:
            value = getattr(obj, field.name)
            if isinstance(value, datetime.datetime):
                value = value.strftime('%d/%m/%Y')
            data_row.append(value)
        writer.writerow(data_row)
    return response
export_to_csv.short_description = 'Экспорт заказов в CSV'


class OrderItemInline(admin.TabularInline):
    """ Initialize Order item fields in admin """
    model = OrderItem
    raw_id_fields = ['product']


@admin.register(Order)
class OrderAdmin(admin.ModelAdmin):
    """ Initialize Order fields in admin """
    list_display = ['first_name', 'last_name', 'email', 'address', 'postal_code', 'city', 'paid', 'created',
                    'updated', 'id']
    list_filter = ['paid', 'created', 'updated']
    inlines = [OrderItemInline]
    actions = [export_to_csv]




