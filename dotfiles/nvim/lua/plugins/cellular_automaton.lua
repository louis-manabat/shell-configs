local _plugin = {
    "eandrju/cellular-automaton.nvim",
    dependencies = {
        "nvim-treesitter/nvim-treesitter"
    },
    -- lazy = true,
    enabled = true
}

-- Not needed for now since no configs are needed
-- - Unless custom logic is created using the following below
-- - https://github.com/Eandrju/cellular-automaton.nvim?tab=readme-ov-file#implementing-your-own-cellular-automaton-logic
_plugin.config = function()
     
end;

return _plugin;