local plugin = {
    "nvim-treesitter/nvim-treesitter",
    build = function()
        require("nvim-treesitter.install").update({ with_sync = true })
    end,
    lazy = false,
    enabled = true
};

plugin.config = function()
    require("nvim-treesitter.configs").setup({
        ensure_installed = { 
            "terraform",
            "bash",
            "json"
        },
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true }
    })
end;

return plugin;