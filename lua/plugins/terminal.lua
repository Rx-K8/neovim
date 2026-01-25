-- ターミナル設定: メタキー（Option）でターミナルを開く

---@type LazySpec
return {
  "akinsho/toggleterm.nvim",
  opts = {
    shell = "/bin/bash",
  },
  keys = {
    -- Option + j: 下にターミナル（水平分割）
    { "<M-j>", "<Cmd>ToggleTerm direction=horizontal<CR>", mode = { "n", "t" }, desc = "Toggle terminal (horizontal)" },
    -- Option + k: フローティングターミナル
    { "<M-k>", "<Cmd>ToggleTerm direction=float<CR>", mode = { "n", "t" }, desc = "Toggle terminal (float)" },
    -- Option + l: 右にターミナル（垂直分割、幅40%）
    {
      "<M-l>",
      function()
        local width = math.floor(vim.o.columns * 0.4)
        vim.cmd("ToggleTerm direction=vertical size=" .. width)
      end,
      mode = { "n", "t" },
      desc = "Toggle terminal (vertical)",
    },
  },
}
