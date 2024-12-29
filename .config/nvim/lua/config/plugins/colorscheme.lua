return {
  {
    "sainnhe/gruvbox-material",
    lazy = false,
    config = function()
      vim.api.nvim_create_autocmd('ColorScheme', {
        group = vim.api.nvim_create_augroup('custom_highlights_gruvboxmaterial', {}),
        pattern = 'gruvbox-material',
        callback = function()
          local config = vim.fn['gruvbox_material#get_configuration']()
          local palette = vim.fn['gruvbox_material#get_palette'](config.background, config.foreground,
            config.colors_override)
          local set_hl = vim.fn['gruvbox_material#highlight']

          set_hl('FloatTitle', palette.orange, palette.bg0)
          set_hl('FloatBorder', palette.none, palette.bg0)
          set_hl('NormalFloat', palette.none, palette.bg0)

          set_hl('MiniTablineCurrent', palette.bg0, palette.green)          -- buffer is current (has cursor in it).
          set_hl('MiniTablineVisible', palette.none, palette.none)          -- buffer is visible (displayed in some window).
          set_hl('MiniTablineHidden', palette.none, palette.none)           -- buffer is hidden (not displayed).
          set_hl('MiniTablineModifiedCurrent', palette.bg0, palette.orange) -- buffer is modified and current.
          set_hl('MiniTablineModifiedVisible', palette.orange, palette.bg0) -- buffer is modified and visible.
          set_hl('MiniTablineModifiedHidden', palette.orange, palette.bg0)  -- buffer is modified and hidden.
          set_hl('MiniTablineFill', palette.none, palette.none)             -- unused right space of tabline.
          set_hl('MiniTablineTabpagesection', palette.none, palette.none)   -- section with tabpage information.
        end
      })
    end
  }
}
