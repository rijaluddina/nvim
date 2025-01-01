return {
  {
    "NvChad/nvterm",
    cmd = "Nvterm",
    config = function()
      require("nvterm").setup({
        terminals = {
          shell = vim.o.shell,
          list = {},
          type_opts = {
            float = {
              relative = "editor",
              row = 0.1,
              col = 0.1,
              width = 0.8,
              height = 0.78,
              border = "rounded",
            },
            horizontal = { location = "rightbelow", split_ratio = 0.4 },
            vertical = { location = "rightbelow", split_ratio = 0.5 },
          },
        },
        behavior = {
          autoclose_on_quit = {
            enabled = true,
            confirm = true,
          },
          close_on_exit = true,
          auto_insert = true,
        },
      })
    end,
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      filesystem = {
        filtered_items = {
          visible = true,
          hide_gitignored = false,
          hide_dotfiles = false,
          hide_by_name = {
            ".github",
            ".gitignore",
          },
          never_show = { ".git" },
        },
      },
    },
  },
}
