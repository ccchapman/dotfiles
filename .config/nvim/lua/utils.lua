function loadSettings(options)
  for setting, value in pairs(options) do
    local function buildSetting(setting, value)
      if value == true then
        return 'set ' .. setting
      else 
        return 'set ' .. setting .. '=' .. value
      end
    end

    vim.api.nvim_command(buildSetting(setting, value))
  end
end

function loadPlugins(plugins)
  local function buildPlugged(plugins)
    local result = 'call plug#begin(\'~/.vim/plugged\')\n'
    for index in ipairs(plugins) do
      result = result .. 'Plug \'' .. plugins[index] .. '\'\n'
    end
    result = result .. 'call plug#end()'
    return result
  end

  vim.api.nvim_command(buildPlugged(plugins))
end

function beautify(theme)
  vim.api.nvim_command('colorscheme ' .. theme)
  vim.api.nvim_command('let g:lightline = { \'colorscheme\': \'' .. theme .. '\' }')
end
