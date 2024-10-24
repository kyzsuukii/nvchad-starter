return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },

  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    opts = {
      panel = {
        auto_refresh = true,
        layout = {
          position = "right",
          ratio = 0.3,
        },
      },
      suggestion = {
        auto_trigger = true,
        keymap = {
          accept = "<C-l>",
        },
      },
    },
  },

  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "canary",
    dependencies = {
      { "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
      { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
    },
    build = "make tiktoken", -- Only on MacOS or Linux
    opts = {
      debug = false, -- Enable debugging
      model = "gpt-4",
    },
  },

  {
    "smoka7/hop.nvim",
    opts = {
      keys = "etovxqpdygfblzhckisuran",
    },
  },

  {
    "LintaoAmons/cd-project.nvim",
    init = function()
      require("cd-project").setup {
        projects_config_filepath = vim.fs.normalize(vim.fn.stdpath "config" .. "/cd-project.nvim.json"),
        project_dir_pattern = { ".git", ".gitignore", "Cargo.toml", "package.json", "go.mod" },
        choice_format = "both",
        projects_picker = "telescope",
        auto_register_project = false,
        hooks = {
          -- {
          --   trigger_point = "BEFORE_CD",
          --   callback = function(_)
          --     vim.print("before cd project")
          --     require("bookmarks").api.mark({name = "before cd project"})
          --   end,
          -- },
          -- {
          --   callback = function(_)
          --     require("telescope").extensions.smart_open.smart_open({
          --       cwd_only = true,
          --       filename_first = false,
          --     })
          --   end,
          -- },
        },
      }
    end,
  },
}
