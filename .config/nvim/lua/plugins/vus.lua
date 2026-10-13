return {
  -- treesitter 语法高亮
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "vue", "css" } },
  },

  -- Vue LSP + 诊断显示配置
  {
    "neovim/nvim-lspconfig",
    opts = {
      -- 诊断信息显示：TS/Vue 错误信息通常很长，避免截断
      diagnostics = {
        virtual_text = {
          -- 格式化函数：将多行错误合并为单行，超长截断
          format = function(diagnostic)
            -- 过滤 TS 诊断码 7016 (Could not find a declaration file)
            if diagnostic.code == 7016 then
              return nil
            end
            local msg = diagnostic.message:gsub("\n", " ")
            if #msg > 120 then
              msg = msg:sub(1, 117) .. "..."
            end
            return msg
          end,
        },
        -- 浮动窗口（<leader>cd）：加宽以显示完整错误信息
        float = {
          border = "rounded",
          header = "",
          prefix = "",
          source = "if_many",
          max_width = function()
            return math.max(80, math.floor(vim.o.columns * 0.6))
          end,
          max_height = function()
            return math.floor(vim.o.lines * 0.4)
          end,
        },
      },
      servers = {
        -- vue_ls (Volar 3.x): 负责 .vue 文件中的 CSS/HTML 以及 template 类型检查
        -- TypeScript 部分通过 tsserver/request 转发给 vtsls 处理
        vue_ls = {
          -- 显式启用，mason-lspconfig 才能自动 start 此 server
          enabled = true,
          -- vite 项目没有 vue.config.js，添加 vite 配置文件作为 root marker
          root_markers = { "package.json", "vite.config.ts", "vite.config.js" },
          init_options = {
            vue = {
              -- 启用 hybridMode 会导致 vue_ls 尝试自行处理 TS，与 vtsls 冲突
              -- 保持 false（默认），让 TypeScript 交由 vtsls 处理
              hybridMode = false,
            },
          },
        },
        -- vtsls: TypeScript LSP，负责 .vue 文件中 <script> 和 template 表达式的类型分析
        vtsls = {
          settings = {
            vtsls = {
              autoUseWorkspaceTsdk = true,
            },
            typescript = {
              preferences = {
                -- 去掉 import 路径的文件后缀 (.ts/.js) 和 /index
                -- "minimal": ./foo.ts → ./foo, ./dir/index → ./dir
                importModuleSpecifierEnding = "minimal",
              },
            },
          },
        },
      },
    },
  },

  -- 修复 @vue/typescript-plugin 路径（lang.vue extra 的路径是错误的）
  -- location 必须指向 vue-language-server 包根目录，这样 tsserver 才能找到
  -- {location}/node_modules/@vue/typescript-plugin
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      if not opts.servers.vtsls then
        return
      end
      local vtsls = opts.servers.vtsls

      -- 确保 .vue 在 vtsls 的 filetypes 中
      vtsls.filetypes = vtsls.filetypes or {}
      local has_vue = false
      for _, ft in ipairs(vtsls.filetypes) do
        if ft == "vue" then
          has_vue = true
          break
        end
      end
      if not has_vue then
        table.insert(vtsls.filetypes, "vue")
      end

      -- 构建正确的 globalPlugins 路径
      vtsls.settings = vtsls.settings or {}
      vtsls.settings.vtsls = vtsls.settings.vtsls or {}
      vtsls.settings.vtsls.tsserver = vtsls.settings.vtsls.tsserver or {}
      vtsls.settings.vtsls.tsserver.globalPlugins =
        vtsls.settings.vtsls.tsserver.globalPlugins or {}

      -- 移除所有已存在的 @vue/typescript-plugin（lang.vue extra 添加的路径是错误的）
      local new_plugins = {}
      for _, plugin in ipairs(vtsls.settings.vtsls.tsserver.globalPlugins) do
        if plugin.name ~= "@vue/typescript-plugin" then
          table.insert(new_plugins, plugin)
        end
      end

      -- 使用正确的 location：指向 vue-language-server 包根目录
      local mason_path = vim.env.MASON or (vim.fn.stdpath("data") .. "/mason")
      local pkg_root = vim.fs.normalize(mason_path .. "/packages/vue-language-server")
      local plugin_path = vim.fs.normalize(pkg_root .. "/node_modules/@vue/typescript-plugin")

      if vim.loop.fs_stat(plugin_path) then
        table.insert(new_plugins, {
          name = "@vue/typescript-plugin",
          -- BUGFIX: location 必须指向包根目录，tsserver 会在此目录下找 node_modules/@vue/typescript-plugin
          -- lang.vue extra 错误地将 location 指向了 .../@vue/language-server，
          -- 导致 tsserver 在 .../@vue/language-server/node_modules/@vue/typescript-plugin 查找 plugin → 找不到！
          location = pkg_root,
          languages = { "vue" },
          configNamespace = "typescript",
          enableForWorkspaceTypeScriptVersions = true,
        })
      end

      vtsls.settings.vtsls.tsserver.globalPlugins = new_plugins
    end,
  },
}
