#!/bin/bash

# Vim Web 前端开发 IDE 安装脚本
# 专为 MacOS 系统设计

echo "========================================"
echo "Vim Web 前端开发 IDE 安装脚本"
echo "========================================"
echo

# 检查是否为 root 用户
if [ "$EUID" -eq 0 ]; then
  echo "错误：请不要以 root 用户身份运行此脚本"
  exit 1
fi

# 检查是否在正确的目录中
if [ ! -f "README.md" ] || [ ! -f ".vimrc" ]; then
  echo "错误：请在配置文件所在目录运行此脚本"
  exit 1
fi

# 安装 Homebrew（如果未安装）
echo "检查 Homebrew..."
if ! command -v brew &> /dev/null; then
  echo "安装 Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  
  # 添加 Homebrew 到 PATH
  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"
else
  echo "Homebrew 已安装"
fi

# 更新 Homebrew
echo "更新 Homebrew..."
brew update

# 安装 Vim（如果未安装或版本过低）
echo "检查 Vim..."
if ! command -v vim &> /dev/null || [ "$(vim --version | head -n 1 | awk '{print $5}')"  "8.0" ]; then
  echo "安装 Vim..."
  brew install vim
else
  echo "Vim 已安装（版本：$(vim --version | head -n 1 | awk '{print $5}')）"
fi

# 安装 Git（如果未安装）
echo "检查 Git..."
if ! command -v git &> /dev/null; then
  echo "安装 Git..."
  brew install git
else
  echo "Git 已安装"
fi

# 安装 Node.js（如果未安装）
echo "检查 Node.js..."
if ! command -v node &> /dev/null; then
  echo "安装 Node.js..."
  brew install node
else
  echo "Node.js 已安装（版本：$(node --version)）"
fi

# 安装前端开发工具链
echo "安装前端开发工具链..."
npm install -g eslint prettier stylelint typescript

# 安装 Python（如果未安装）
echo "检查 Python..."
if ! command -v python3 &> /dev/null; then
  echo "安装 Python..."
  brew install python
else
  echo "Python 已安装（版本：$(python3 --version)）"
fi

# 安装 Python 依赖
echo "安装 Python 依赖..."
pip3 install flake8 black

# 创建插件目录
echo "创建 Vim 插件目录..."
mkdir -p ~/.vim/bundle

# 克隆 Vundle 插件管理器
echo "安装 Vundle 插件管理器..."
if [ ! -d "~/.vim/bundle/Vundle.vim" ]; then
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
else
  echo "Vundle 已安装"
fi

# 备份现有配置文件
echo "备份现有配置文件..."
if [ -f "~/.vimrc" ]; then
  mv ~/.vimrc ~/.vimrc.bak.$(date +%Y%m%d%H%M%S)
fi

if [ -d "~/.vim" ]; then
  mv ~/.vim ~/.vim.bak.$(date +%Y%m%d%H%M%S)
fi

# 设置配置文件链接
echo "设置配置文件链接..."
ln -sf "$(pwd)/.vimrc" ~/.vimrc
ln -sf "$(pwd)/.vim" ~/.vim

# 安装 Vim 插件
echo "安装 Vim 插件..."
vim +PluginInstall +qall

# 编译 YouCompleteMe
echo "编译 YouCompleteMe 插件..."
cd ~/.vim/bundle/YouCompleteMe
./install.py --js-completer --ts-completer
cd - &> /dev/null

echo
echo "========================================"
echo "安装完成！"
echo "========================================"
echo

echo "使用说明："
echo "1. 启动 Vim：vim"
echo "2. 打开文件浏览器：<Leader>n（Leader 键为空格）"
echo "3. 搜索文件：<Ctrl-p>"
echo "4. 格式化代码：<Leader>f"
echo "5. 更多功能请查看 README.md"
echo

echo "如果遇到问题，请参考 README.md 中的故障排除部分。"
echo "祝您使用愉快！"