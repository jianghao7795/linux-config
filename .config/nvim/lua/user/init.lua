-- ~/.config/nvim/lua/user/lsp/init.lua
return {
  -- 配置 LSP 服务器
  servers = {
    -- 配置 volar
    volar = {
      -- 让 volar 接管 vue/ts/js 文件（Take Over Mode 核心）
      filetypes = { "vue" },
      init_options = {
        typescript = {
          -- 自动查找项目中的 TypeScript SDK（推荐）
          -- 也可以手动指定：tsdk = vim.fn.getcwd() .. "/node_modules/typescript/lib"
          tsdk = nil,
        },
        -- 启用 vue 特性支持
        vue = {
          hybridMode = false, -- 关闭混合模式，完全接管
        },
      },
    },
    -- 禁用 tsserver（避免和 volar 冲突）
    tsserver = {
      disable = true,
    },
  },

  -- 可选：确保 LSP 自动附加到 vue 文件
  config = {
    volar = function(_, opts)
      require("lspconfig").volar.setup(opts)
    end,
  },

  -- 可选：自定义 LSP 客户端配
  lsp = {
    config = {
      gopls = {
        on_attach = function(client, bufnr)
          -- 启用inlay hints
          if client.supports_method("textDocument/inlayHint") then
            vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
          end
        end,
        settings = {
          gopls = {
            hints = {
              assignVariableTypes = true,      -- 显示变量类型提示
              compositeLiteralFields = true,   -- 显示复合字面量字段提示
              compositeLiteralTypes = true,    -- 显示复合字面量类型提示
              constantValues = true,           -- 显示常量值提示
              functionTypeParameters = true,   -- 显示函数类型参数提示
              parameterNames = true,           -- 显示参数名称提示
              rangeVariableTypes = true,       -- 显示range变量类型提示
            },
            analyses = {
              unusedparams = true,
              shadow = true,
            },
            completeUnimported = true,
            usePlaceholders = true,
          },
        },
      }, 
    },
  },
}
