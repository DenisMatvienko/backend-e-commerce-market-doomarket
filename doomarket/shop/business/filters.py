from shop.mixin.filter_mixin import FiltersPropertyValuesMixin


class FiltersPropertyValuesList(FiltersPropertyValuesMixin):
    """
        First of all, choose the part of filter when we want to get - 'title' or 'values'
        Method 'get_property(self, property_name_which_you_want_on_filter_title - arg)' - return the title of filter
        Method 'get_values(self, property_id_which_values_you_want_get_to_filter - arg)' - return the values of filter
    """
    def get_property_width(self):
        """ Get name-title of filter from pull of properties names """
        width_property_title = FiltersPropertyValuesMixin.get_property_name(self, 'Ширина')
        return width_property_title

    def get_value_width(self):
        """ Put id values of property to get property-values which want to view on filter """
        width_values_list = FiltersPropertyValuesMixin.get_value_id(self, 1)
        return width_values_list

    def get_property_thickness(self):
        """ Get name-title of filter from pull of properties names """
        thickness_property_title = FiltersPropertyValuesMixin.get_property_name(self, 'Толщина')
        return thickness_property_title

    def get_value_thickness(self):
        """ Put id values of property to get property-values which want to view on filter """
        thickness_values_list = FiltersPropertyValuesMixin.get_value_id(self, 5)
        return thickness_values_list

    def get_property_depth(self):
        """ Get name-title of filter from pull of properties names """
        depth_property_title = FiltersPropertyValuesMixin.get_property_name(self, 'Глубина')
        return depth_property_title

    def get_value_depth(self):
        """ Put id values of property to get property-values which want to view on filter """
        depth_values_list = FiltersPropertyValuesMixin.get_value_id(self, 2)
        return depth_values_list

    def get_property_height(self):
        """ Get name-title of filter from pull of properties names """
        height_property_title = FiltersPropertyValuesMixin.get_property_name(self, 'Высота')
        return height_property_title

    def get_value_height(self):
        """ Put id values of property to get property-values which want to view on filter """
        height_values_list = FiltersPropertyValuesMixin.get_value_id(self, 4)
        return height_values_list

    def get_property_diagonal(self):
        """ Get name-title of filter from pull of properties names """
        height_property_diagonal = FiltersPropertyValuesMixin.get_property_name(self, 'Диагональ экрана')
        return height_property_diagonal

    def get_value_diagonal(self):
        """ Put id values of property to get property-values which want to view on filter """
        height_values_diagonal = FiltersPropertyValuesMixin.get_value_id(self, 6)
        return height_values_diagonal

    def get_property_length_bracelet(self):
        height_property_length_bracelet = FiltersPropertyValuesMixin.get_property_name(self, 'Длина браслета')
        return height_property_length_bracelet

    def get_value_length_bracelet(self):
        """ Put id values of property to get property-values which want to view on filter """
        height_values_length_bracelet = FiltersPropertyValuesMixin.get_value_id(self, 7)
        return height_values_length_bracelet