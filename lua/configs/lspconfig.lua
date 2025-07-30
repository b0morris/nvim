-- This file has been corrected to properly configure LSP servers.

local lspconfig = require "lspconfig"
local map = vim.keymap.set

-- Part 1: Define what happens when an LSP server attaches to a buffer
-- This function sets up all the keybindings for LSP features.
local on_attach = function(_, bufnr)
  local function opts(desc)
    return { buffer = bufnr, desc = "LSP " .. desc, noremap = true, silent = true }
  end

  -- Keymaps for LSP navigation and actions
  map("n", "gD", vim.lsp.buf.declaration, opts "Go to Declaration")
  map("n", "gd", vim.lsp.buf.definition, opts "Go to Definition")
  map("n", "K", vim.lsp.buf.hover, opts "Hover Documentation")
  map("n", "gi", vim.lsp.buf.implementation, opts "Go to Implementation")
  map("n", "<leader>D", vim.lsp.buf.type_definition, opts "Go to Type Definition")
  map("n", "<leader>ra", vim.lsp.buf.rename, opts "Rename")
  map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts "Code Action")
  
  -- Use the user's existing Telescope mapping for references
  map("n", "<leader>fc", require("telescope.builtin").lsp_references, opts "Find References")

  -- Workspace folder management
  map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts "Add Workspace Folder")
  map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts "Remove Workspace Folder")
  map("n", "<leader>wl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, opts "List Workspace Folders")
end

-- Part 2: Define the capabilities the LSP client (Neovim) provides
-- This is mostly boilerplate, taken from the user's original config.
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem = {
  documentationFormat = { "markdown", "plaintext" },
  snippetSupport = true,
  preselectSupport = true,
  insertReplaceSupport = true,
  labelDetailsSupport = true,
  deprecatedSupport = true,
  commitCharactersSupport = true,
  tagSupport = { valueSet = { 1 } },
  resolveSupport = {
    properties = {
      "documentation",
      "detail",
      "additionalTextEdits",
    },
  },
}

-- Part 3: List and configure all the LSP servers
-- We loop through this list and set up each one with our on_attach and capabilities.
local servers = { "html", "cssls", "clangd", "asm_lsp", "pyright", "ts_ls", "elixirls" }

-- Note: Renamed 'asm-lsp' to 'asm_lsp' and 'vtsls' to 'tsserver' to match lspconfig standard names.
-- If you use Mason, it will install them with these names.

for _, server_name in ipairs(servers) do
  local opts = {
    on_attach = on_attach,
    capabilities = capabilities,
  }

  -- Add custom configurations for specific servers below
  if server_name == "elixirls" then
    -- This custom path is preserved from your original config
    opts.cmd = { "/home/ubuntu/.local/share/nvim/mason/bin/elixir-ls" }
  end
  
  if server_name == "asm_lsp" then
    opts.filetypes = { "asm", "s", "S" }
  end

  if server_name == "clangd" then
    opts.cmd = { "clangd", "--header-insertion=never", "--header-insertion-decorators=1" }
    opts.init_options = {
      clangdFileStatus = true,
      usePlaceholders = true,
      completeUnimported = false,
      semanticHighlighting = true
    }
  end

  -- This line actually sets up the server
  lspconfig[server_name].setup(opts)
end

-- Part 4: Customize UI elements (preserved from your config)
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = "single",
  focusable = false,
  close_events = { "CursorMoved", "CursorMovedI", "BufHidden", "InsertCharPre" },
})

-- No need to return anything, as this file is loaded via `require`.
