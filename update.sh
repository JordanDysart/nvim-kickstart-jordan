#!/usr/bin/env zsh 
# Update the nvim config

git submodule init
git submodule update
git pull

# Get the path to the nvim config
NVIM_CONFIG_PATH="$HOME/.config/nvim/"

# Check if the nvim config path is valid
if [ -z "$NVIM_CONFIG_PATH" ]; then
    echo "Error: Could not find the nvim config path"
    exit 1
fi

# Check if the nvim config path is a directory
if [ ! -d "$NVIM_CONFIG_PATH" ]; then
    echo "Error: The nvim config path is not a directory"
    echo "Warn: running mkdir -p $HOME/.config/nvim/"
	mkdir -p $NVIM_CONFIG_PATH	
    exit 1
else
fi

NVIM_KICKSTART_PATH="$NVIM_CONFIG_PATH/lua/kickstart"

# Check if the nvim config directory has a subdirectory lua/kickstart
if [ ! -d "$NVIM_KICKSTART_PATH" ]; then
    echo "Warn: creating /lua/kickstart subdirectory in config"
    eval mkdir -p $NVIM_KICKSTART_PATH
else 
    echo "Warn: /lua/kickstart subdirectory already exists in config"
fi

NVIM_CUSTOM_PATH="$NVIM_CONFIG_PATH/lua/custom"

# Check if the nvim config directory has a subdirectory lua/kickstart
if [ ! -d "$NVIM_CUSTOM_PATH" ]; then
    echo "Warn: creating /lua/custom subdirectory in config"
    mkdir -p $NVIM_CUSTOM_PATH
else 
    echo "Warn: /lua/custom subdirectory already exists in config"
fi

# Get the path to the current working directory
CWD_PATH=$(pwd)
echo "CWD_PATH: $CWD_PATH"

# Check if the current working directory path is valid
if [ -z "$CWD_PATH" ]; then
    echo "Error: Could not find the current working directory path"
    exit 1
fi

# Check if the current working directory path is a directory
if [ ! -d "$CWD_PATH" ]; then
    echo "Error: The current working directory path is not a directory"
    exit 1
fi

# Check if the current working directory path is a git repository
if [ ! -d "$CWD_PATH/.git" ]; then
    echo "Error: The current working directory path is not a git repository"
    exit 1
fi

# Get the path to the nvim config submodule "kickstart.nvim"
KICKSTART_NVIM_PATH="$CWD_PATH/kickstart.nvim"

# Check if the path to the nvim config submodule "kickstart.nvim" is valid
if [ -z "$KICKSTART_NVIM_PATH" ]; then
    echo "Error: Could not find the path to kickstart.nvim"
    exit 1
fi

# Check if the path to the nvim config submodule "kickstart.nvim" is a directory
if [ ! -d "$KICKSTART_NVIM_PATH" ]; then
    echo "Error: The path to kickstart.nvim is not a directory"
    exit 1
fi

# Check if the kickstart subdirectory path is a git repository
if [ ! -f "$KICKSTART_NVIM_PATH/init.lua" ]; then
    echo "Error: The current subdirectory init.lua is not a file"
    exit 1
fi

# Update the nvim config submodule "kickstart.nvim"
git pull

# Copy init.lua into NVIM_CONFIG_PATH
cp "$KICKSTART_NVIM_PATH/init.lua" "$NVIM_KICKSTART_PATH" || exit 1

cp "$CWD_PATH/init.lua" "$NVIM_CONFIG_PATH" || exit 1

cp "$CWD_PATH/custom/init.lua" "$NVIM_CUSTOM_PATH" || exit 1

echo "Done"
