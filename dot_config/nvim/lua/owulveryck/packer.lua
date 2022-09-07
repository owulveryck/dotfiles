-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	use('lewis6991/impatient.nvim') -- speedup lua module load time

	-- Packer can manage itself
	use 'wbthomason/packer.nvim'
	use 'folke/tokyonight.nvim'
	use 'dstein64/vim-startuptime'
	use {
		'nvim-treesitter/nvim-treesitter',
		run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
		config = get_setup('treesitter'),
	}
	use{ 
		'ray-x/go.nvim',
		requires = "ray-x/guihua.lua",
		after = 'nvim-cmp',
		ft = 'go',
		config = get_setup('go'),
	}
	use {
		"hrsh7th/nvim-cmp",
		config = get_setup('cmp'),

		requires = {
			"hrsh7th/cmp-buffer", "hrsh7th/cmp-nvim-lsp",
			'quangnguyen30192/cmp-nvim-ultisnips', 'hrsh7th/cmp-nvim-lua',
			'octaltree/cmp-look', 'hrsh7th/cmp-path', 'hrsh7th/cmp-calc',
			'f3fora/cmp-spell', 'hrsh7th/cmp-emoji'
		},
	}
	use 'neovim/nvim-lspconfig'
	use {
		'nvim-lualine/lualine.nvim',
		config = get_setup('lualine'),
	}
	use 'numToStr/Comment.nvim'
	-- install without yarn or npm
	use({
		"iamcco/markdown-preview.nvim",
		run = function() vim.fn["mkdp#util#install"]() end,
	})
	use 'ixru/nvim-markdown'
	use "rafamadriz/friendly-snippets"
	use 'jjo/vim-cue'
	-- Installation
	use { 'saadparwaiz1/cmp_luasnip' }
	use {
		'L3MON4D3/LuaSnip',
		after = 'nvim-cmp',
		config = get_setup('snippets'),
	}
	use {
		"windwp/nvim-autopairs",
		config = function() require("nvim-autopairs").setup {} end
	}
	use {"akinsho/toggleterm.nvim", tag = '*', config = function()
		require("toggleterm").setup()
	end}
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.0',
		requires = { 
			'nvim-lua/plenary.nvim', 'kyazdani42/nvim-web-devicons', 'sharkdp/fd',
		},
		config = get_setup('telescope'),
	} 
end)
