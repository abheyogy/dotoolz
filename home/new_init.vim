" ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
" My nvimrc
" ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

" ============================================================================
"		               General Configuration
" ============================================================================

filetype off
filetype plugin indent on

" ============================================================================
"                             Vim Plug Plugin Manager
" ============================================================================
"
" Install Vim Plug: If not installed!
if empty(glob('$HOME/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo $HOME/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Install/Update various vim/nvim plugins.
call plug#begin()

  " Vim Enhancements
    Plug 'nvim-lualine/lualine.nvim'  " Modern statusline
    Plug 'nvim-tree/nvim-tree.lua'
    Plug 'nvim-tree/nvim-web-devicons'
    Plug 'lewis6991/gitsigns.nvim'
    Plug 'tpope/vim-fugitive'
    Plug 'craftzdog/solarized-osaka.nvim', { 'branch': 'osaka' }  " Modern Solarized theme

  " Modern Language Support
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
    Plug 'ray-x/go.nvim'               " Enhanced Go support
    Plug 'ray-x/guihua.lua'            " Required for go.nvim
    Plug 'rust-lang/rust.vim'          " Rust support (kept existing)
    Plug 'simrat39/rust-tools.nvim'    " Enhanced Rust tooling
    Plug 'pangloss/vim-javascript'     " JavaScript support
    Plug 'leafgarland/typescript-vim'  " TypeScript syntax
    Plug 'MaxMEllon/vim-jsx-pretty'    " JSX/TSX support
    Plug 'elzr/vim-json'               " Better JSON support
    Plug 'cespare/vim-toml'            " TOML support
    Plug 'tikhomirov/vim-glsl'         " GLSL shader support

  " Modern LSP & Completion
    Plug 'neovim/nvim-lspconfig'
    Plug 'williamboman/mason.nvim'
    Plug 'williamboman/mason-lspconfig.nvim'
    Plug 'hrsh7th/nvim-cmp'
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-path'
    Plug 'hrsh7th/cmp-cmdline'
    Plug 'L3MON4D3/LuaSnip'
    Plug 'saadparwaiz1/cmp_luasnip'
    Plug 'rafamadriz/friendly-snippets'  " Popular snippets
    Plug 'onsails/lspkind.nvim'          " VSCode-like icons in completion
    Plug 'christoomey/vim-tmux-navigator'  " Keep - useful for tmux
    Plug 'plasticboy/vim-markdown'     " Keep - good markdown support
    Plug 'alvan/closetag.vim'          " Keep - auto-close HTML tags
    Plug 'windwp/nvim-autopairs'       " Modern auto-pairs
    Plug 'numToStr/Comment.nvim'       " Modern commenting
    Plug 'kylechui/nvim-surround'      " Modern surround (better than tpope's)
    " Plug 'lukas-reineke/indent-blankline.nvim'  " Temporarily disabled due to version conflict

  " Treesitter for Better Syntax Highlighting
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'nvim-treesitter/nvim-treesitter-textobjects'

  " DevOps & SaltStack Enhanced Support
    Plug 'towolf/vim-helm'              " Kubernetes Helm
    Plug 'pearofducks/ansible-vim'      " Ansible
    Plug 'hashivim/vim-terraform'       " Terraform
    Plug 'ekalinin/dockerfile.vim'      " Dockerfile
    Plug 'chr4/nginx.vim'               " Nginx
    Plug 'saltstack/salt-vim'
    Plug 'stephpy/vim-yaml'
    Plug 'vim-scripts/jinja'

  " Modern Fuzzy Finder (telescope only)
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

call plug#end()

" ============================================================================
"                     NeoVim Configuration & Customizations
" ============================================================================
"
" ----------------------------------------------------------------------------
"  General Configurations

syntax enable
set nocompatible
set background=dark

" Load color theme if it exists.
  try
    colorscheme solarized-osaka
  catch
    colorscheme default
  endtry

filetype on
filetype plugin indent on

" Autoreload .vimrc/init.vim
  autocmd! bufwritepost init.vim source %

" Misc
  set timeoutlen=50
  set laststatus=2
  set showtabline=2
  set showmatch
  set backspace=indent,eol,start
  set noshowmode
  set showcmd
  set wildmenu
  set lazyredraw
  set spell
  set cursorline
  set foldlevelstart=10
  set foldlevel=5

" Undo stuff
  set history=7777
  set undolevels=555

" Formatting
  set nowrap            " Do not wrap long lines
  set autoindent        " Indent at the same level as previous line
  set expandtab         " Tabs are spaces not tabs
  set tabstop=4         " Indent every four columns
  set softtabstop=4     " Backspace deletes tabs
  set shiftwidth=4      " Shift by 4 spaces '>>/<<' (consistent with tabstop)
  set splitright	    " Vsplit defaults to right
  set splitbelow	    " Split defaults to bottom
  "set pastetoggle=<F5>	" Toggle paste mode

" Searching
  set incsearch
  set hlsearch
  set ignorecase
  set smartcase
  set gdefault

" Buffers & Splits ...
" Fugitive, Gdiff, & more ... defaults to split vertically
set diffopt+=vertical

" Disable arrow keys
  nnoremap <up> <nop>
  nnoremap <down> <nop>
  nnoremap <left> <nop>
  nnoremap <right> <nop>
  nnoremap j gj
  nnoremap k gk

" Enable mouse
  set mouse=a           " Automatically enable mouse settings
  set mousehide         " Hide mouse cursor while typing

" Modern Neovim Settings
  set termguicolors       " Enable 24-bit colors
  set updatetime=300      " Faster updates
  set signcolumn=yes      " Always show sign column
  set completeopt=menu,menuone,noselect
  set inccommand=split    " Show search/replace in split

" Ctags

  set tags=./tags;/,~/.vimtags

  " Make tags placed in .git/tags file available in all levels of a repository
  let gitroot = substitute(system('git rev-parse --show-toplevel'), '[\n\r]', '', 'g')
  if gitroot != ''
    let &tags = &tags . ',' . gitroot . '/.git/tags'
  endif

" ============================================================================
" 				Plugin Customizations
" ============================================================================
"
" The Leader Key!
  let mapleader=','
  set timeoutlen=500    " Modern timeout - responsive but not too fast

" ----------------------------------------------------------------------------
" Customize Key bindings

  " Gitsigns toggle (modern git integration)
    nnoremap <leader>gg :Gitsigns toggle_signs<CR>
    nnoremap <leader>GG :Gitsigns toggle_current_line_blame<CR>

  " Modern window/buffer management
    nnoremap <leader>q :quit<CR>     " Quit current window
    nnoremap <leader>Q :qa<CR>       " Quit all windows
    nnoremap <leader>w :w<CR>        " Quick save
    nnoremap <leader>W :wq<CR>       " Save and quit
    nnoremap <leader>x :bdelete<CR>  " Close current buffer
    nnoremap <C-h> <C-w>h           " Navigate windows
    nnoremap <C-j> <C-w>j
    nnoremap <C-k> <C-w>k
    nnoremap <C-l> <C-w>l

  " Modern folding controls (simplified)
    nmap <leader>fo :set foldlevel=0<CR>   " Fold all
    nmap <leader>fc :set foldlevel=99<CR>  " Unfold all
    nmap <leader>ft :set foldlevel=1<CR>   " Top level only

  " Space to open/close folds
    nnoremap <space> za

  " Find merge conflict markers
    map <leader>fm /\v^[<\|=>]{7}( .*\|$)<CR>

  " Shifting does not exit Visual Mode
    vnoremap < <gv
    vnoremap > >gv

  " Write in SUDO mode
    cmap w!! w !sudo tee % >/dev/null

  " Line numbers (simplified)
    set number
    nnoremap <Leader>n :set relativenumber!<CR>  " Toggle relative numbers

  " CtrlP command to invoke
    let g:ctrlp_map = '<c-p>'

  " Modern Telescope shortcuts (space-based like VSCode)
    nnoremap <leader><space> <cmd>Telescope find_files<cr>
    nnoremap <leader>/ <cmd>Telescope live_grep<cr>
    nnoremap <leader>, <cmd>Telescope buffers<cr>
    nnoremap <leader>fh <cmd>Telescope help_tags<cr>
    nnoremap <leader>fr <cmd>Telescope oldfiles<cr>
    nnoremap <leader>fc <cmd>Telescope commands<cr>
    nnoremap <leader>fs <cmd>Telescope lsp_document_symbols<cr>
    nnoremap <leader>fS <cmd>Telescope lsp_workspace_symbols<cr>

  " Modern file explorer (simplified)
    nnoremap <leader>e :NvimTreeToggle<CR>
    nnoremap <leader>E :NvimTreeFindFile<CR>

  " Modern LSP shortcuts (more intuitive)
    nnoremap gd <cmd>lua vim.lsp.buf.definition()<CR>
    nnoremap gr <cmd>lua vim.lsp.buf.references()<CR>
    nnoremap K <cmd>lua vim.lsp.buf.hover()<CR>
    nnoremap <leader>ca <cmd>lua vim.lsp.buf.code_action()<CR>
    nnoremap <leader>rn <cmd>lua vim.lsp.buf.rename()<CR>
    nnoremap <leader>f <cmd>lua vim.lsp.buf.format()<CR>
    nnoremap <leader>d <cmd>lua vim.diagnostic.open_float()<CR>
    nnoremap [d <cmd>lua vim.diagnostic.goto_prev()<CR>
    nnoremap ]d <cmd>lua vim.diagnostic.goto_next()<CR>

  " Fugitive ::::: Git O Vim
    nnoremap <silent> <leader>gs :Gstatus<CR>
    nnoremap <silent> <leader>gd :Gdiff<CR>
    nnoremap <silent> <leader>gc :Gcommit<CR>
    nnoremap <silent> <leader>gb :Gblame<CR>
    nnoremap <silent> <leader>gl :Glog<CR>
    nnoremap <silent> <leader>gp :Git push<CR>
    nnoremap <silent> <leader>gr :Gread<CR>
    nnoremap <silent> <leader>gw :Gwrite<CR>
    nnoremap <silent> <leader>ge :Gedit<CR>
    nnoremap <silent> <leader>gi :Git add -p%<CR>

  " Modern additional shortcuts
    nnoremap <leader>; :                     " Quick command mode
    nnoremap <leader>o :only<CR>            " Close all other windows
    nnoremap <leader>h :nohlsearch<CR>      " Clear search highlights
    nnoremap <leader>= <C-w>=               " Equalize windows
    nnoremap <leader>+ <C-w>+               " Increase window height
    nnoremap <leader>- <C-w>-               " Decrease window height
    nnoremap <leader>< <C-w><               " Decrease window width
    nnoremap <leader>> <C-w>>               " Increase window width
    
    " Quick buffer navigation
    nnoremap <leader>bp :bprevious<CR>      " Previous buffer
    nnoremap <leader>bn :bnext<CR>          " Next buffer
    nnoremap <leader>bf :bfirst<CR>         " First buffer
    nnoremap <leader>bl :blast<CR>          " Last buffer
    
    " Modern commenting (Comment.nvim)
    nnoremap <leader>cc :lua require('Comment.api').toggle_current_linewise()<CR>
    vnoremap <leader>cc :lua require('Comment.api').toggle_linewise_op(vim.fn.visualmode())<CR>
    
    " Quick save all
    nnoremap <leader>wa :wa<CR>             " Save all buffers
    
    " Terminal shortcuts
    nnoremap <leader>tt :terminal<CR>       " Open terminal
    tnoremap <Esc> <C-\><C-n>              " Exit terminal mode

" ----------------------------------------------------------------------------
" Customize plugin behaviour

" SaltStack
  let g:sls_use_jinja_syntax = 1

" Lualine (modern statusline configured in Lua section)
  set laststatus=3      " Global statusline
  set noshowmode        " Hide mode in command line (shown in statusline)

" =============================================================================
"                           Lua Configuration for Modern Plugins
" =============================================================================

lua << EOF
-- Setup Mason for LSP management
require("mason").setup({
    ui = {
        border = "rounded",
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

require("mason-lspconfig").setup({
    ensure_installed = {
        "pyright", "gopls", "lua_ls", "bashls", "yamlls", "jsonls",
        "rust_analyzer", "ts_ls", "eslint", "html", "cssls"
    },
    automatic_installation = true,
})

-- Setup LSP servers with enhanced capabilities
local lspconfig = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Add folding capabilities
capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true
}

-- Configure LSP servers
local servers = {
    'pyright', 'gopls', 'lua_ls', 'bashls', 'yamlls', 'jsonls',
    'rust_analyzer', 'ts_ls', 'eslint', 'html', 'cssls'
}

for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup({
        capabilities = capabilities,
        on_attach = function(client, bufnr)
            -- Enable completion triggered by <c-x><c-o>
            vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

            -- Format on save for specific file types
            if client.supports_method("textDocument/formatting") then
                vim.api.nvim_create_autocmd("BufWritePre", {
                    buffer = bufnr,
                    callback = function()
                        vim.lsp.buf.format({ bufnr = bufnr })
                    end,
                })
            end
        end,
    })
end

-- Setup nvim-cmp for enhanced completion
local cmp = require('cmp')
local luasnip = require('luasnip')

-- Safely load lspkind (for VSCode-like icons)
local lspkind_ok, lspkind = pcall(require, 'lspkind')
if not lspkind_ok then
    lspkind = nil
end

-- Load friendly snippets (if available)
pcall(function()
    require("luasnip.loaders.from_vscode").lazy_load()
end)

cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    formatting = lspkind and {
        format = lspkind.cmp_format({
            mode = 'symbol_text',
            maxwidth = 50,
            ellipsis_char = '...',
            before = function (entry, vim_item)
                return vim_item
            end
        })
    } or {
        format = function(entry, vim_item)
            -- Simple formatting fallback when lspkind is not available
            vim_item.menu = ({
                nvim_lsp = "[LSP]",
                luasnip = "[Snippet]",
                buffer = "[Buffer]",
                path = "[Path]",
            })[entry.source.name]
            return vim_item
        end
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ 
            behavior = cmp.ConfirmBehavior.Replace,
            select = false 
        }),
        ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_locally_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end, { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.locally_jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { 'i', 's' }),
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp', priority = 1000 },
        { name = 'luasnip', priority = 750 },
        { name = 'buffer', priority = 500 },
        { name = 'path', priority = 250 },
    }),
    experimental = {
        ghost_text = true,
    },
})

-- Setup Telescope
require('telescope').setup({
    defaults = {
        file_ignore_patterns = { "node_modules", ".git", "dist", "build" },
    },
    extensions = {
        fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
        }
    }
})

-- Load telescope extensions
pcall(require('telescope').load_extension, 'fzf')

-- Setup nvim-tree
require('nvim-tree').setup({
    disable_netrw = true,
    hijack_netrw = true,
    view = {
        width = 30,
        side = 'left',
    },
    renderer = {
        icons = {
            glyphs = {
                default = '',
                symlink = '',
                folder = {
                    default = '',
                    open = '',
                    empty = '',
                    empty_open = '',
                    symlink = '',
                },
            },
        },
    },
})

-- Setup Treesitter
require('nvim-treesitter.configs').setup({
    ensure_installed = { "python", "go", "lua", "bash", "yaml", "json", "markdown", "dockerfile" },
    sync_install = false,
    auto_install = true,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    indent = {
        enable = true,
    },
    textobjects = {
        select = {
            enable = true,
            lookahead = true,
            keymaps = {
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["ac"] = "@class.outer",
                ["ic"] = "@class.inner",
            },
        },
    },
})

-- Setup Gitsigns
require('gitsigns').setup({
    signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
    },
    current_line_blame = true,
    current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = 'eol',
        delay = 1000,
    },
})

-- Setup enhanced Go support
require('go').setup({
    go = "go",
    goimports = "gopls",
    gofmt = "gofumpt",  -- Modern Go formatter (cleaner than gofmt)
    tag_transform = false,
    test_dir = "",
    comment_placeholder = "   ",
    lsp_cfg = true,
    lsp_gofumpt = true,
    lsp_on_attach = true,
    dap_debug = true,
})

-- Setup Rust Tools
require('rust-tools').setup({
    tools = {
        autoSetHints = true,
        inlay_hints = {
            show_parameter_hints = false,
            parameter_hints_prefix = "",
            other_hints_prefix = "",
        },
    },
    server = {
        capabilities = capabilities,
    },
})

-- TypeScript support now handled by ts_ls LSP server directly
-- No additional setup needed - ts_ls provides full TypeScript functionality

-- Setup modern autopairs
require('nvim-autopairs').setup({
    check_ts = true,
    ts_config = {
        lua = {'string', 'source'},
        javascript = {'string', 'template_string'},
        java = false,
    },
    disable_filetype = { "TelescopePrompt", "spectre_panel" },
    fast_wrap = {
        map = '<M-e>',
        chars = { '{', '[', '(', '"', "'" },
        pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], '%s+', ''),
        offset = 0,
        end_key = '$',
        keys = 'qwertyuiopzxcvbnmasdfghjkl',
        check_comma = true,
        highlight = 'PmenuSel',
        highlight_grey = 'LineNr'
    },
})

-- Setup modern commenting
require('Comment').setup({
    pre_hook = function(ctx)
        return require('Comment.jsx').calculate(ctx)
    end,
})

-- Setup modern surround
require('nvim-surround').setup({
    keymaps = {
        insert = "<C-g>s",
        insert_line = "<C-g>S",
        normal = "ys",
        normal_cur = "yss",
        normal_line = "yS",
        normal_cur_line = "ySS",
        visual = "S",
        visual_line = "gS",
        delete = "ds",
        change = "cs",
    },
})

-- Setup enhanced indent lines (v3 API) with safe loading
local ibl_ok, ibl = pcall(require, "ibl")
if ibl_ok then
    -- Only configure if plugin is available

    local highlight = {
        "RainbowRed",
        "RainbowYellow", 
        "RainbowBlue",
        "RainbowOrange",
        "RainbowGreen",
        "RainbowViolet",
        "RainbowCyan",
    }

    local hooks_ok, hooks = pcall(require, "ibl.hooks")
    if hooks_ok then
        -- Create the highlight groups in the highlight setup hook
        hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
            vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
            vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
            vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
            vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
            vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
            vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
            vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
        end)
    end

    -- Safe setup with fallback for older versions
    local setup_ok = pcall(function()
        ibl.setup({
            indent = {
                char = "┊",
                highlight = highlight,
            },
            scope = {
                enabled = true,
                show_start = true,
                show_end = false,
                injected_languages = false,
                highlight = { "Function", "Label" },
                priority = 500,
            },
            exclude = {
                filetypes = {
                    "help",
                    "alpha",
                    "dashboard",
                    "neo-tree",
                    "Trouble",
                    "trouble",
                    "lazy",
                    "mason",
                    "notify",
                    "toggleterm",
                    "lazyterm",
                },
            },
        })
    end)

    if not setup_ok then
        -- Fallback: disable the plugin if setup fails
        vim.notify("indent-blankline setup failed - using fallback configuration", vim.log.levels.WARN)
    end
end -- End of ibl_ok check

-- ============================= STUNNING STATUSLINE SETUP =============================
-- An absolutely beautiful, feature-rich statusline with modern aesthetics

-- Enhanced LSP clients display with status indicators
local function get_lsp_clients()
    local clients = vim.lsp.get_active_clients({ bufnr = 0 })
    if #clients == 0 then
        return "󰒲 No LSP"
    end
    
    local client_names = {}
    for _, client in ipairs(clients) do
        -- Add status indicators for different servers
        local icon = "󰒋"
        if client.name == "pyright" then icon = "󰌠"
        elseif client.name == "gopls" then icon = "󰟓"
        elseif client.name == "ts_ls" then icon = "󰛦"
        elseif client.name == "rust_analyzer" then icon = "󱘗"
        elseif client.name == "lua_ls" then icon = "󰢱"
        end
        table.insert(client_names, icon .. " " .. client.name)
    end
    return table.concat(client_names, " ")
end

-- Enhanced git status with beautiful icons and colors
local function git_status()
    local git_info = vim.b.gitsigns_status_dict
    if not git_info or git_info.head == "" then
        return ""
    end
    
    local branch_icon = "󰊢"
    local added = git_info.added and git_info.added > 0 and ("󰐕" .. git_info.added) or ""
    local modified = git_info.changed and git_info.changed > 0 and ("󰏬" .. git_info.changed) or ""
    local removed = git_info.removed and git_info.removed > 0 and ("󰍶" .. git_info.removed) or ""
    
    local changes = {}
    if added ~= "" then table.insert(changes, added) end
    if modified ~= "" then table.insert(changes, modified) end
    if removed ~= "" then table.insert(changes, removed) end
    
    local change_str = #changes > 0 and " [" .. table.concat(changes, " ") .. "]" or ""
    return branch_icon .. " " .. git_info.head .. change_str
end

-- Enhanced mode display with your custom color scheme (icon-only, gecko-free!)
local mode_map = {
    n = {icon = "", name = "N", color = "#A6E22E"},           -- Bright Lemon Green (Vim diamond)
    i = {icon = "󰏫", name = "I", color = "#FD971F"},           -- Bright Orange (edit icon)
    v = {icon = "󰈈", name = "V", color = "#AE81FF"},           -- Purple (select icon)
    V = {icon = "󰘫", name = "VL", color = "#AE81FF"},          -- Purple (line select)
    ["\22"] = {icon = "󰘬", name = "VB", color = "#AE81FF"},    -- Purple (block select)
    c = {icon = "", name = "C", color = "#FD971F"},           -- Bright Orange (command)
    s = {icon = "󰈈", name = "S", color = "#AE81FF"},           -- Purple (select)
    S = {icon = "󰘫", name = "SL", color = "#AE81FF"},          -- Purple (line select)
    ["\19"] = {icon = "󰘬", name = "SB", color = "#AE81FF"},    -- Purple (block select)
    t = {icon = "", name = "T", color = "#A6E22E"},           -- Bright Lemon Green (terminal)
    r = {icon = "󰛔", name = "R", color = "#FD971F"},           -- Bright Orange (replace)
    R = {icon = "󰛔", name = "R", color = "#FD971F"},           -- Bright Orange (replace)
    ["!"] = {icon = "", name = "!", color = "#A6E22E"},       -- Bright Lemon Green (shell)
}

-- Enhanced file info with file type detection
local function file_info()
    local filename = vim.fn.expand('%:t')
    if filename == '' then filename = '[No Name]' end
    
    local modified = vim.bo.modified and ' 󰏫' or ''
    local readonly = vim.bo.readonly and ' 󰌾' or ''
    local filesize = vim.fn.getfsize(vim.fn.expand('%'))
    
    local size_str = ""
    if filesize > 0 then
        if filesize < 1024 then
            size_str = " " .. filesize .. "B"
        elseif filesize < 1024 * 1024 then
            size_str = " " .. math.floor(filesize / 1024) .. "K"
        else
            size_str = " " .. math.floor(filesize / (1024 * 1024)) .. "M"
        end
    end
    
    return filename .. modified .. readonly .. size_str
end

-- Enhanced diagnostics with beautiful styling
local function diagnostics_component()
    local diagnostics = vim.diagnostic.get(0)
    local count = { errors = 0, warnings = 0, info = 0, hints = 0 }
    
    for _, diagnostic in ipairs(diagnostics) do
        if diagnostic.severity == vim.diagnostic.severity.ERROR then
            count.errors = count.errors + 1
        elseif diagnostic.severity == vim.diagnostic.severity.WARN then
            count.warnings = count.warnings + 1
        elseif diagnostic.severity == vim.diagnostic.severity.INFO then
            count.info = count.info + 1
        elseif diagnostic.severity == vim.diagnostic.severity.HINT then
            count.hints = count.hints + 1
        end
    end
    
    local result = {}
    if count.errors > 0 then table.insert(result, "󰅚 " .. count.errors) end
    if count.warnings > 0 then table.insert(result, "󰀪 " .. count.warnings) end
    if count.info > 0 then table.insert(result, "󰋽 " .. count.info) end
    if count.hints > 0 then table.insert(result, "󰌶 " .. count.hints) end
    
    return table.concat(result, " ")
end

-- Custom function to show current time (because why not!)
local function current_time()
    return "󰥔 " .. os.date("%H:%M")
end

-- Custom function for search count
local function search_count()
    if vim.v.hlsearch == 0 then return "" end
    local ok, result = pcall(vim.fn.searchcount, {maxcount = 999, timeout = 100})
    if not ok or result.current == nil then return "" end
    return "󰍉 " .. result.current .. "/" .. result.total
end

-- Custom function for macro recording
local function macro_recording()
    local reg = vim.fn.reg_recording()
    if reg == "" then return "" end
    return "󰑊 @" .. reg
end

-- Define your custom color palette
local colors = {
    bright_lemon_green = "#A6E22E",
    bright_orange = "#FD971F", 
    purple = "#AE81FF",
    dark_solarized_blue = "#002b36",
    darker_blue = "#073642",
    text_light = "#fdf6e3",
    text_dark = "#002b36",
    gray = "#586e75",
    light_gray = "#839496",
}

-- Create custom theme
local custom_theme = {
    normal = {
        a = { fg = colors.text_dark, bg = colors.bright_lemon_green, gui = 'bold' },
        b = { fg = colors.text_light, bg = colors.darker_blue },
        c = { fg = colors.light_gray, bg = colors.dark_solarized_blue },
    },
    insert = {
        a = { fg = colors.text_dark, bg = colors.bright_orange, gui = 'bold' },
        b = { fg = colors.text_light, bg = colors.darker_blue },
        c = { fg = colors.light_gray, bg = colors.dark_solarized_blue },
    },
    visual = {
        a = { fg = colors.text_light, bg = colors.purple, gui = 'bold' },
        b = { fg = colors.text_light, bg = colors.darker_blue },
        c = { fg = colors.light_gray, bg = colors.dark_solarized_blue },
    },
    replace = {
        a = { fg = colors.text_dark, bg = colors.bright_orange, gui = 'bold' },
        b = { fg = colors.text_light, bg = colors.darker_blue },
        c = { fg = colors.light_gray, bg = colors.dark_solarized_blue },
    },
    command = {
        a = { fg = colors.text_dark, bg = colors.bright_orange, gui = 'bold' },
        b = { fg = colors.text_light, bg = colors.darker_blue },
        c = { fg = colors.light_gray, bg = colors.dark_solarized_blue },
    },
    inactive = {
        a = { fg = colors.gray, bg = colors.dark_solarized_blue },
        b = { fg = colors.gray, bg = colors.dark_solarized_blue },
        c = { fg = colors.gray, bg = colors.dark_solarized_blue },
    },
}

-- Setup stunning Lualine configuration with rounded corners
require('lualine').setup({
    options = {
        theme = custom_theme,
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        globalstatus = true,
        refresh = {
            statusline = 500,  -- Faster refresh for dynamic content
            tabline = 1000,
            winbar = 1000,
        },
        disabled_filetypes = {
            statusline = { 'alpha', 'dashboard', 'NvimTree', 'Outline', 'toggleterm', 'trouble' },
            winbar = {},
        },
    },
    sections = {
        lualine_a = {
            {
                function()
                    local mode = vim.fn.mode()
                    local mode_info = mode_map[mode] or {icon = "◆", name = mode:upper(), color = colors.bright_orange}
                    return mode_info.icon
                end,
                separator = { right = '' },
                padding = { left = 1, right = 1 },
                -- Color is handled by theme
            },
            {
                macro_recording,
                color = { fg = colors.purple, bg = colors.darker_blue, gui = "bold" },
                separator = { right = '' },
                padding = { left = 1, right = 1 },
            },
        },
        lualine_b = {
            {
                git_status,
                color = { fg = colors.bright_orange, gui = "bold" },
                separator = { right = '' },
                padding = { left = 1, right = 1 },
            },
            {
                search_count,
                color = { fg = colors.bright_lemon_green },
                separator = { right = '' },
                padding = { left = 1, right = 0 },
            },
        },
        lualine_c = {
            {
                file_info,
                color = { fg = colors.text_light, gui = "bold" },
                separator = '',
                padding = { left = 1, right = 0 },
            },
            {
                'filetype',
                colored = true,
                icon_only = true,
                separator = '',
                padding = { left = 1, right = 0 },
            },
            {
                function()
                    local buf_clients = vim.lsp.get_active_clients({ bufnr = 0 })
                    if #buf_clients == 0 then return "" end
                    return "󰒋 " .. #buf_clients .. " LSP"
                end,
                color = { fg = colors.bright_orange },
                separator = '',
                padding = { left = 1, right = 0 },
            },
        },
        lualine_x = {
            {
                diagnostics_component,
                color = { fg = colors.bright_orange },
                separator = '',
                padding = { left = 1, right = 1 },
            },
            {
                get_lsp_clients,
                color = { fg = colors.bright_orange },
                separator = '',
                padding = { left = 1, right = 1 },
                cond = function()
                    return vim.o.columns > 120  -- Only show detailed LSP info on wide screens
                end,
            },
            {
                function()
                    local clients = vim.lsp.get_active_clients({ bufnr = 0 })
                    if #clients == 0 then return "" end
                    -- Show a simple LSP indicator with count
                    return "󰒋 " .. #clients
                end,
                color = { fg = colors.bright_orange },
                separator = '',
                padding = { left = 1, right = 1 },
                cond = function()
                    return vim.o.columns <= 120  -- Show simplified version on narrow screens
                end,
            },
            {
                'encoding',
                fmt = function(str)
                    return str:upper()
                end,
                color = { fg = colors.light_gray },
                cond = function()
                    return vim.o.columns > 140
                end,
            },
        },
        lualine_y = {
            {
                current_time,
                color = { fg = colors.purple, gui = "bold" },
                separator = { left = '' },
                padding = { left = 1, right = 1 },
                cond = function()
                    return vim.o.columns > 100
                end,
            },
            {
                'progress',
                color = { fg = colors.bright_lemon_green },
                separator = { left = '' },
                padding = { left = 1, right = 1 },
            },
        },
        lualine_z = {
            {
                function()
                    local mode = vim.fn.mode()
                    local mode_info = mode_map[mode] or {color = colors.bright_lemon_green}
                    local line = vim.fn.line('.')
                    local col = vim.fn.col('.')
                    local total_lines = vim.fn.line('$')
                    return "󰍉 " .. line .. ":" .. col .. "/" .. total_lines
                end,
                color = function()
                    local mode = vim.fn.mode()
                    local mode_info = mode_map[mode] or {color = colors.bright_lemon_green}
                    return { fg = colors.text_dark, bg = mode_info.color, gui = "bold" }
                end,
                separator = { left = '' },
                padding = { left = 1, right = 1 },
            },
        },
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 
            {
                'filename',
                color = { fg = colors.gray },
            }
        },
        lualine_x = { 
            {
                'location',
                color = { fg = colors.gray },
            }
        },
        lualine_y = {},
        lualine_z = {},
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = { 'nvim-tree', 'telescope', 'fugitive', 'toggleterm', 'trouble' },
})

EOF

" =============================================================================
"                      ::::::: End of my VIMRC/NVIMRC :::::::
"
"                        Am I alive or dead I dont know,
"                              neither do I care,
"                          as long as I have vim ...
"                          and its running on linux!
"
"                               ~ Pundalika
"  ============================================================================
