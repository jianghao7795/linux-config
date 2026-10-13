# Linux Dotfiles

这是一套面向 Linux 工作环境的个人配置文件，集中管理 Shell、终端、编辑器、复用终端和常用命令行工具的设置。

## 包含内容

- **Zsh**：`.zshrc`、`.zshenv` 和 `.zsh/plugins/`，包含语法高亮与命令建议插件。
- **Neovim**：`.config/nvim/`，基于 LazyVim，包含 LSP、Treesitter、格式化、Git 和 AI 辅助等配置。
- **终端与复用器**：Alacritty、tmux、Zellij。
- **命令行工具**：Starship、lsd、btop、bottom、htop、neofetch、Helix 和 Rucola。
- **其他设置**：Git、默认应用、Node.js 版本和 Vim 配置。

## 快速开始

先安装需要的基础工具：

- Zsh
- Neovim
- tmux 或 Zellij
- Git
- Starship、lsd、fzf、fnm（部分命令和提示符配置会用到）
- Nerd Font（Alacritty 和部分终端图标需要）

将仓库克隆到用户目录下，例如：

```sh
git clone <repository-url> "$HOME/.dotfiles"
cd "$HOME/.dotfiles"
```

建议先备份已有配置，再按需建立软链接。下面的示例只链接配置文件，不会覆盖整个 `$HOME`：

```sh
set -e

repo="$HOME/.dotfiles"

for file in .gitconfig .node-version .tmux.conf .tmux.conf.local .vimrc .zshenv .zshrc; do
  ln -sfn "$repo/$file" "$HOME/$file"
done

mkdir -p "$HOME/.config"
for name in alacritty bottom btop fresh helix htop lsd neofetch nvim rucola zellij; do
  ln -sfn "$repo/.config/$name" "$HOME/.config/$name"
done
ln -sfn "$repo/.config/starship.toml" "$HOME/.config/starship.toml"
ln -sfn "$repo/.zsh" "$HOME/.zsh"
```

重新打开终端后，运行 `nvim` 让插件管理器完成首次安装。若只需要其中一部分配置，可以只链接对应文件或目录。

## 目录结构

```text
.
├── .config/             # 各类 XDG 配置
│   ├── alacritty/       # Alacritty 终端
│   ├── nvim/            # LazyVim/Neovim
│   ├── zellij/           # Zellij 复用终端
│   └── ...
├── .zsh/                # Zsh 插件和历史文件
├── .zshrc               # Zsh 主配置
├── .zshenv              # Zsh 环境初始化
├── .tmux.conf           # tmux 配置
├── .vimrc               # Vim 配置
├── .gitconfig           # Git 配置
└── .node-version        # Node.js 默认版本
```

## 环境变量与本机差异

`.zshrc` 中包含 Go、Rust、Node.js、Bun 和 Starship 的环境设置，部分路径按当前机器目录编写。使用前请检查并调整 `GOROOT`、`GOPATH`、PATH 以及代理地址等变量。

Neovim 的 AI 配置通过环境变量读取 API Key，例如：

```sh
export ZHIPU_API_KEY="your-api-key"
```

不要把真实密钥直接写入配置文件或提交到 Git。

## 安全提醒

这是从个人工作环境整理出的配置快照，仓库中可能包含历史命令、代理订阅、本机路径、Git 凭据或其他运行状态。公开仓库或分享前，请重点检查并移除：

- `.zsh/.zsh_history`
- `.config/clash/` 下的订阅、缓存和数据库文件
- `.gitconfig` 中的凭据助手、URL 重写规则和个人信息
- 任何包含 Token、密码、Cookie 或私有地址的配置

第三方插件和资源保留其各自的版权及许可证，本仓库的 MIT 许可证仅适用于本人的配置内容。

## 许可证

本仓库的个人配置内容使用 [MIT License](LICENSE) 发布。第三方组件请遵循其目录中的许可证文件。
