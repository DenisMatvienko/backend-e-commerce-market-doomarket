from shop.models.product import Property, Value


class FiltersPropertyValuesMixin:
    """
        The lists on filter sidebar

        Negative side of create property filters in this EAV model decision- that the to each of Product Type we need
        to create, every time, newest properties which may repeat 'name' field, and after this we will have same
        field-names properties. Otherwise- if we make the field unique, we can't relate this object to other, and can't
        create new. They will be create values to different Product Type objects.

        In other words we can use the one property to different ProductTypes because M2M,

        Note:
            Into func we can use also 'field_name___id='to hard-find specific value of property', actually we did it
            in 'get_value'
            Into func we can use also 'field_name___startswith='to find part of the property values'
    """

    def get_property_name(self, property_name_which_you_want_on_filter_title):
        """ Find property which related to product_type, return property name into filter"""
        get_property_in_product_type = Property.objects.filter(product_type__slug=self.kwargs.get('slug'))
        return get_property_in_product_type.filter(name=property_name_which_you_want_on_filter_title)

    def get_value_id(self, property_id_which_values_you_want_get_to_filter):
        """ Find values which related to product_type, return values name into filter"""
        get_value_in_product_type = Value.objects.filter(properties__product_type__slug=self.kwargs.get('slug'))
        return get_value_in_product_type.filter(properties__id=property_id_which_values_you_want_get_to_filter)