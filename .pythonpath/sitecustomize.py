from contextlib import suppress
from pprint import pprint

__builtins__["pprint"] = pprint

try:
    from devtools import debug
except ImportError:

    def debug(*args, file_=None, flush_=True, **kwargs):
        for arg in args:
            pprint(arg, file_)


with suppress(ImportError):
    import colored_traceback

    colored_traceback.add_hook()


__builtins__["debug"] = debug
