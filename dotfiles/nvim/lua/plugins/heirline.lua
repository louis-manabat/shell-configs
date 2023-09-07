local _plugin = {
    "rebelot/heirline.nvim",
    lazy = false
};

_plugin.config = function()
    require("heirline").setup({
        statusline = {

        },
        winbar = {

        },
        tabline = {

        },
        statuscolumn = {

        }
    });
end;

return _plugin;