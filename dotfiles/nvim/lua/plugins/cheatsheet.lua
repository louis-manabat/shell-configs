local _plugin = {
    "sudormrfbin/cheatsheet.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-lua/popup.nvim",
        "nvim-telescope/telescope.nvim"
    },
    lazy = false,
    enabled = false -- Telescope breaking it - need to fix this
};

_plugin.config = function()
    require("cheatsheet").setup({

    });
end;

return _plugin;