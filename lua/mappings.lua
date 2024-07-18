local keymap = vim.api.nvim_set_keymap

-- n
-- Childish stuff
-- keymap ("n", "<leader>te", "<cmd>Neotree toggle<CR>", { desc = "Toggle NeoTree", noremap = true, silent = true })
-- keymap ("n", "<leader>to", "<cmd>Neotree focus<CR>", { desc = "Focus NeoTree", noremap = true, silent = true })
keymap ("n", "<leader>Ss", "<cmd>SessionManager save_current_session<CR>", { desc = "Save session", noremap = true, silent = true })
keymap ("n", "<leader>Sf", "<cmd>SessionManager save_current_session<CR>", { desc = "Save session", noremap = true, silent = true })

-- Sessions
keymap ("n", "<leader>Sl", "<cmd>SessionManager! load_last_session<cr>", { desc = "Load last session", noremap = true, silent = true })
keymap ("n", "<leader>Ss", "<cmd>SessionManager! save_current_session<cr>", { desc = "Save this session", noremap = true, silent = true })
keymap ("n", "<leader>Sd", "<cmd>SessionManager! delete_session<cr>", { desc = "Delete session", noremap = true, silent = true })
keymap ("n", "<leader>Sf", "<cmd>SessionManager! load_session<cr>", { desc = "Search sessions", noremap = true, silent = true })
keymap ("n", "<leader>S.", "<cmd>SessionManager! load_current_dir_session<cr>", { desc = "Load current directory session", noremap = true, silent = true })
keymap ("n", "<leader>tu", "<cmd>lua require('undotree').toggle()<CR>", { desc = "Toggle Undotree", noremap = true, silent = true })
keymap ("n", "<C-d>", "<C-d>zz", { noremap = true, silent = true })
keymap ("n", "<C-u>", "<C-u>zz", { noremap = true, silent = true })


-- keymap ("n", "<C-Tab>", {
-- 		function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end},
-- 		{ desc = "Switch to buffer tab right", noremap = true, silent = true })
	-- ["<C-S-Tab>"] = {
	-- 	function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
	-- 	desc = "Switch to buffer tab left",
	-- }
keymap ("n", "n", "nzzzv", { noremap = true, silent = true })
keymap ("n", "N", "Nzzzv", { noremap = true, silent = true })
keymap ("n", "<leader>y", "\"+y", {desc = "Copy to CB", noremap = true, silent = true })
keymap ("n", "p", "\"\"p", { noremap = true, silent = true })
keymap ("n", "P", "\"\"P", { noremap = true, silent = true })
	-- ["<leader>p"] = {"\"+p", desc = "Paste from CB"}
	-- ["<leader>P"] = {"\"+P", desc = "Paste from CB before the cursor"}
keymap ("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { noremap = true, silent = true })
keymap ("n", "<leader>x", "<cmd>silent !chmod +x %<CR>", { desc = "Make the file executable", noremap = true, silent = true })

keymap ("n", "<leader>pc", "<cmd>UserConfUpdate<CR>", { desc = "Update User config", noremap = true, silent = true })
-- Terminal
	-- Overwrite default to have a name
keymap ("n", "<leader>tt", "<cmd>ToggleTerm size=10 direction=horizontal name=TheOnly<cr>", { desc = "ToggleTerm TheOnly", noremap = true, silent = true })
-- v	-- Do NOT overwrite current buffer on paste
keymap ("v", "p", "\"_dp", { noremap = true, silent = true })
keymap ("v", "d", "\"_d", { noremap = true, silent = true })
keymap ("v", "<Del>", "\"_d", { noremap = true, silent = true })
keymap ("v", "<leader>y", "\"+y", { noremap = true, silent = true })
keymap ("v", "<leader>s", [[:s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { noremap = true, silent = true })
-- t
keymap ("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Enter Normal Mode", noremap = true, silent = true })
keymap ("t", "<C-v><Esc>", "<Esc>", { desc = "Send Escape to the running command", noremap = true, silent = true })
