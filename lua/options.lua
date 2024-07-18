local options = {
	number = true,
	relativenumber = true,
	spelllang = "en_us",
	mouse = 'a',
	showmode = false,
	ignorecase = true,
	smartcase = true,
	signcolumn = 'yes',
	timeoutlen = 300,
	splitright = true,
	splitbelow = true,
	list = true,
	listchars = { tab = '» ', trail = '·', nbsp = '␣' },
	inccommand = 'split',
	cursorline = true,
	breakindent = true,
	foldlevelstart = 999,
	shiftwidth = 2,
	tabstop = 2,
	swapfile = false,
	backup = false,
	undodir = vim.fn.stdpath("data").."/undodir",
	undofile = true,
	scrolloff = 10,
	-- updatetime = 250,
	updatetime = 50,
	-- clipboard = 'unnamedplus',
	clipboard = "unnamed",
	hlsearch = true
}

for k, v in pairs(options) do
	vim.opt[k] = v
end
