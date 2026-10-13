-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
--
-- LazyVim 的 options.lua 会在其 defaults 之后加载，这里写你的追加/覆盖

-- 剪贴板打通系统（SSH 下自动退回到空，防止 OSC52 误触）
local opt = vim.opt
opt.clipboard = vim.env.SSH_CONNECTION and "" or "unnamedplus"

-- 缩进：默认 2 空格，你想要的语言单独调（见下方 autocmds）
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true

-- 行号
opt.number = true
opt.relativenumber = false

-- 搜索
opt.ignorecase = true
opt.smartcase = true

-- 光标最小上下文行数（滚动时不贴边）
opt.scrolloff = 8
opt.sidescrolloff = 8

-- 保存相关
-- opt.autowrite    = true      -- :wall 类的自动保存
opt.confirm = true -- 退出前确认保存

-- 分割窗口方向：右边 / 下边（个人偏好）
opt.splitright = true
opt.splitbelow = true

-- 禁用拼写检查（写代码烦人，写 markdown 时再开）
vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function()
    vim.opt_local.spell = false
  end,
})

local global = vim.g
global.lazyvim_ts_lsp = "vtsls"
