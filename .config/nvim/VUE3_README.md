# AstroNvim 5 + Vue3 配置说明

## 概述

这是一个为 Linux Mint 上的 Neovim + AstroNvim 5 配置的 Vue3 开发环境。

## 已安装的插件

### 核心语言支持
- **Vue3 语言包**: 完整的 Vue3 语法高亮和 LSP 支持
- **TypeScript/JavaScript**: 完整的 TS/JS 支持
- **HTML/CSS**: 前端开发必需的语言支持
- **JSON/YAML**: 配置文件支持

### 开发工具
- **LSP (Language Server Protocol)**: 智能代码补全、错误检查、重构等
- **Treesitter**: 语法高亮和代码解析
- **代码片段**: Vue3 常用代码片段
- **格式化**: Prettier 和 ESLint 支持

### 调试和测试
- **DAP (Debug Adapter Protocol)**: Vue3 应用调试
- **Neotest**: 测试运行器支持
- **代码注释**: 快速注释/取消注释

## 快捷键

### Vue3 特定快捷键
- `<leader>gv` - 跳转到 Vue 组件定义
- `<leader>gV` - 查找 Vue 组件引用
- `<leader>gt` - 跳转到模板
- `<leader>gT` - 查找模板引用

### 文件操作
- `<leader>fn` - 新建 Vue 组件
- `<leader>fp` - 新建 Vue 页面
- `<leader>fl` - 新建 Vue 布局

### 开发工具
- `<leader>dd` - 调试继续
- `<leader>db` - 切换断点
- `<leader>dr` - 调试 REPL

### 测试
- `<leader>tt` - 运行测试
- `<leader>tf` - 运行测试文件
- `<leader>ts` - 测试摘要

### 代码操作
- `<leader>ca` - 代码操作
- `<leader>rn` - 重命名符号
- `<leader>K` - 悬停文档
- `<leader>lf` - 格式化文档

## 代码片段

### Vue3 组件模板
输入 `vcomp` 然后按 `<Tab>` 键：
```vue
<template>
  <div>
    content
  </div>
</template>

<script setup lang="ts">
// script content
</script>

<style scoped>
/* style content */
</style>
```

### Vue3 组合式 API
输入 `vsetup` 然后按 `<Tab>` 键：
```vue
<script setup lang="ts">
import { ref, computed, onMounted } from 'vue'

// component logic
</script>
```

### Vue3 响应式变量
输入 `vref` 然后按 `<Tab>` 键：
```typescript
const variable = ref(initial value)
```

### Vue3 计算属性
输入 `vcomputed` 然后按 `<Tab>` 键：
```typescript
const computed = computed(() => computation)
```

### Vue3 生命周期钩子
输入 `vmounted` 然后按 `<Tab>` 键：
```typescript
onMounted(() => {
  mounted logic
})
```

### Vue3 事件处理
输入 `vclick` 然后按 `<Tab>` 键：
```vue
@click="handler"
```

### Vue3 条件渲染
输入 `vif` 然后按 `<Tab>` 键：
```vue
v-if="condition"
```

### Vue3 列表渲染
输入 `vfor` 然后按 `<Tab>` 键：
```vue
v-for="item in array" :key="key"
```

### Vue3 属性绑定
输入 `vbind` 然后按 `<Tab>` 键：
```vue
:attribute="value"
```

## 配置说明

### LSP 配置
- 启用了 Volar (Vue3 官方语言服务器)
- 配置了 TypeScript 支持
- 启用了代码操作、悬停、引用等功能

### Treesitter 配置
- 安装了 Vue、TypeScript、JavaScript、HTML、CSS 等语法解析器
- 启用了语法高亮和代码解析

### 格式化配置
- 启用了保存时自动格式化
- 支持 Prettier 和 ESLint
- 配置了 Vue 文件的特定格式化规则

## 使用建议

1. **确保安装了 Node.js**: Vue3 开发需要 Node.js 环境
2. **安装项目依赖**: 在项目目录运行 `npm install` 或 `pnpm install`
3. **配置 TypeScript**: 确保项目有 `tsconfig.json` 或 `jsconfig.json`
4. **使用代码片段**: 利用预定义的代码片段提高开发效率
5. **启用 LSP**: 确保 Volar 语言服务器正常运行

## 故障排除

### LSP 不工作
1. 检查是否安装了 Volar: `:LspInstall volar`
2. 检查项目是否有正确的配置文件
3. 重启 Neovim

### 语法高亮不工作
1. 检查 Treesitter 是否安装: `:TSInstall vue`
2. 检查文件类型是否正确识别: `:set filetype?`

### 代码片段不工作
1. 检查 LuaSnip 是否正确安装
2. 检查快捷键配置是否正确

## 更新和维护

定期运行以下命令来更新插件：
```vim
:Lazy update
:TSUpdate
:LspInstall
```

## 贡献

如果你发现任何问题或有改进建议，请提交 issue 或 pull request。
