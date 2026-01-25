-- Python開発環境: pyright + ruff + mypy
-- pyright: 型チェック、補完、hover
-- ruff: リンター、フォーマッター
-- mypy: 静的型チェック（none-ls経由）

---@type LazySpec
return {
  -- Treesitter: Python/TOML構文解析
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if opts.ensure_installed ~= "all" then
        opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "python", "toml" })
      end
    end,
  },

  -- Mason: ツール自動インストール
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
        "pyright",    -- LSP: 型チェック
        "ruff",       -- LSP: リンター/フォーマッター
        "mypy",       -- 静的型チェッカー
      })
    end,
  },

  -- AstroLSP: pyright設定
  {
    "AstroNvim/astrolsp",
    ---@type AstroLSPOpts
    opts = {
      config = {
        pyright = {
          settings = {
            python = {
              analysis = {
                typeCheckingMode = "basic",
                autoImportCompletions = true,
                diagnosticMode = "openFilesOnly",
              },
            },
          },
        },
        ruff = {
          -- ruffのhover機能を無効化（pyrightに任せる）
          on_attach = function(client, _)
            client.server_capabilities.hoverProvider = false
          end,
          init_options = {
            settings = {
              -- ruff固有の設定（必要に応じてカスタマイズ）
              lineLength = 88,
              -- organizeImportsはruffに任せる
            },
          },
        },
      },
    },
  },

  -- none-ls: mypy診断
  {
    "nvimtools/none-ls.nvim",
    opts = function(_, opts)
      local null_ls = require "null-ls"
      opts.sources = require("astrocore").list_insert_unique(opts.sources, {
        null_ls.builtins.diagnostics.mypy.with {
          -- mypy設定（必要に応じてカスタマイズ）
          extra_args = function()
            local virtual = os.getenv "VIRTUAL_ENV" or os.getenv "CONDA_PREFIX" or "/usr"
            return { "--python-executable", virtual .. "/bin/python" }
          end,
        },
      })
    end,
  },

  -- venv-selector: 仮想環境選択
  {
    "linux-cultist/venv-selector.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
      "nvim-telescope/telescope.nvim",
    },
    opts = {},
    cmd = "VenvSelect",
    keys = {
      { "<Leader>lv", "<Cmd>VenvSelect<CR>", desc = "Select Python venv" },
    },
  },
}
