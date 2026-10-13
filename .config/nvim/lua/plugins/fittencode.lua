return {
  {
    "luozhiya/fittencode.nvim",
    opts = {
      requires = { "nvim-treesitter/nvim-treesitter" },
    },
    config = function(_, opts) require("fittencode").setup(opts) end,
  },
}
