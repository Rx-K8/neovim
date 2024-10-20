require("nvchad.mappings")

local map = vim.keymap.set

map("i", "jj", "<ESC>")
map("n", "x", '"_x')
map("n", "X", '"_X')
map("n", "dc", '"_d')
map("n", "Dc", '"_D')


-- lazygit
map("n", "<leader>lg", "<cmd>LazyGit<cr>", { desc = "LazyGit" })

-- copilot chat
map("n", "<leader>ccq", function()
	local input = vim.fn.input("Quick Chat: ")
	if input ~= "" then
		require("CopilotChat").ask(input, { selection = require("CopilotChat.select").buffer })
	end
end, { desc = "CopilotChat - Quick chat" })

map("n", "<leader>ccp", function()
	local actions = require("CopilotChat.actions")
	require("CopilotChat.integrations.telescope").pick(actions.prompt_actions())
end, { desc = "CopilotChat - Prompt actions" })

map("n", "<leader>cch", function()
	local actions = require("CopilotChat.actions")
	require("CopilotChat.integrations.telescope").pick(actions.help_actions())
end, { desc = "CopilotChat - Help actions" })

-- Debug
map("n", "<leader>dpr", function()
	require("dap-python").test_method()
end, { desc = "Run test method" })

map("n", "<leader>dl", function()
	require("dapui").toggle()
end, { desc = "Debug launch" })

map("n", "<leader>db", ":DapToggleBreakpoint <CR>", { desc = "Breakpoint" })
map("n", "<F5>", ":DapContinue<CR>", { desc = "Debug continue" })
map("n", "<F10>", ":DapStepOver<CR>", { desc = "Debug step over" })
map("n", "<F11>", ":DapStepInto<CR>", { desc = "Debug step into" })
map("n", "<F12>", ":DapStepOut<CR>", { desc = "Debug step out" })

-- flash
map({ "n", "x", "o" }, "<leader>s", function()
	require("flash").jump()
end, { desc = "Flash" })

map({ "n", "x", "o" }, "<leader>S", function()
	require("flash").treesitter()
end, { desc = "Flash Treesitter" })
