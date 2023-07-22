-- Install Packer automatically if it's not installed(Bootstraping)
-- Hint: string concatenation is done by `..`
local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end
local packer_bootstrap = ensure_packer()


-- Reload configurations if we modify plugins.lua
-- Hint
--     <afile> - replaced with the filename of the buffer being manipulated
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end


-- 设置窗口弹出方式安装插件;浮动显示
packer.init {
    display=  {
        open_fn=function()
            return require("packer.util").float{border="rounded"}
        end,
    },
}


-- Install plugins here - `use ...`
-- Packer.nvim hints
--     after = string or list,           -- Specifies plugins to load before this plugin. See "sequencing" below
--     config = string or function,      -- Specifies code to run after this plugin is loaded
--     requires = string or list,        -- Specifies plugin dependencies. See "dependencies".
--     ft = string or list,              -- Specifies filetypes which load this plugin.
--     run = string, function, or table, -- Specify operations to be run after successful installs/updates of a plugin
return require('packer').startup(function(use)
        -- Packer can manage itself
        use 'wbthomason/packer.nvim'

        ---------------------------------------
        -- NOTE: PUT YOUR THIRD PLUGIN HERE --
        ---------------------------------------

        use 'Mofiqul/dracula.nvim'


        --- lsp
        use { 'williamboman/mason.nvim' }
        use { 'williamboman/mason-lspconfig.nvim'}
        use { 'neovim/nvim-lspconfig' }

        -- Vscode-like pictograms
        use { 'onsails/lspkind.nvim', event = 'VimEnter' }


        -- cmp
        use { 'hrsh7th/nvim-cmp', after = 'lspkind.nvim', config = [[require('config.nvim-cmp')]] }
        use { 'hrsh7th/cmp-nvim-lsp', after = 'nvim-cmp' }
        use { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' } -- buffer auto-completion
        use { 'hrsh7th/cmp-path', after = 'nvim-cmp' } -- path auto-completion
        use { 'hrsh7th/cmp-cmdline', after = 'nvim-cmp' } -- cmdline auto-completion

        -- Code snippet engine
        use 'L3MON4D3/LuaSnip'
        use { 'saadparwaiz1/cmp_luasnip', after = { 'nvim-cmp', 'LuaSnip' } }


        -- Markdown support
        use { 'preservim/vim-markdown', ft = { 'markdown' } }

        -- Markdown previewer
        -- It require nodejs and yarn. Use homebrew to install first
        use {
            "iamcco/markdown-preview.nvim",
            run = "cd app && npm install",
            setup = function() vim.g.mkdp_filetypes = { "markdown" } end,
            ft = { "markdown" },
        }

        -- neovim tree
        use {
          'nvim-tree/nvim-web-devicons',
          'nvim-tree/nvim-tree.lua',
          config = [[require('config.nvim-tree')]]
        }

        -- Status line
        use {
            'nvim-lualine/lualine.nvim',
            requires = { 'kyazdani42/nvim-web-devicons', opt = true },
            config = [[require('config.lualine')]],
        }


        -- 启动页
         use {
          'glepnir/dashboard-nvim',
          event = 'VimEnter',
          requires = {'nvim-tree/nvim-web-devicons'},
          config = function()
            require('config.dashboard')
          end,
        }

        -- 括号自动补全
        use {
            'windwp/nvim-autopairs',
            after = 'nvim-cmp',
            config = [[require('config.nvim-autopairs')]],
        }

        -- 缩进线
        use "lukas-reineke/indent-blankline.nvim"

        -- Add hooks to LSP to support Linter && Formatter
        use { 'nvim-lua/plenary.nvim' }
        use {
            'jay-babu/mason-null-ls.nvim',
            after = 'plenary.nvim',
            requires = { 'jose-elias-alvarez/null-ls.nvim' },
            config=[[require('config.mason-null-ls')]]
        }

        -- Automatically set up your configuration after cloning packer.nvim
        -- Put this at the end after all plugins
        if packer_bootstrap then
            require('packer').sync()
        end
    end)
