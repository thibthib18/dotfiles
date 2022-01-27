require "nvim-treesitter.configs".setup {
    highlight = {
        enable = true
    },
    incremental_selection = {
        enable = true
    },
    playground = {
        enable = true,
        disable = {},
        updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
        persist_queries = false, -- Whether the query persists across vim sessions
        keybindings = {
            toggle_query_editor = "o",
            toggle_hl_groups = "i",
            toggle_injected_languages = "t",
            toggle_anonymous_nodes = "a",
            toggle_language_display = "I",
            focus_language = "f",
            unfocus_language = "F",
            update = "R",
            goto_node = "<cr>",
            show_help = "?"
        }
    },
    textobjects = {
        select = {
            enable = true,
            -- Automatically jump forward to textobj, similar to targets.vim
            lookahead = true,
            keymaps = {
                -- You can use the capture groups defined in textobjects.scm
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["ac"] = "@class.outer",
                ["ic"] = "@class.inner"
            }
        },
        swap = {
            enable = true,
            swap_next = {
                ["<leader>as"] = "@parameter.inner"
            },
            swap_previous = {
                ["<leader>As"] = "@parameter.inner"
            }
        },
        move = {
            enable = true,
            set_jumps = true, -- whether to set jumps in the jumplist
            lookahead = true,
            goto_next_start = {
                ["]]"] = "@function.outer",
                ["]c"] = "@class.outer"
            },
            goto_next_end = {
                ["]["] = "@function.outer",
                ["]C"] = "@class.outer"
            },
            goto_previous_start = {
                ["[["] = "@function.outer",
                ["[c"] = "@class.outer"
            },
            goto_previous_end = {
                ["[C"] = "@class.outer",
                ["[]"] = "@function.outer"
            }
        }
    }
}
