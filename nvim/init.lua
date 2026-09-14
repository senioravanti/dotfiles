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
	'https://github.com/folke/tokyonight.nvim',
	'https://github.com/nvim-tree/nvim-web-devicons',
	'https://github.com/nvim-lualine/lualine.nvim'
})

vim.cmd[[colorscheme tokyonight-night]]

require('lualine').setup {
	options = {
		theme = 'auto', -- lualine theme
		component_separators = { left = '', right = '' },
		section_separators = { left = '', right = '' },
		always_divide_middle = true, -- When set to true, left sections i.e. 'a','b' and 'c'
																 -- can't take over the entire statusline even
																 -- if neither of 'x', 'y' or 'z' are present.

		always_show_tabline = true, -- When set to true, if you have configured lualine for displaying tabline
																-- then tabline will always show. If set to false, then tabline will be displayed
																-- only when there are more than 1 tab. (see :h showtabline)

		globalstatus = false,       -- enable global statusline (have a single statusline
                                -- at bottom of neovim instead of one for  every window).
                                -- This feature is only available in neovim 0.7 and higher.
																-- refresh = {                  -- sets how often lualine should refresh it's contents (in ms)
    statusline = 100,         	-- The refresh option sets minimum time that lualine tries
    tabline = 100,            	-- to maintain between refresh. It's not guarantied if situation
    winbar = 100,               -- arises that lualine needs to refresh itself before this time
                                -- it'll do it.
    refresh_time = 16,          -- ~60fps the time after which refresh queue is processed. Mininum refreshtime for lualine
		events = {                  -- The auto command events at which lualine refreshes
      'WinEnter',
      'BufEnter',
      'BufWritePost',
      'SessionLoadPost',
      'FileChangedShellPost',
      'VimResized',
      'Filetype',
      'CursorMoved',
      'CursorMovedI',
      'ModeChanged',
    },
	}
}
