require("glab-nvim").setup(
    {
        username = "thibthib",
        project = {
            owner = "seervision",
            name = "main"
        }
    }
)

local opts = { noremap = true, silent = true }

-- Add MR link virtual text
-- vim.keymap.set('n', '<leader>mru', require('thib.glab').get_current_line_mr, opts)
-- vim.keymap.set('n', '<leader>mrg', require('thib.glab').generate_commit_mr_table, opts)
-- vim.keymap.set('n', '<leader>glb', require('thib.glab').current_line_commit_log, opts)
vim.keymap.set('n', '<Leader>mrl', require('glab-nvim').pick_merge_requests, opts)
vim.keymap.set('n', '<Leader>mrd', require('glab-nvim.merge-request.merge_request_buffer').open_diff, opts)

-- Some utils
-- Gclog : commit list
-- Gclog % : commit list for current file
-- Gclog -10 -- % : commit list last 10 commits for current file

-- git line blame -> glb

