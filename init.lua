vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "number"

-- Set leader to space
vim.g.mapleader = " "

-- Add packages
vim.pack.add({
	"https://github.com/folke/tokyonight.nvim",
	"https://github.com/nvim-lua/plenary.nvim",
	{ src = "https://github.com/nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	"https://github.com/nvim-telescope/telescope.nvim",
	"https://github.com/romus204/tree-sitter-manager.nvim",
})

require("tokyonight").setup({})

vim.cmd[[colorscheme tokyonight]]

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })

require("tree-sitter-manager").setup({
	ensure_installed = {"go", "lua"},
	auto_installed = true,
})
