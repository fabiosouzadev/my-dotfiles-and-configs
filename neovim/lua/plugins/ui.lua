return {
    -- enable mini.starter
    -- {
    --     'echasnovski/mini.starter',
    --     version = false, -- wait till new 0.7.0 release to put it back on semver
    --     event = 'VimEnter',
    --     opts = function()
    --         local logo = table.concat({
    --             '██╗      █████╗ ███████╗██╗   ██╗██╗   ██╗██╗███╗   ███╗          Z',
    --             '██║     ██╔══██╗╚══███╔╝╚██╗ ██╔╝██║   ██║██║████╗ ████║      Z',
    --             '██║     ███████║  ███╔╝  ╚████╔╝ ██║   ██║██║██╔████╔██║   z',
    --             '██║     ██╔══██║ ███╔╝    ╚██╔╝  ╚██╗ ██╔╝██║██║╚██╔╝██║ z',
    --             '███████╗██║  ██║███████╗   ██║    ╚████╔╝ ██║██║ ╚═╝ ██║',
    --             '╚══════╝╚═╝  ╚═╝╚══════╝   ╚═╝     ╚═══╝  ╚═╝╚═╝     ╚═╝',
    --         }, '\n')
    --         local pad = string.rep(' ', 22)
    --         local new_section = function(name, action, section)
    --             return { name = name, action = action, section = pad .. section }
    --         end
    --
    --         local starter = require 'mini.starter'
    --         --stylua: ignore
    --         local config = {
    --             evaluate_single = true,
    --             header = logo,
    --             items = {
    --                 new_section("Find file", "Telescope find_files", "Telescope"),
    --                 new_section("Recent files", "Telescope oldfiles", "Telescope"),
    --                 new_section("Grep text", "Telescope live_grep", "Telescope"),
    --                 new_section("init.lua", "e $MYVIMRC", "Config"),
    --                 new_section("Lazy", "Lazy", "Config"),
    --                 new_section("New file", "ene | startinsert", "Built-in"),
    --                 new_section("Quit", "qa", "Built-in"),
    --             },
    --             content_hooks = {
    --                 starter.gen_hook.adding_bullet(pad .. "░ ", false),
    --                 starter.gen_hook.aligning("center", "center"),
    --             },
    --         }
    --         return config
    --     end,
    --     config = function(_, config)
    --         -- close Lazy and re-open when starter is ready
    --         if vim.o.filetype == 'lazy' then
    --             vim.cmd.close()
    --             vim.api.nvim_create_autocmd('User', {
    --                 pattern = 'MiniStarterOpened',
    --                 callback = function()
    --                     require('lazy').show()
    --                 end,
    --             })
    --         end
    --
    --         local starter = require 'mini.starter'
    --         starter.setup(config)
    --
    --         vim.api.nvim_create_autocmd('User', {
    --             pattern = 'LazyVimStarted',
    --             callback = function()
    --                 local stats = require('lazy').stats()
    --                 local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
    --                 local pad_footer = string.rep(' ', 8)
    --                 starter.config.footer = pad_footer ..
    --                     '⚡ Neovim loaded ' .. stats.count .. ' plugins in ' .. ms .. 'ms'
    --                 pcall(starter.refresh)
    --             end,
    --         })
    --     end,
    -- },
    -- dashboard
    {
        'goolord/alpha-nvim',
        event = 'VimEnter',
        opts = function()
            local dashboard = require 'alpha.themes.dashboard'
            local logo = [[
      ██╗      █████╗ ███████╗██╗   ██╗██╗   ██╗██╗███╗   ███╗          Z
      ██║     ██╔══██╗╚══███╔╝╚██╗ ██╔╝██║   ██║██║████╗ ████║      Z
      ██║     ███████║  ███╔╝  ╚████╔╝ ██║   ██║██║██╔████╔██║   z
      ██║     ██╔══██║ ███╔╝    ╚██╔╝  ╚██╗ ██╔╝██║██║╚██╔╝██║ z
      ███████╗██║  ██║███████╗   ██║    ╚████╔╝ ██║██║ ╚═╝ ██║
      ╚══════╝╚═╝  ╚═╝╚══════╝   ╚═╝     ╚═══╝  ╚═╝╚═╝     ╚═╝
      ]]

            dashboard.section.header.val = vim.split(logo, '\n')
            dashboard.section.buttons.val = {
                dashboard.button('f', ' ' .. ' Find file', ':Telescope find_files <CR>'),
                dashboard.button('n', ' ' .. ' New file', ':ene <BAR> startinsert <CR>'),
                dashboard.button('r', ' ' .. ' Recent files', ':Telescope oldfiles <CR>'),
                dashboard.button('g', ' ' .. ' Find text', ':Telescope live_grep <CR>'),
                dashboard.button('c', ' ' .. ' Config', ':e $MYVIMRC <CR>'),
                dashboard.button('s', '勒' .. ' Restore Session', [[:lua require("persistence").load() <cr>]]),
                dashboard.button('l', '鈴' .. ' Lazy', ':Lazy<CR>'),
                dashboard.button('q', ' ' .. ' Quit', ':qa<CR>'),
            }
            for _, button in ipairs(dashboard.section.buttons.val) do
                button.opts.hl = 'AlphaButtons'
                button.opts.hl_shortcut = 'AlphaShortcut'
            end
            dashboard.section.footer.opts.hl = 'Type'
            dashboard.section.header.opts.hl = 'AlphaHeader'
            dashboard.section.buttons.opts.hl = 'AlphaButtons'
            dashboard.opts.layout[1].val = 8
            return dashboard
        end,
        config = function(_, dashboard)
            -- close Lazy and re-open when the dashboard is ready
            if vim.o.filetype == 'lazy' then
                vim.cmd.close()
                vim.api.nvim_create_autocmd('User', {
                    pattern = 'AlphaReady',
                    callback = function()
                        require('lazy').show()
                    end,
                })
            end

            require('alpha').setup(dashboard.opts)

            vim.api.nvim_create_autocmd('User', {
                pattern = 'LazyVimStarted',
                callback = function()
                    local stats = require('lazy').stats()
                    local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
                    dashboard.section.footer.val = '⚡ Neovim loaded ' .. stats.count .. ' plugins in ' .. ms .. 'ms'
                    pcall(vim.cmd.AlphaRedraw)
                end,
            })
        end,
    },
    {
        'nvim-lualine/lualine.nvim',
        event = 'VimEnter',
        dependencies = {
            'nvim-web-devicons',
        },
        config = function()
            require('lualine').setup {
                options = {
                    theme = 'moonfly',
                    component_separators = '|',

                    section_separators = '',
                },
                sections = {
                    lualine_a = { 'mode' },
                    lualine_b = { 'branch', 'diff', 'diagnostics' },
                    lualine_c = { 'filename', 'lsp_progress' },
                    lualine_x = { 'encoding', 'fileformat', 'filetype' },
                    lualine_y = { 'progress' },
                    lualine_z = { 'location' },
                },
            }
        end,
    },
    {
        'romgrk/barbar.nvim',
        dependencies = 'nvim-web-devicons',
    },
    {
        'nvim-tree/nvim-tree.lua',
        version = 'nightly',
        config = function()
            local nvimtree = require 'nvim-tree'
            vim.g.loaded_netrw = 1
            vim.g.loaded_netrwPlugin = 1
            vim.opt.termguicolors = true

            nvimtree.setup {
                diagnostics = {
                    enable = true,
                },
                filters = {
                    dotfiles = true,
                    custom = { '.git$', '.gitignore', 'node_modules', '.cache' },
                },
            }
        end,
    },
    {
        'akinsho/toggleterm.nvim',
        branch = 'main',
        event = 'VeryLazy',
        cmd = 'ToggleTerm',
        config = true,
    },
    {
        'sindrets/diffview.nvim',
        requires = 'plenary.nvim',
    },
    -- {
    --     'stevearc/dressing.nvim',
    --     lazy = true,
    --     config = true,
    -- },
    {
        'nvim-tree/nvim-web-devicons',
        lazy = true,
    },
}
