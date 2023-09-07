local _plugin = {
    "navarasu/onedark.nvim",
    lazy = false,
    enabled = true
};

_plugin.config = function()
    -- Setting up OneDark
    require("onedark").setup({
        style = "warmer"
    });

    -- OneDark will load on startup
    require("onedark").load();
end;

return _plugin;