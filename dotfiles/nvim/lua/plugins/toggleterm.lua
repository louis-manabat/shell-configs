local _plugin = {
    "akinsho/toggleterm.nvim",
    version = "v2.7.1",
    config = true,
    lazy = false,
    enabled = true
};

_plugin.config = function()
    require("toggleterm").setup({

    });
end;

return _plugin;