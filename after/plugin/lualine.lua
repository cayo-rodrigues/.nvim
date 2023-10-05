require('lualine').setup {
  options = {
    icons_enabled = true,
    component_separators = '|',
    section_separators = '',
    -- globalstatus = true
  },
  sections = {
    lualine_c = { { 'filename', path = 1 } },
    lualine_x = {},
  }
}
