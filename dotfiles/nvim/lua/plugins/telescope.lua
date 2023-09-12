local _plugin = {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.2",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope-fzf-native.nvim"
    },
    lazy = false,
    enabled = true
};

_plugin.config = function()
    require("telescope").setup({});
end;

return _plugin;