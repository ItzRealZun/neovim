# Installation
```bash
config_dir=$HOME/.config
if [[ -d "$config_dir/nvim" ]]; then
	mv "$config_dir/nvim" "$config_dir/nvim_backup"
fi
mkdir -p "$config_dir"
cd "$config_dir"
git clone https://github.com/ItzRealZun/neovim nvim
