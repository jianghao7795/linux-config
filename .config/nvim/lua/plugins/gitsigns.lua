return {
  {
    "lewis6991/gitsigns.nvim",
    event = "BufReadPre",
    opts = {
      signs = {
        add = { text = "+" },
        delete = { text = "-" },
        change = { text = "~" },
        topdelete = { text = "‾" },
      },
      current_line_blame = true,
      current_line_blame_opts = {
        virt_text_pos = "eol",
        delay = 500,
      },
    }
  }
}
-- require('gitsigns').setup({
--   signs = {
--     add          = { text = '┃' },  -- 新增行符号
--     change       = { text = '┃' },  -- 修改行符号
--     delete       = { text = '_' },  -- 删除行符号
--     topdelete    = { text = '‾' },  -- 顶部删除符号
--     changedelete = { text = '~' },  -- 修改后删除符号
--     untracked    = { text = '┆' },  -- 未跟踪文件符号
--   },
--   signcolumn = true,    -- 显示符号列
--   numhl = false,        -- 行号高亮（建议关闭以避免视觉混乱）
--   linehl = false,       -- 整行高亮
--   current_line_blame = false, -- 当前行责备信息（按需开启）
--   watch_gitdir = { follow_files = true }, -- 自动跟踪 Git 仓库变化
-- })
