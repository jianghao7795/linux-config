-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.pack.lua" },
  -- { import = "astrocommunity.colorscheme.onedark" },
  -- { import = "astrocommunity.colorscheme.catppuccin" },
  -- { import = "astrocommunity.completion.copilot-lua" },
  -- { import = "astrocommunity.completion.dracula" },
  -- example of importing an entire language pack
  -- these packs can set up things such as Treesitter, Language Servers, additional language specific plugins, and more!
  -- { import = "astrocommunity.colorscheme.tokyodark-nvim" }
  -- { import = "astrocommunity.colorscheme.aurora" }
  -- { import = "astrocommunity.colorscheme.bamboo-nvim" }
  { import = "astrocommunity.colorscheme.kanagawa-nvim" },

  -- Vue3 语言包支持
  -- { import = "astrocommunity.pack.vue" },
  -- { import = "astrocommunity.pack.typescript" },
  -- { import = "astrocommunity.pack.javascript" },
  -- { import = "astrocommunity.pack.json" },
  -- { import = "astrocommunity.pack.html-css" },

  -- 代码格式化和检查

  -- 自动补全增强
  -- { import = "astrocommunity.completion.copilot-lua" },
}
