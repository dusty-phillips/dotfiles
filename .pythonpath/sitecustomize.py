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


def djbug(*args, **kwargs):
    new_args = []
    for arg in args:
        if "django.db.models.base.Model" in {
            f"{cl.__module__}.{cl.__qualname__}" for cl in arg.__class__.__mro__
        }:
            new_args.append(
                (
                    f"Django Model {arg.__class__.__name__}",
                    {f.name: getattr(arg, f.name) for f in arg._meta.fields},
                )
            )
        else:
            new_args.append(arg)

    debug(*new_args, **kwargs)


__builtins__["debug"] = debug
__builtins__["djbug"] = djbug
