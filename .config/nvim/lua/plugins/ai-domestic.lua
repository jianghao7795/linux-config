return {
  "olimorris/codecompanion.nvim",
  opts = function()
    -- 手动读取环境变量，提前判断空值，杜绝nil报错
    local api_key = os.getenv("ZHIPU_API_KEY")
    if not api_key or api_key == "" then
      vim.notify("ZHIPU_API_KEY 环境变量未配置，智谱AI不可用", vim.log.levels.WARN)
    end

    return {
      adapters = {
        zhipu = function()
          return require("codecompanion.adapters").extend("openai_compatible", {
            url = "https://open.bigmodel.cn/api/paas/v4/chat/completions",
            headers = {
              ["Authorization"] = api_key and ("Bearer " .. api_key) or "",
              ["Content-Type"] = "application/json",
            },
            schema = {
              model = { default = "glm-4.7-flash" },
            },
          })
        end,
      },
      strategies = {
        chat = { adapter = "zhipu" },
        inline = { adapter = "zhipu" },
      },
    }
  end,
}
