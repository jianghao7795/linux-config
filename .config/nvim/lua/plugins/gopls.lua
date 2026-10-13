-- ~/.config/nvim/lua/plugins/gopls.lua
return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = {
        enabled = true,
      },
      servers = {
        gopls = {
          settings = {
            gopls = {
              hints = {
                assignVariableTypes = true, -- 显示 record system.SysOperationRecord 这种类型
                parameterNames = true, -- 显示 s:, prefix: 这种参数名
                rangeVariableTypes = true,
                compositeLiteralTypes = true,
                compositeLiteralFields = true,
                constantValues = true,
                functionTypeParameters = true,
              },
            },
          },
        },
      },
    },
  },
}
