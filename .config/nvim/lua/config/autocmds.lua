-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- 自动识别 nginx .conf 文件
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  group = vim.api.nvim_create_augroup("nginx_conf_detect", { clear = true }),
  pattern = "*.conf",
  callback = function()
    -- 路径中包含 nginx 关键字，直接认定为 nginx 配置
    local path = vim.fn.expand("%:p"):lower()
    if path:find("nginx") then
      vim.bo.filetype = "nginx"
      return
    end

    -- 内容检测：前 50 行中是否包含 nginx 特征关键字
    local lines = vim.api.nvim_buf_get_lines(0, 0, 50, false)
    local content = table.concat(lines, "\n")
    if content:find("server%s*{")
      or content:find("location%s+")
      or content:find("upstream%s+")
      or content:find("http%s*{")
      or content:find("events%s*{")
      or content:find("proxy_pass%s+")
      or content:find("listen%s+%d")
      or content:find("nginx")
    then
      vim.bo.filetype = "nginx"
    end
  end,
})
