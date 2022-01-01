--          __         _
--   ____ _/ /_ _   __(_)___ ___
--  / __ `/ __ \ | / / / __ `__ \
-- / /_/ / /_/ / |/ / / / / / / /
-- \__,_/_.___/|___/_/_/ /_/ /_/

local HOME = os.getenv('HOME')


require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    -- Needs a nerdfont installed
    use {
        'goolord/alpha-nvim',
        requires = { 'kyazdani42/nvim-web-devicons' },
        config = function ()
            require'alpha'.setup(require'alpha.themes.dashboard'.opts)
        end
    }
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
    use 'b3nj5m1n/kommentary'
    use "windwp/nvim-autopairs"
    use 'neovim/nvim-lspconfig'
    use 'tpope/vim-fugitive'
    use {
        'nvim-telescope/telescope.nvim',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    -- themes
    use 'morhetz/gruvbox'
end)

-- tools, thanks to https://www.notonlycode.org/neovim-lua-config/
local function map(mode, shortcut, command)
    vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true})
end

local function nmap(shortcut, command)
    map('n', shortcut, command)
end

local function imap(shortcut, command)
    map('i', shortcut, command)
end

-- debug tables
function TP(table)
    for k,v in pairs(table) do
        print(k,v)
    end
end

-- general settings
vim.g.mapleader = ' '

local o = vim.opt
o.relativenumber = true
o.showmatch = false
o.relativenumber = true
o.hlsearch = false
o.hidden = true
o.errorbells = false
o.tabstop = 4
o.softtabstop = 4
o.shiftwidth = 4
o.expandtab = true
o.smartindent = true
o.nu = true
o.wrap = false
o.smartcase = true
o.swapfile = false
o.backup = false
o.undodir = HOME..'/.config/nvim/undodir'
o.undofile = true
o.incsearch = true
o.termguicolors = true
o.scrolloff = 8

vim.o.background = 'dark'
vim.cmd('colorscheme gruvbox')

-- file remaps
nmap('<leader>fs', ':w<CR>')
nmap('<leader>fq', ':q<CR>')

-- telescope remaps
nmap('<leader>p', ':Telescope find_files<CR>')
nmap('<leader><c-i>', ':Telescope buffers<CR>')

-- git remaps
nmap('<leader>g', ':Git<CR>')
-- todo remap diffsplit, pulling, checkout branch, creating branch

-- simple remaps
imap('jk', '<esc>')
imap('jj', '<esc>')
imap('<c-d>', '<esc>ddi')
vim.api.nvim_set_keymap('n', '<C-l>', 'gcc', {})
vim.api.nvim_set_keymap('x', '<C-l>', 'gc', {})

-- rerun the init lua
nmap('<leader><CR>', ':so ~/.config/nvim/init.lua<CR>')

-- move betwen windows
nmap('<leader>h', ':wincmd h<CR>')
nmap('<leader>j', ':wincmd j<CR>')
nmap('<leader>k', ':wincmd k<CR>')
nmap('<leader>l', ':wincmd l<CR>')

-- split windows
nmap('<leader>wh', ':split<CR>')
nmap('<leader>wv', ':vsplit<CR>')


-- map lsp commands
nmap('gD', '<cmd>lua vim.lsp.buf.declaration()<CR>')
nmap('gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
nmap('K', '<cmd>lua vim.lsp.buf.hover()<CR>')
nmap('gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
nmap('<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>')
nmap('<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>')
nmap('<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>')
nmap('<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>')
nmap('<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
nmap('gr', '<cmd>lua vim.lsp.buf.references()<CR>')




-- language server setup
local nvim_lsp = require'lspconfig'

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    -- Enable completion triggered by <c-x><c-o>
    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    -- local opts = { noremap=true, silent=true }

    -- See `:help vim.lsp.*` for documentation on any of the below functions
    -- buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    -- buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    -- buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    -- buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    -- buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    -- buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    -- buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    -- buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    -- buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    -- buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    -- buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    -- buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    -- buf_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
    -- buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
    -- buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
    -- buf_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
    -- buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

end

-- lua lsp setup
local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

nvim_lsp.sumneko_lua.setup {
    flags = { debounce_text_changes = 150 },
    on_attach = on_attach,
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT',
                path = runtime_path,
            },
            telemetry = { enable = false },
            diagnostics = { globals = { 'vim' } },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true),
                checkThirdParty = false
            }
        }
    }
}

-- c/c++/c# lsp setup
-- note for kernal dev you need to generate compile_commands.json
nvim_lsp.ccls.setup{
    flags = { debounce_text_changes = 150 },
    on_attach = on_attach,
    init_options = {
        clang = {
            extraArgs = { '--gcc-toolchain=/usr' }
        }
    }
}

-- treesitter setup
require'nvim-treesitter.configs'.setup {
  -- One of "all", "maintained" (parsers with maintainers), or a list of languages
  ensure_installed = "maintained",

  -- Install languages synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- List of parsers to ignore installing
  ignore_install = { "" },

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- list of language that will be disabled
    disable = {},

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}

-- setup auto pairs
require('nvim-autopairs').setup{}
