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

--- config

local indentSize = 2

setBufferConfig({
  et = true,
  sw = indentSize,
  sts = indentSize,
  ts = indentSize,
})

setWindowConfig({
  nu = true,
  rnu = true,
})

setGlobalConfig({
  icm = 'split',
})
