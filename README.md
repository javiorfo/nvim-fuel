# nvim-fuel
### Fuel for your programs
*nvim-fuel is a Neovim plugin for running a main or script in several languages. This is meant to be useful for practicing and maybe teaching.*

## Caveats
- To use this plugin in a particular language, **the compiler or language itself needs to be installed**.
- This plugin has been developed on and for Linux following open source philosophies.

## Overview
| Feature | nvim-fuel | NOTE |
| ------- | ------------- | ---- |
| Command to show results in Fuel Console | :heavy_check_mark: | Set by `Fuel` |
| Command to close Fuel Console | :heavy_check_mark: | Set by `FuelStop` |
| Execution in Normal Mode | :heavy_check_mark: | Set by `Fuel` |
| Execution in Insert Mode | :heavy_check_mark: | Set by `Fuel` |
| Console size configurable | :heavy_check_mark: | By `setup` |
| Autosave configurable | :heavy_check_mark: | By `setup` |
| Supports different languages in same window (different buffers)  | :heavy_check_mark: |  |
| Main arguments | :x: | |
| Stdin | :heavy_check_mark: | |
| Popup console | :heavy_check_mark: | By `setup` |

| Language | nvim-fuel |
| ------- | ------------- |
| C | :heavy_check_mark: |
| C++ | :heavy_check_mark: |
| Go | :heavy_check_mark: |
| Haskell | :heavy_check_mark: |
| Java | :heavy_check_mark: |
| Javascript | :x: |
| Kotlin | :heavy_check_mark: |
| Lua | :heavy_check_mark: |
| Python | :heavy_check_mark: |
| Rust | :heavy_check_mark: |
| Scala | :heavy_check_mark: |
| Typescript | :x: |

## Installation
`Packer`
```lua
use {
    'charkuils/nvim-fuel',
    requires = 'charkuils/nvim-popcorn'
}
```
`Lazy`
```lua
{
    'charkuils/nvim-fuel', lazy = true,
    dependencies = { 'charkuils/nvim-popcorn' }
}
```

### Configuration
- Set mappings in *init.vim* or *init.lua*
```lua
local opts = { noremap = true, silent = true }

-- Normal mode 
vim.api.nvim_set_keymap('n', '<leader>er', '<Plug>Fuel', opts)
vim.api.nvim_set_keymap('n', '<leader>ec', '<Plug>FuelStop<CR>', opts)
```

- Only the installation step is required to use this plugin, but you can modify this options if you like:
```lua
require'fuel'.setup{
    -- Default console size
    console_size = 10,

    -- Default autosave before pressing the Fuel shortcut
    autosave = true,

    -- Default false. If you want to show the console in a popup instead of a buffer
    popup = false
}
```

# Usage
- Executing the map corresponding to `Fuel` in a main or scripting file, it will compile and execute the aforementioned file opening a console ouput.
- Execute the map corresponding to `FuelStop` to close all open Fuel console. In case you are using `popup = true` just press <ESC>

## Screenshots
### Java:
<img src="https://github.com/charkuils/img/blob/master/nvim-fuel/fuel-java.gif?raw=true" alt="java" style="width:1200;"/>

### C:
<img src="https://github.com/charkuils/img/blob/master/nvim-fuel/fuel-c.gif?raw=true" alt="c" style="width:1200;"/>

### Haskell and Rust in the same window:
<img src="https://github.com/charkuils/img/blob/master/nvim-fuel/fuel-haskell-rust.gif?raw=true" alt="haskell" style="width:1200;"/>

### Kotlin:
#### With popup console
<img src="https://github.com/charkuils/img/blob/master/nvim-fuel/fuel_popup.png?raw=true" alt="popup" style="width:1200;"/>

**NOTE:** The colorscheme **smoky** from [nvim-whisky](https://github.com/charkuils/nvim-whisky) is used in this image.

## Support Charkuils' Work

<img src="https://github.com/charkuils/img/blob/master/binance/BinancePayQR.png?raw=true" alt="binance" style="width:300px;"/>
