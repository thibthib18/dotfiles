return {
  "tpope/vim-abolish",
  config = function()
    vim.cmd([[
      map <silent> W <Plug>CamelCaseMotion_w
      map <silent> B <Plug>CamelCaseMotion_b
      sunmap W
      sunmap B
      omap <silent> iW <Plug>CamelCaseMotion_iw
      xmap <silent> iW <Plug>CamelCaseMotion_iw
      omap <silent> iB <Plug>CamelCaseMotion_ib
      xmap <silent> iB <Plug>CamelCaseMotion_ib
      omap <silent> ie <Plug>CamelCaseMotion_ie
      xmap <silent> ie <Plug>CamelCaseMotion_ie
    ]])
  end,
}
