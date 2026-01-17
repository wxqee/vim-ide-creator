# Vim Web 前端开发 IDE 配置

这是一个专为 MacOS 系统设计的 Vim IDE 配置方案，主要面向 Web 前端开发，支持 HTML、HTML5、CSS3、JavaScript、React、Python、Node.js、SQL、Docker 和 Markdown 等技术栈。

## 功能特性

### 基本 IDE 功能
- 语法高亮支持多种编程语言
- 代码自动补全
- 文件浏览和管理
- 多窗口/标签页编辑
- 代码折叠
- 拼写检查
- 版本控制集成（Git）

### 前端开发增强
- JavaScript/TypeScript 智能补全
- React JSX/TSX 支持
- CSS/SCSS 智能补全和格式化
- HTML 标签自动闭合
- Emmet 快速编码
- 代码 linting 和格式化
- 调试支持

## 系统要求

- macOS 10.13 或更高版本
- Vim 8.0 或更高版本
- Git
- Node.js（用于前端开发工具链）

## 安装步骤

### 快速安装（推荐）

使用自动化安装脚本一键完成所有配置：

```bash
# 克隆仓库
git clone https://github.com/your-username/my_vim_ide_settings.git
cd my_vim_ide_settings

# 运行安装脚本（需要管理员权限）
./install.sh
```

### 手动安装步骤

如果您更倾向于手动配置，可以按照以下步骤进行：

### 1. 安装 Vim

如果您的系统中没有 Vim 或版本过低，可以使用 Homebrew 安装最新版本：

```bash
brew install vim
```

### 2. 克隆配置仓库

```bash
git clone https://github.com/your-username/my_vim_ide_settings.git
cd my_vim_ide_settings
```

### 3. 安装依赖

```bash
# 安装 Node.js 依赖（用于前端开发工具）
npm install -g eslint prettier stylelint typescript

# 安装 Python 依赖（用于部分 Vim 插件）
pip install flake8 black
```

### 4. 配置 Vim

将配置文件链接到您的 home 目录：

```bash
ln -sf $(pwd)/.vimrc ~/.vimrc
ln -sf $(pwd)/.vim ~/.vim
```

### 5. 安装插件

启动 Vim 并运行插件安装命令：

```bash
vim +PluginInstall +qall
```

## 插件说明

### 插件管理器
- **Vundle.vim**: Vim 插件管理系统

### 语法高亮与补全
- **coc.nvim**: 智能代码补全引擎（支持Vim 9.0，替代YouCompleteMe）
- **vim-javascript**: JavaScript 增强支持
- **vim-jsx-pretty**: JSX/TSX 语法高亮和格式化
- **tomasr/molokai**: 主题插件
- **vim-css3-syntax**: CSS3 语法高亮
- **typescript-vim**: TypeScript 支持
- **python-mode**: Python 开发环境
- **elzr/vim-json**: JSON 增强支持
- **vim-scripts/SQLComplete.vim**: SQL 语法高亮和补全
- **ekalinin/Dockerfile.vim**: Dockerfile 支持
- **mattn/emmet-vim**: HTML 快速编码支持
- **godlygeek/tabular**: Markdown 表格支持
- **plasticboy/vim-markdown**: Markdown 增强支持

### 文件管理
- **NERDTree**: 文件浏览器
- **nerdtree-git-plugin**: NERDTree Git 集成
- **vim-airline**: 状态栏增强
- **vim-airline-themes**: 状态栏主题
- **ctrlp.vim**: 文件搜索
- **bufexplorer.zip**: 标签栏增强

### 代码质量
- **ALE**: 异步 linting 引擎
- **vim-prettier**: Prettier 代码格式化
- **vim-fugitive**: Git 集成
- **vim-gitgutter**: Git 更改指示器

### 其他增强
- **emmet-vim**: Emmet 快速编码
- **vim-surround**: 括号/标签操作
- **vim-commentary**: 快速注释
- **lilydjwg/colorizer.vim**: 颜色预览
- **jiangmiao/auto-pairs**: 括号自动配对

## 使用指南

### 基本操作

```vim
# 打开文件
evim filename

# 打开文件浏览器（NERDTree）
:NERDTreeToggle

# 搜索文件
<Ctrl-p>

# 保存文件
:w

# 退出
:q

# 保存并退出
:wq
```

### 代码补全

coc.nvim 提供智能代码补全，默认情况下会自动触发。也可以使用 `Tab` 键手动触发补全。

#### 补全快捷键
- `<Tab>`: 选择补全项并确认
- `<CR>`: 确认补全
- `<C-space>`: 手动触发补全

#### 诊断与跳转
- `<F8>`: 查看所有诊断信息
- `[g`: 跳转到上一个诊断
- `]g`: 跳转到下一个诊断
- `gd`: 跳转到定义
- `gy`: 跳转到类型定义
- `gi`: 跳转到实现
- `gr`: 查看引用

### 文件类型特定功能

#### JavaScript/React
- JSX 语法高亮和补全
- 自动格式化（`:Prettier`）
- ESLint 检查（自动）

#### CSS/SCSS
- CSS3 语法高亮
- 颜色预览
- 自动补全
- Stylelint 检查

#### HTML
- 标签自动闭合
- Emmet 支持（`Ctrl-y ,` 触发）

#### Python
- 语法高亮和补全
- Flake8 检查
- Black 格式化

#### Markdown
- 语法高亮
- 实时预览（需要额外配置）

## 快捷键映射

### 通用快捷键
```vim
<Leader> = 空格
<Leader>w = 保存文件
<Leader>q = 关闭当前窗口
<Leader>n = 打开/关闭 NERDTree
<Leader>t = 打开新标签页
<Leader>c = 切换到下一个标签页
<Leader>p = 切换到上一个标签页
<Leader>f = 格式化代码（Prettier）
```

### 窗口管理
```vim
<Ctrl-w>h = 向左切换窗口
<Ctrl-w>j = 向下切换窗口
<Ctrl-w>k = 向上切换窗口
<Ctrl-w>l = 向右切换窗口
<Ctrl-w>v = 垂直分割窗口
<Ctrl-w>s = 水平分割窗口
```

### 代码编辑
```vim
gc = 快速注释/取消注释（visual 模式）
cs"' = 将双引号改为单引号
ysiw] = 在单词外添加方括号
```

## 自定义配置

### 修改主题

在 `.vimrc` 文件的末尾找到以下行并修改（主题设置必须在Vundle初始化之后）：

```vim
colorscheme molokai
```

可用的主题：
- molokai
- gruvbox
- solarized
- dracula

### 添加/删除插件

在 `.vimrc` 中找到插件配置部分：

```vim
" Vundle 插件配置
Plugin '插件名称'
```

添加或删除插件后，运行 `:PluginInstall` 或 `:PluginClean`。

## 故障排除

### 插件安装失败

确保您的网络连接正常，并检查 Git 是否正确安装。如果仍然失败，可以尝试手动安装插件：

```bash
cd ~/.vim/bundle
git clone https://github.com/username/plugin-name.git
```

### 代码补全不工作

检查 coc.nvim 扩展是否正确安装：

```bash
# 在 Vim 中运行
:CocInstall coc-json coc-tsserver coc-css coc-html coc-prettier
```

确保 Node.js 已正确安装：

```bash
node --version
```

### 语法高亮问题

确保您的 Vim 版本支持语法高亮，并在 `.vimrc` 中启用了相关设置：

```vim
syntax enable
filetype plugin indent on
```

## 更新配置

```bash
cd my_vim_ide_settings
git pull
ln -sf $(pwd)/.vimrc ~/.vimrc
vim +PluginUpdate +qall
```

## 贡献

如果您有任何改进建议或发现问题，请提交 Issue 或 Pull Request。

## 许可证

MIT License

## 更新日志

### v1.0.0 (2026-01-17)
- 初始版本发布
- 支持基本前端开发功能
- 集成常用插件
- 优化 MacOS 系统兼容性