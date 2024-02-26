return {
  "thibthib18/mongo-nvim",
  config = function()
    require("mongo-nvim").setup({
      list_document_key = {
        seervision = {
          settings = "setting",
          ptu_configs = "name",
          ptu_devices = "name",
          ptu_drivers = "ptu_driver_type",
          lens_mappings = function(document) return document.camera_name .. "/" .. document.lens_name end,
          ptus = "label",
          analytics = "name",
          containers = function(document) return vim.json.decode(document.value).name end,
        },
      },
      delete_document_mapping = "<c-x>",
    })

    local opts = { noremap = true, silent = true }
    vim.keymap.set("n", "<leader>dbl", function() require("mongo-nvim.telescope.pickers").collection_picker("seervision") end, opts)
  end,
}
