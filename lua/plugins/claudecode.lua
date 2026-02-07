-- claudecode.nvim - Claude Code CLI連携
-- https://github.com/coder/claudecode.nvim

---@type LazySpec
return {
  "coder/claudecode.nvim",
  dependencies = { "folke/snacks.nvim" },
  opts = {
    terminal = {
      split_side = "right",
      split_width_percentage = 0.40,
      provider = "snacks",
    },
    diff_opts = {
      open_in_current_tab = false,
    },
  },
  keys = {
    { "<Leader>a", nil, desc = "AI/Claude Code" },
    { "<Leader>ac", "<Cmd>ClaudeCode<CR>", desc = "Toggle Claude" },
    { "<Leader>af", "<Cmd>ClaudeCodeFocus<CR>", desc = "Focus Claude" },
    { "<Leader>ar", "<Cmd>ClaudeCode --resume<CR>", desc = "Resume Claude" },
    { "<Leader>aC", "<Cmd>ClaudeCode --continue<CR>", desc = "Continue Claude" },
    { "<Leader>am", "<Cmd>ClaudeCodeSelectModel<CR>", desc = "Select Claude model" },
    { "<Leader>ab", "<Cmd>ClaudeCodeAdd %<CR>", desc = "Add current buffer" },
    { "<Leader>as", "<Cmd>ClaudeCodeSend<CR>", mode = "v", desc = "Send to Claude" },
    {
      "<Leader>as",
      "<Cmd>ClaudeCodeTreeAdd<CR>",
      desc = "Add file",
      ft = { "NvimTree", "neo-tree", "oil", "minifiles", "netrw" },
    },
    -- Diff management
    { "<Leader>aa", "<Cmd>ClaudeCodeDiffAccept<CR>", desc = "Accept diff" },
    { "<Leader>ad", "<Cmd>ClaudeCodeDiffDeny<CR>", desc = "Deny diff" },
  },
}
