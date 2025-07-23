return {
  {
    "sainnhe/gruvbox-material",
    lazy = false,
    priority = 1000,
    config = function()
      vim.api.nvim_create_autocmd("ColorScheme", {
        group = vim.api.nvim_create_augroup("custom_highlights_gruvboxmaterial", {}),
        pattern = "gruvbox-material",
        callback = function()
          local config = vim.fn["gruvbox_material#get_configuration"]()
          local palette =
            vim.fn["gruvbox_material#get_palette"](config.background, config.foreground, config.colors_override)
          local set_hl = vim.fn["gruvbox_material#highlight"]

          -- comment out to disable transparency
          palette.bg0 = { "NONE", "NONE" }

          set_hl("FloatTitle", palette.orange, palette.bg0)

          set_hl("FloatBorder", palette.bg5, palette.bg0)
          set_hl("TelescopeBorder", palette.none, palette.bg0)

          set_hl("NormalFloat", palette.bg5, palette.bg0)
          set_hl("Normal", palette.fg0, palette.bg0)
          set_hl("NormalNC", palette.fg0, palette.bg0)

        end,
      })

      vim.g.gruvbox_material_background = "hard"
      vim.g.gruvbox_material_enable_italic = true
    end,
  },
}
