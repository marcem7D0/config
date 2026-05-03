vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "number"

vim.pack.add({
	"https://github.com/folke/tokyonight.nvim",
})

require("tokyonight").setup({})

vim.cmd[[colorscheme tokyonight]]
