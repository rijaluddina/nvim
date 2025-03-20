return {
  -- lspconfig
  {
    "neovim/nvim-lspconfig",
    event = "LazyFile",
    dependencies = {
      "williamboman/mason.nvim",
      { "williamboman/mason-lspconfig.nvim", config = function() end },
    },
    opts = {
      ---@type lspconfig.options
      servers = {
        eslint = {},
        intelephense = {
          diagnostics = { enable = true },
          environment = {
            documentRoot = "/path/to/src",
            includePaths = {
              "/path/to/drupal/root",
            },
            phpVersion = "8.3",
          },
          files = {
            associations = { "*.blade.php", "*.php", "*.module", "*.inc", "*.install" },
            exclude = {
              "/path/to/symlinked/src/under/drupal/root/**",
            },
          },
          format = { enable = true },
          licenseKey = "~/.intelephense",
          telemetry = { enabled = false },
        },
        tailwindcss = {
          settings = {
            tailwindCSS = {
              experimental = {
                classRegex = {
                  "@?class\\(([^]*)\\)",
                  "'([^']*)'",
                },
              },
            },
          },
        },
      },
      setup = {
        eslint = function()
          require("lazyvim.util").lsp.on_attach(function(client)
            if client.name == "eslint" then
              client.server_capabilities.documentFormattingProvider = true
            elseif client.name == "tsserver" then
              client.server_capabilities.documentFormattingProvider = false
            end
          end)
        end,
        clangd = function(_, opts)
          opts.capabilities.offsetEncoding = { "utf-16" }
        end,
      },
    },
  },

  -- mason
  {
    "williamboman/mason.nvim",
    opts = {
      ui = {
        border = "rounded",
        size = {
          width = 0.8,
          height = 0.8,
        },
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
      ensure_installed = {
        "prettier",
        "blade-formatter",
        "json-lsp",
        "nixpkgs-fmt",
        "rnix-lsp",
        "markdown-toc",
        "markdownlint-cli2",
        "vue-language-server",
        "rust-analyzer",
        "vtsls",
        "rustfmt",
        "cpptools",
      },
    },
  },
  {
    "stefanboca/venv-selector.nvim",
    enable = true,
    branch = "sb/push-rlpxsqmllxtz", -- Use this branch for the new version
    cmd = "VenvSelect",
    enabled = function()
      return LazyVim.has("snacks.nvim")
    end,
    opts = {
      settings = {
        options = {
          notify_user_on_venv_activation = true,
        },
      },
    },
    --  Call config for python files and load the cached venv automatically
    ft = "python",
    keys = { { "<leader>cv", "<cmd>:VenvSelect<cr>", desc = "Select VirtualEnv", ft = "python" } },
  },
}
