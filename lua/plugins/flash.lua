-- flash.nvim - 高速ナビゲーションプラグイン
-- https://github.com/folke/flash.nvim

---@type LazySpec
return {
  "folke/flash.nvim",
  event = "VeryLazy",
  ---@type Flash.Config
  opts = {
    labels = "asdfghjklqwertyuiopzxcvbnm",
    search = {
      -- 検索マッチ方法: "search"(正規表現), "exact"(完全一致), "fuzzy"(あいまい)
      mode = "search",
      incremental = true,
    },
    jump = {
      nohlsearch = true,
    },
    label = {
      uppercase = false,
      rainbow = {
        enabled = true,
        shade = 5,
      },
    },
    modes = {
      -- `/` や `?` 検索時にflashを有効化
      search = {
        enabled = true,
      },
      -- `f`, `F`, `t`, `T` モーションでもflashを使用
      char = {
        enabled = true,
        keys = { "f", "F", "t", "T", ";", "," },
      },
    },
  },
  -- stylua: ignore
  keys = {
    -- s: Flash検索 (Normal/Visual/Operator-pending)
    { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    -- S: Treesitter検索
    { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    -- r: リモートFlash (Operator-pending)
    { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
    -- R: Treesitter検索 (Operator-pending/Visual)
    { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    -- <C-s>: 検索中にFlashをトグル
    { "<C-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
  },
}
