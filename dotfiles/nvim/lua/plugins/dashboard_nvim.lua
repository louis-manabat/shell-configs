local _plugin = { 
    "glepnir/dashboard-nvim",
    event = 'VimEnter',
    dependencies = { 
        "nvim-tree/nvim-web-devicons"
    };
};

_plugin.config = function()
    require("dashboard").setup({
        theme = "hyper"
    });
end;

return _plugin;