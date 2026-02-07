-- TypeScript/React開発環境: ts_ls + biome + tailwindcss
-- ts_ls: 型チェック、補完、hover、定義ジャンプ
-- biome: リンター、フォーマッター（ESLint/Prettierの代替）
-- tailwindcss: Tailwind CSSクラス補完

---@type LazySpec
return {
  -- Treesitter: 構文解析（ハイライト、インデント等）
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if opts.ensure_installed ~= "all" then
        opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
          "typescript",
          "tsx",
          "javascript",
          "css",
          "html",
          "json",
        })
      end
    end,
  },

  -- Mason: ツール自動インストール
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
        "typescript-language-server", -- LSP: 型チェック、補完
        "biome",                       -- リンター/フォーマッター
        "tailwindcss-language-server", -- Tailwind CSS補完
      })
    end,
  },

  -- AstroLSP: LSP設定
  {
    "AstroNvim/astrolsp",
    ---@type AstroLSPOpts
    opts = {
      config = {
        -- TypeScript LSP設定
        ts_ls = {
          settings = {
            typescript = {
              inlayHints = {
                includeInlayParameterNameHints = "all",
                includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayVariableTypeHints = true,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayEnumMemberValueHints = true,
              },
            },
            javascript = {
              inlayHints = {
                includeInlayParameterNameHints = "all",
                includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayVariableTypeHints = true,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayEnumMemberValueHints = true,
              },
            },
          },
        },
        -- Biome設定（フォーマット/リント）
        biome = {
          -- biome.jsonがあるプロジェクトでのみ有効化
          root_dir = function(fname)
            return require("lspconfig.util").root_pattern("biome.json", "biome.jsonc")(fname)
          end,
        },
        -- Tailwind CSS設定
        tailwindcss = {
          settings = {
            tailwindCSS = {
              experimental = {
                classRegex = {
                  { "cva\\(([^)]*)\\)", "[\"'`]([^\"'`]*).*?[\"'`]" },
                  { "cx\\(([^)]*)\\)", "(?:'|\"|`)([^']*)(?:'|\"|`)" },
                  { "cn\\(([^)]*)\\)", "(?:'|\"|`)([^']*)(?:'|\"|`)" },
                },
              },
            },
          },
        },
      },
      -- フォーマッターの設定
      formatting = {
        disabled = {
          -- ts_lsのフォーマットを無効化（biomeに任せる）
          "ts_ls",
        },
      },
    },
  },
}
