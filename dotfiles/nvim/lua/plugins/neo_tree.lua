local _M = {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    },
    enabled = true
}

_M.config = function()
  require("neo-tree").setup({
    close_if_last_window = false -- If Neo-tree is the last tab, it will not close nvim
  })

  vim.cmd([[
    nnoremap \ :Neotree toggle<cr>
  ]])
end

return _M;