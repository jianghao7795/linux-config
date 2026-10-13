return {
  "rhysd/vim-clang-format",
  config = function()
    -- 可选：指定特定的clang-format版本，如果系统上有多个
    -- vim.g.clang_format_path = "/usr/bin/clang-format"
    
    -- 设置自动格式化，例如退出插入模式时
    vim.g.clang_format_auto_format = 1
  end
}
