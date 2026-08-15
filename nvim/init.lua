vim.o.relativenumber = true
vim.o.wrap = false

vim.o.tabstop = 2
vim.o.shiftwidth = 2

vim.o.smartcase = true
vim.o.ignorecase = true

vim.o.hlsearch = true
vim.o.signcolumn = 'number'

vim.o.clipboard = 'unnamedplus'

vim.opt.completeopt = {'menu', 'menuone', 'noselect'}

vim.pack.add({
  'https://github.com/nvim-mini/mini.nvim',
  'https://github.com/neovim/nvim-lspconfig',
  'https://github.com/nvim-treesitter/nvim-treesitter',
	'https://github.com/folke/tokyonight.nvim'
})

vim.cmd[[colorscheme tokyonight-night]]

