return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/neotest-python",
  },
  opts = {
    adapters = {
      ["neotest-python"] = {
        -- Here you can specify the settings for the adapter, i.e.
        runner = "django",
        dap = {
          env = {
            MANAGE_PY_PATH = "manage.py",
            DJANGO_SETTINGS_MODULE = "core_app.settings.native_test",
          },
        },
      },
    },
  },
}
