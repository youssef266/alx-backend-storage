#!/usr/bin/env python3
""" Main file
"""
import requests
import time
from functools import wraps


def cache_result(expiration_time):
    """ Cache result decorator """
    def decorator(func):
        """ Decorator """
        cache = {}

        @wraps(func)
        def wrapper(url):
            """ Wrapper """
            if (url in cache and
                    time.time() - cache[url]['timestamp'] < expiration_time):
                return cache[url]['content']

            response = requests.get(url)
            content = response.text

            cache[url] = {
                'content': content,
                'timestamp': time.time()
            }

            return content

        return wrapper

    return decorator


@cache_result(expiration_time=10)
def get_page(url):
    response = requests.get(url)
    return response.text
