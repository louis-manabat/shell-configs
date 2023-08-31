local _plugin = {
    url = "navarasu/onedark.nvim",
    lazy = false
}

_plugin.config = function()
    -- Setting up OneDark
    require("onedark").setup({
        style = "warmer"
    });

    -- OneDark will load on startup
    require("onedark").load()
end;

return _plugin;