-- Set <space> as the leader key
-- See `:help mapleader`
--	NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})



-- [[ Install `lazy.nvim` plugin manager ]]
-- See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
	local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
	local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
	if vim.v.shell_error ~= 0 then
		error('Error cloning lazy.nvim:\n' .. out)
	end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({{import = "plugins"}})

require("options")
require("mappings")

-- Completely mine

vim.cmd.colorscheme = "catppuccin"

vim.cmd.set('wrap')
vim.cmd.set('paste')


vim.api.nvim_create_augroup("AutoRestore", {})
-- vim.api.nvim_create_autocmd("VimEnter", {
-- 	pattern = "*",
-- 	group = "AutoRestore",
-- 	once = true,
-- 	callback = function(_)
-- 		local stargs = vim.fn.argc()
-- 		local vcwd = vim.fn.getcwd()
-- 		local homedir = os.getenv("HOME")
-- 		-- Load last closed session if launched from ~ with no arguments
-- 		if (stargs == 0 and vcwd == homedir) then
-- 			-- Skip if another instance is already running
-- 			local nvims = io.popen("pgrep -x nvim|wc -l"):read("n")
-- 			-- Every instance spawns 2 processes IDK why
-- 			if nvims > 2 then
-- 				-- require("alpha").start(false)
-- 				-- vim.cmd.Neotree("toggle")
-- 				return
-- 			else
-- 				vim.cmd.SessionManager("load_last_session")
--         return
-- 			end
-- 	-- Load expliticly specified non-~ directory session if it exists
-- 		elseif (stargs == 0 and vcwd ~= homedir) then
-- 			if require("session_manager.config").dir_to_session_filename(vcwd):exists() then
-- 				vim.cmd.SessionManager("load_current_dir_session")
--         return
-- 			end
-- 		end
-- 	end,
-- })

	vim.api.nvim_create_autocmd({ "User" }, {
	pattern = "SessionLoadPost",
	group = "AutoRestore",
	callback = function()
		-- Load appropriate git config for current directory
		-- TODO: move to a dedicated envgetting function as this var is already used in 2 places
		local vcwd = vim.fn.getcwd()
		require("utils.git").profiler(vcwd)
		-- Open neo-tree upon session load because I'm a child
		-- vim.cmd.Neotree('toggle')
		-- vim.cmd.wincmd "p"
		-- require("telescope.builtin").find_files()
	end,
})

	-- Auto save session
-- local function is_neotree_open()
--	 for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
--		 if vim.api.nvim_buf_get_option(vim.api.nvim_win_get_buf(win), 'ft') == 'neo-tree' then
--			 return true
--		 end
--	 end
--	 return false
-- end,

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
	callback = function()
		-- Don't save at home
		if vim.fn.getcwd() == os.getenv("HOME") then return end
		-- local neotreeOpen = is_neotree_open()
		-- if ( neotreeOpen == true ) then vim.cmd.Neotree('toggle') end
		for _, buf in ipairs(vim.api.nvim_list_bufs()) do
			-- Don't save while there's any 'nofile' buffer open.
			local bufType = vim.api.nvim_get_option_value("buftype", { buf = buf })
			-- local fileType = vim.api.nvim_get_option_value("filetype", { buf= buf })
			if ((bufType == 'nofile') --[[ and not ( fileType	== 'neo-tree') ]]) then
				return
			end
		end
		vim.cmd.SessionManager("save_current_session")
		-- if ( neotreeOpen == true ) then vim.cmd.Neotree('toggle') end
	end
})

	-- vim.api.nvim_create_user_command(
--	 "NotifyOS",
--	 function(opts)
--			 return require("utils.notifier").notify(opts)
--	 end,
--	 {
--		 nargs = "*",
--		 desc = "Send desktop notification",
--		 bang = true
--	 }
-- ),
-- vim.api.nvim_create_user_command(
--	 "TestF",
--	 function()
--		 local i = "fgdgvgf"
--		 return tostring("kljugb")
--		 -- return i
--		 -- print("icfobyhb")
--	 end,
-- {})

-- User conf updater
vim.api.nvim_create_user_command(
	"UserConfUpdate",
	function()
		require("utils.updater").update() end,
	{ desc = "Update User config" }
)

-- lsp = {
--	 formatting = {
--		 format_on_save = {
--			 enabled = false
--		 },
--	 },
-- },


-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
