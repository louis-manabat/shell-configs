local plugin = {
    url = "nvim-treesitter/nvim-treesitter",
    build = function()
        require("nvim-treesitter.install").update({ with_sync = true })
    end
};

plugin.config = function()
    require("nvim-treesitter.configs").setup({
        ensure_installed = { "terraform" },
        sync_install = false,
        high = { enable = true },
        indent = { enable = true }
    })
end;

return plugin;