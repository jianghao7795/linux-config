return {
  {
    -- 在 LSP publishDiagnostics 层面完全过滤 vtsls 诊断码 7016
    -- 虚拟文本、浮动窗口、符号列、quickfix 全部生效，无一遗漏
    "neovim/nvim-lspconfig",
    init = function()
      local group = vim.api.nvim_create_augroup("user_filter_ts7016", { clear = true })
      vim.api.nvim_create_autocmd("LspAttach", {
        group = group,
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          -- 只针对 vtsls（也兼容 tsserver/ts_ls）
          if not client or not vim.tbl_contains({ "vtsls", "tsserver", "ts_ls" }, client.name) then
            return
          end
          -- 在诊断到达 Neovim 之前直接剔除 7016
          local orig = client.handlers["textDocument/publishDiagnostics"]
            or vim.lsp.diagnostic.on_publish_diagnostics
          client.handlers["textDocument/publishDiagnostics"] = function(err, result, ctx, config)
            if result and result.diagnostics then
              result.diagnostics = vim.tbl_filter(function(d)
                return d.code ~= 7016
              end, result.diagnostics)
            end
            orig(err, result, ctx, config)
          end
        end,
      })
    end,
  },
}
