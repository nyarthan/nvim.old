local bufferline = require('bufferline')
local icons = require('nyarthan.icons')
local colors = require('nyarthan.colors')

bufferline.setup({
  options = {
    mode = 'buffers',
    numbers = 'none',
    close_command = 'bdelete! %d',
    right_mouse_command = 'bdelete! %d',
    left_mouse_command = 'buffer %d',
    indicator = {
      icon = '▎',
      style = 'icon',
    },
    buffer_close_icon = '',
    modified_icon = '●',
    close_icon = '',
    left_trunc_marker = '',
    right_trunc_marker = '',
    name_formatter = function(buf)
      return buf.name
    end,
    max_name_length = 18,
    max_prefix_length = 15,
    tab_size = 18,
    diagnostics = false,
    diagnostics_update_in_insert = true,
    diagnostics_indicator = function(count)
      return '(' .. count .. ')'
    end,
    offsets = {
      { filetype = 'NvimTree', text = 'File Explorer', padding = 1 },
    },
    color_icons = true,
    show_buffer_icons = true,
    show_buffer_close_icons = false,
    show_buffer_default_icon = true,
    show_close_icon = false,
    persist_buffer_sort = true,
    separator_style = 'thin',
    enforce_regular_tabs = true,
    always_show_bufferline = true,
    sort_by = 'insert_after_current',
    custom_areas = {
      right = function()
        local result = {}
        local seve = vim.diagnostic.severity
        local error = #vim.diagnostic.get(0, { severity = seve.ERROR })
        local warning = #vim.diagnostic.get(0, { severity = seve.WARN })
        local info = #vim.diagnostic.get(0, { severity = seve.INFO })
        local hint = #vim.diagnostic.get(0, { severity = seve.HINT })

        if error ~= 0 then
          table.insert(result, {
            text = ' ' .. icons.diagnostics.error .. ' ' .. error,
            guifg = colors.diagnostics.error,
          })
        end

        if warning ~= 0 then
          table.insert(result, {
            text = ' ' .. icons.diagnostics.warning .. ' ' .. warning,
            guifg = colors.diagnostics.warning,
          })
        end

        if hint ~= 0 then
          table.insert(result, {
            text = ' ' .. icons.diagnostics.hint .. ' ' .. hint,
            guifg = colors.diagnostics.hint,
          })
        end

        if info ~= 0 then
          table.insert(result, {
            text = ' ' .. icons.diagnostics.info .. ' ' .. info,
            guifg = colors.diagnostics.info,
          })
        end
        return result
      end,
    },
  },
})
