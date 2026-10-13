return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    filesystem = {
      filtered_items = {
        hide_dotfiles = false, -- 显示隐藏文件
        hide_gitignored = false, -- 显示被 gitignore 忽略的文件（可选）
      },
    },
  },
}
