-- This will run last in the setup process.
-- This is just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

require'lspconfig'.pylsp.setup{
  cmd = {"pylsp", "-vvv", "--log-file", "/tmp/lsp.log"},
  settings = {
    pylsp = {
      plugins = {
        -- formatter options
        black = { enabled = false },
        autopep8 = { enabled = false },
        yapf = { enabled = false },
        -- linter options
        pylint = { enabled = false, executable = "pylint", args = {"--max-line-length=100"} },
        pyflakes = { enabled = false },
        pycodestyle = { enabled = false },
        -- type checker
        pylsp_mypy = { enabled = false },
        -- auto-completion options
        jedi_completion = { fuzzy = true },
        -- import sorting
        pyls_isort = { enabled = true },

        ruff = {
          enabled = true,  -- Enable the plugin
          formatEnabled = true,  -- Enable formatting using ruffs formatter
          executable = "ruff",  -- Custom path to ruff
          config = "~/.config/ruff/ruff.toml",  -- Custom config for ruff to use
          extendSelect = { "I" },  -- Rules that are additionally used by ruff
          extendIgnore = { "C90" },  -- Rules that are additionally ignored by ruff
          format = { "I" },  -- Rules that are marked as fixable by ruff that should be fixed when running textDocument/formatting
          severities = { ["D212"] = "I" },  -- Optional table of rules where a custom severity is desired
          unsafeFixes = false,  -- Whether or not to offer unsafe fixes as code actions. Ignored with the "Fix All" action
          formatEnabled = true,
          -- Rules that are ignored when a pyproject.toml or ruff.toml is present:
          lineLength = 88,  -- Line length to pass to ruff checking and formatting
          exclude = { "__about__.py" },  -- Files to be excluded by ruff checking
          select = { "F" },  -- Rules to be enabled by ruff
          ignore = { "D210" },  -- Rules to be ignored by ruff
          perFileIgnores = { ["__init__.py"] = "CPY001" },  -- Rules that should be ignored for specific files
          preview = false,  -- Whether to enable the preview style linting and formatting.
          targetVersion = "py310",  -- The minimum python version to target (applies for both linting and formatting).
        },
      }
    }
  }
}
