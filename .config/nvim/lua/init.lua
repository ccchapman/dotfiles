require 'utils'

loadSettings({
  expandtab = true;
  shiftwidth = 2;
  softtabstop = 2;
  tabstop = 2;
  updatetime = 300;
});

loadPlugins({
  'itchyny/lightline.vim',
  'junegunn/fzf',
  'morhetz/gruvbox',
})

beautify('gruvbox')
