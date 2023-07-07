# Init kickstart

## Description

There are a few settings that I was starting to tweak from kickstart.nvim. Now I want them on my other machines, and I want to be able to update the kickstart script whenever without blowing away my changes. I'm hoping to keep this readme legible so I can pick up where I left off every six months when I make a change.

#### update.sh

I was also trying to use github copilot while writing a bash script. It might have been a little more trouble than it was worth, but I learned a lot more of the essentials around bash scripting while trying to debug code that I didn't write.

The script starts by verifying that the config directories exist, if they don't they are created.
```
~/.config/nvim/lua/kickstart
~/.config/nvim/lua/custom
```

The path that the script is running should have a submodule for kickstart.nvim

git pull (hopefully that updates kickstart.nvim)

then copy all of the files over to my machines config

#### custom.lua

This is where I put my own preference for settings and plugins in place. init.lua loads `custom.lua` after `kickstart.lua`

I think I've made the mistake of updating directly in kickstart, or directly in custom without updating my git version. I want to figure something out for tracking those changes.

