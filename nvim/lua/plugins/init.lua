local fn = vim.fn
local packer_install_path = fn.stdpath('data') ..
                                '/site/pack/packer/start/packer.nvim'
local packer_bootstrap = false

if fn.empty(fn.glob(packer_install_path)) > 0 then
    packer_bootstrap = fn.system({
        'git', 'clone', '--depth', '1',
        'https://github.com/wbthomason/packer.nvim', packer_install_path
    })
    vim.cmd [[ packadd packer.nvim ]]
end

local ok, packer = pcall(require, 'packer')
if not ok then return end

packer.init {
    display = {
        open_fn = function()
            return require('packer.util').float {border = 'rounded'}
        end
    }
}

packer.startup(function(use)
    use {'wbthomason/packer.nvim'}
    use {
        'windwp/nvim-autopairs',
        config = function() require('nvim-autopairs').setup {} end
    }
    use {
        'kyazdani42/nvim-tree.lua',
        requires = {'kyazdani42/nvim-web-devicons'},
        config = function() require('nvim-tree').setup {} end
    }

    use {'pineapplegiant/spaceduck'}

    -- lsp
    use {'williamboman/mason.nvim'}
    use {'williamboman/mason-lspconfig.nvim'}
    use {
        'neovim/nvim-lspconfig',
        config = function() require('plugins.config.nvim-lspconfig') end
    }
    use {
        'hrsh7th/nvim-cmp',
        requires = {
            'hrsh7th/cmp-buffer', 'hrsh7th/cmp-path', 'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-nvim-lua', 'saadparwaiz1/cmp_luasnip',
            'L3MON4D3/LuaSnip', 'rafamadriz/friendly-snippets'
        },
        config = function() require('plugins.config.nvim-cmp') end
    }

    use {'fatih/vim-go', cmd = 'GoInstallBinaries'}
    use {'LnL7/vim-nix'}
    use {'alvan/vim-closetag'}
    use {'andrejlevkovitch/vim-lua-format'}
    use {'hashivim/vim-terraform'}

    if packer_bootstrap then require('packer').sync() end
end)
