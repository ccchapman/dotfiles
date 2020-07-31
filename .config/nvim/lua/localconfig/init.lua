--- utils

local nvim = vim.api

local function setGlobalConfig(config)
  for setting, value in pairs(config) do
    nvim.nvim_set_option(setting, value)
  end
end

local function setBufferConfig(config)
  for setting, value in pairs(config) do
    nvim.nvim_buf_set_option(0, setting, value)
  end
end

local function setWindowConfig(config)
  for setting, value in pairs(config) do
    nvim.nvim_win_set_option(0, setting, value)
  end
end

local function setCommands(commands)
  for i, command in ipairs(commands) do
    nvim.nvim_command(command)
  end
end

--- config

local indentSize = 2

setBufferConfig {
  et = true,
  sts = indentSize,
  sw = indentSize,
  ts = indentSize,
}

setWindowConfig {
  cc = '80',
  nu = true,
  rnu = true,
  wrap = false,
}

setGlobalConfig {
  icm = 'split',
  shell = 'bash',
  shortmess = 'Ia',
  updatetime = 300,
}

setCommands {
  --- 'colorscheme gruvbox',
}
