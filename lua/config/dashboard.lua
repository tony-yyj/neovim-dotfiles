local dashboard = require("dashboard")

local time = os.date("%H:%M")
local v = vim.version()
local version = " v" .. v.major .. '.' .. v.minor .. "." .. v.patch

dashboard.setup({
    theme = "doom",
    hide = {
        statusline = true,
        tabline = true,
        winbar = true,
    },
    config = {
        header = {
            "                                                             ",   
            "    ████████╗ ██████╗ ███╗   ██╗██╗   ██╗ ██████╗███████╗    ",
            "    ╚══██╔══╝██╔═══██╗████╗  ██║╚██╗ ██╔╝██╔════╝██╔════╝    ",   
            "       ██║   ██║   ██║██╔██╗ ██║ ╚████╔╝ ██║     ███████╗    ", 
            "       ██║   ██║   ██║██║╚██╗██║  ╚██╔╝  ██║     ╚════██║    ", 
            "       ██║   ╚██████╔╝██║ ╚████║   ██║   ╚██████╗███████║    ", 
            "       ╚═╝    ╚═════╝ ╚═╝  ╚═══╝   ╚═╝    ╚═════╝╚══════╝    ", 
            "                                                             ",
        },
        center = {
            {
                icon = '',
                icon_hl = 'GitSignsAdd',
                desc = 'New File',
                desc_hl = 'Text',
                key = 'e',
                key_hl = 'GitSignsAdd',
                action = 'enew',
            },
            {
                icon = ' ',
                icon_hl = 'GitSignsAdd',
                desc = 'Recent',
                desc_hl = 'Text',
                key = 'r',
                key_hl = 'GitSignsAdd',
                action = 'Telescope oldfiles',
            },
        },
        footer = {
            " " .. time .. " ",
            version,
        },
    }
})

-- Set menu
-- dashboard.section.buttons.val = {
--     dashboard.button( "e", "  > New file" , ":ene <BAR> startinsert <CR>"),
--     dashboard.button( "f", "  > Find file", ":cd $HOME/Workspace | Telescope find_files<CR>"),
--     dashboard.button( "r", "  > Recent"   , ":Telescope oldfiles<CR>"),
--     dashboard.button( "s", "  > Settings" , ":e $MYVIMRC | :cd %:p:h | split . | wincmd k | pwd<CR>"),
--     dashboard.button( "q", "  > Quit NVIM", ":qa<CR>"),
-- }

