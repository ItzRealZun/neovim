-- Buffers, filemanagers, terminals
vim.keymap.set('n', '<Tab>', ':BufferLineCycleNext<CR>')
vim.keymap.set('n', '<s-Tab>', ':BufferLineCyclePrev<CR>')
vim.keymap.set('n', '<space>c', ':Neotree float reveal toggle<CR>')
vim.keymap.set('n', '<space>l', ':Neotree left reveal toggle<CR>')
vim.keymap.set('t', '<Esc><Esc>', "<C-\\><C-N>")
vim.keymap.set('n', '<space>tf', ':ToggleTerm direction=float<CR>')
vim.keymap.set('n', '<space>tv', ':ToggleTerm size=45 direction=vertical<CR>')
vim.keymap.set('n', '<space>f', ':Telescope find_files<CR>')


-- Definitions, declarations, etc
local on_attach = function(_, bufnr)
  local function buf_set_option(...)
    vim.api.nvim_buf_set_option(bufnr, ...)
  end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  local opts = { buffer = bufnr, noremap = true, silent = true }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
  vim.keymap.set('n', '<space>g', vim.lsp.buf.implementation, opts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, opts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
  vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
  vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
  vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
  vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)
end


-- Dynamically change colorscheme
local colorschemes = vim.fn.getcompletion("", "color")
local current_index = 1

local function change_color(direction)
  if direction == "next" then
    current_index = current_index % #colorschemes + 1
  elseif direction == "prev" then
    if current_index == 1 then
      current_index = #colorschemes
    else
      current_index = current_index - 1
    end
  else
    return
  end
  local new_scheme = colorschemes[current_index]
  vim.cmd("colorscheme " .. new_scheme)
  print("Switched to colorscheme: " .. new_scheme)
end

vim.keymap.set("n", "<A-Tab>", function() change_color("next") end)
vim.keymap.set("n", "\\<Tab>", function() change_color("prev") end)

