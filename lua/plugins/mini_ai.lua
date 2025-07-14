return {
  'echasnovski/mini.nvim',
  version = false,
  lazy = false,
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-treesitter/nvim-treesitter-textobjects",
  },
  config = function()
    require("mini.ai").setup()
  end
}
