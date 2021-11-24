from contextlib import suppress

with suppress(ImportError):
    from devtools import debug

    __builtins__["debug"] = debug

with suppress(ImportError):
    import colored_traceback

    colored_traceback.add_hook()
