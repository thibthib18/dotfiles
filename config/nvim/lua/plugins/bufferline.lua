return {
  "akinsho/bufferline.nvim",
  keys = {
    { "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", desc = "Toggle pin" },
    { "<leader>bP", "<Cmd>BufferLineGroupClose ungrouped<CR>", desc = "Delete non-pinned buffers" },
    { "<leader>br", "<Cmd>BufferLineCloseRight<CR>", desc = "Delete buffers to the right" },
  },
  opts = {
    options = {
      groups = {
        items = {
          require("bufferline.groups").builtin.pinned:with({ icon = "" }),
          {
            name = "RC",
            highlight = { undercurl = true, sp = "#53A87F" },
            auto_close = false, -- whether or not close this group if it doesn't contain the current buffer
            matcher = function(buf) return buf.path:match("3d%-visualization") end,
          },
          {
            name = "UI",
            highlight = { undercurl = true, sp = "#26A9E0" },
            auto_close = false, -- whether or not close this group if it doesn't contain the current buffer
            matcher = function(buf) return buf.path:match("frontend/interface/npm") and not buf.path:match("3d%-visualization") end,
            -- separator = { -- Optional
            --   style = require("bufferline.groups").separator.tab,
            -- },
          },
          {
            name = "Dotfiles",
            highlight = { underline = true, sp = "#FAAF40" },
            auto_close = false,
            priority = 2,
            icon = "",
            matcher = function(buf) return buf.path:match("dotfiles") and not buf.path:match("db_ui") end,
          },
          require("bufferline.groups").builtin.ungrouped,
        },
      },

      -- custom_filter = function(buf, buf_nums)
      --   -- dont show help buffers in the bufferline
      --   -- return not vim.bo[buf].filetype == "help"
      --
      --   -- you can use more custom logic for example
      --   -- don't show files matching a pattern
      --   -- return not vim.fn.bufname(buf):match('test')
      --
      --   -- show only certain filetypes in certain tabs e.g. js in one, css in another etc.
      --   local tab_num = vim.fntabpagenr()
      --   if tab_num == 2 and vim.bo[buf].filetype == "dbout" then
      --     return true
      --   elseif tab_num == 2 and vim.bo[buf].filetype == "css" then
      --     return true
      --     -- else
      --     --     return false
      --   end
      --
      --   -- My personal example:
      --   -- Don't show output log buffers in the same tab as my other code.
      --   -- 1. Check if there are any log buffers in the full list of buffers
      --   -- if not don't do any filtering
      --   local logs = vim.tbl_filter(function(b) return vim.bo[b].filetype == "log" end, buf_nums)
      --   if vim.tbl_isempty(logs) then return true end
      --   -- 2. if there are log buffers then only show the log buffer
      --   local tab_num = vim.fn.tabpagenr()
      --   local is_log = vim.bo[buf].filetype == "log"
      --   -- only show log buffers in secondary tabs
      --   return (tab_num == 2 and is_log) or (tab_num ~= 2 and not is_log)
      -- end,
    },
  },
}
