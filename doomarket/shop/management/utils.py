from django.utils.text import slugify
from transliterate import translit, get_available_language_codes
from time import time


def gen_slug_clear(s):
    """
     Generation clear slug (without timecode after slugify name) from 'title'-field (if 'title' on russian
     language- field transliterate)

     's' args - one of class property (example: 'name', 'alias', etc..)
     """
    transliterate_the = translit(s, 'ru', reversed=True)
    new_slug = slugify(transliterate_the)
    return new_slug


def gen_slug(s):
    """
     Generation slug (with timecode after slugify name) from 'name'-field (if 'name' on russian language-
     field transliterate), not using 'prepopulated_field' cause did't have more unique things like in it func

     's' args - one of class property (example: 'name', 'alias', etc..)

     """
    return gen_slug_clear(s) + '' + str(int(time()))



