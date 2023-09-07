local _plugin = {
    "eandrju/cellular-automaton.nvim",
    dependencies = {
        "nvim-treesitter/nvim-treesitter"
    },
    lazy = false,
    enabled = false -- Need to add more configurations to this
}

_plugin.config = function()
    require("cellular-automaton").register_animation({

    });
end;

return _plugin;