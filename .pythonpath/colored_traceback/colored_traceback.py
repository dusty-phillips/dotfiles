import os
import sys
import traceback

try:
    from pygments import highlight
    from pygments.lexers import get_lexer_by_name
    from pygments.formatters import get_formatter_by_name
    from pygments.util import ClassNotFound

    PYGMENTS = True
except ImportError:
    PYGMENTS = False


if os.environ.get("NO_COLOR", ""):  # https://no-color.org
    def add_hook(debug=False, **kwargs):
        pass

elif PYGMENTS:
    try:
        import colorama
        translate_stream = colorama.AnsiToWin32
    except ImportError:
        def translate_stream(stream):
            return stream

    def _get_term_color_support():
        try:
            import curses
        except ImportError:
            # Probably Windows, which doesn't have great curses support
            return 16
        curses.setupterm()
        return curses.tigetnum('colors')

    def _determine_formatter(style="default", colors=None, debug=False):
        colors = colors or _get_term_color_support()
        if debug:
            sys.stderr.write("Detected support for %s colors\n" % colors)
        if colors == 256:
            fmt_options = {'style': style}
        elif style in ('light', 'dark'):
            fmt_options = {'bg': style}
        else:
            fmt_options = {'bg': 'dark'}
        fmt_alias = 'terminal256' if colors == 256 else 'terminal'
        try:
            return get_formatter_by_name(fmt_alias, **fmt_options)
        except ClassNotFound as ex:
            if debug:
                sys.stderr.write(str(ex) + "\n")
            return get_formatter_by_name(fmt_alias)

    LEXER = get_lexer_by_name(
        "pytb" if sys.version_info.major < 3 else "py3tb"
    )

    class Colorizer(object):
        def __init__(self, style, colors, debug=False):
            self.style = style
            self.debug = debug
            self.lexer = LEXER
            self.formatter = _determine_formatter(style, colors, debug)

        def colorize_traceback(self, type, value, tb):
            tb_text = "".join(traceback.format_exception(type, value, tb))
            tb_colored = highlight(tb_text, self.lexer, self.formatter)
            self.stream.write(tb_colored)

        @property
        def stream(self):
            return translate_stream(sys.stderr)

    def add_hook(always=False, style='default', colors=None, debug=False):
        isatty = getattr(sys.stderr, 'isatty', lambda: False)
        if always or isatty():
            colorizer = Colorizer(style, colors, debug)
            sys.excepthook = colorizer.colorize_traceback

else:
    def add_hook(debug=False, **kwargs):
        if debug:
            sys.stderr.write(
                "Failed to add coloring hook; pygments not available\n"
            )
