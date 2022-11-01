# update sources to ustc
sed -i s@/archive.ubuntu.com/@/mirrors.ustc.edu.cn/@g /etc/apt/sources.list
sed -i s@/security.ubuntu.com/@/mirrors.ustc.edu.cn/@g /etc/apt/sources.list

# update
sudo apt update
sudo apt upgrade
sudo apt install -y gcc g++ make cmake zsh git curl net-tools openssh-server
sudo apt install -y neovim nodejs npm python3.8 python3-pip
sudo apt install -y ranger
sudo npm cache clean -f && npm install -g n && n stable

# oh-my-zsh
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	&&
	source $HOME/.zshrc
# plug
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone git://github.com/wting/autojump.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/autojump
# add plug to .zshrc

# miniconda
curl -o ~/miniconda3.sh https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash ~/miniconda.sh -b -p $HOME/miniconda3
echo PATH = ~/miniconda3/bin:$PATH > .zshrc && source $HOME/.zshrc

conda init bash
conda init zsh
conda update conda -y \
	# change source
	&& echo "channels:" > ~/.condarc \
	&& echo " - https://mirrors.ustc.edu.cn/anaconda/pkgs/main/" >> ~/.condarc \
	&& echo " - https://mirrors.ustc.edu.cn/anaconda/pkgs/free/" >> ~/.condarc \
	&& echo " - https://mirrors.ustc.edu.cn/anaconda/cloud/conda-forge/" >> ~/.condarc \
	&& echo "ssl_verify: true" >> ~/.condarc

conda update -n base -c defaults conda -y
codna install pip -y


# neovim
mkdir ~/.config
npm install -g neovim
git clone https://github.com/hanlhan/nvim.git ~/.config/nvim
# git clone https://github.com/ryanoasis/nerd-fonts.git ~/init/nerd-fonts
pip install debugpy
sudo apt install -y ctags fzf xclip
