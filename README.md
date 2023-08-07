# nvim-fuel
### Fuel for your programs
*nvim-fuel is a Neovim plugin for running a main or script in several languages. This is meant to be useful for practicing and maybe teaching.*

## Caveats
- To use this plugin in a particular language, **the compiler or language itself needs to be installed**.
- Supported languages are: **Assembly, C, C++, Clojure, Go, Haskell, Java, Kotlin, Lua, Python, Rust, Scala, Scheme and Zig**
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

## Installation
`Packer`
```lua
use {
    'javiorfo/nvim-fuel',
    requires = 'javiorfo/nvim-popcorn'
}
```
`Lazy`
```lua
{
    'javiorfo/nvim-fuel',
    lazy = true,
    dependencies = { 'javiorfo/nvim-popcorn' },
    -- ft could contain only the languages nvim-fuel will be used for
    ft = { "asm", "c", "cpp", "clojure", "go", "haskell", "java", "kotlin", "lua", "python", "rust", "scala", "scheme", "zig" },
    config = function()
         -- Not necessary. Only if you want to change the setup
    end,
    keys = {
        { "<leader>fu", "<Plug>Fuel" },
        { "<leader>fs", "<Plug>FuelStop" }
    }
}
```

### Configuration (Packer)
- Set mappings in *init.vim* or *init.lua*
```lua
local opts = { noremap = true, silent = true }

-- Normal mode 
vim.api.nvim_set_keymap('n', '<leader>fu', '<Plug>Fuel', opts)
vim.api.nvim_set_keymap('n', '<leader>fs', '<Plug>FuelStop<CR>', opts)
```

- Only the installation step is required to use this plugin, but you can modify this options if you like:
```lua
require'fuel'.setup{
    -- Default console size (this applies to popup size too)
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
<img src="https://github.com/javiorfo/img/blob/master/nvim-fuel/fuel-java.gif?raw=true" alt="java" />

### C:
<img src="https://github.com/javiorfo/img/blob/master/nvim-fuel/fuel-c.gif?raw=true" alt="c" />

### Haskell and Rust in the same window:
<img src="https://github.com/javiorfo/img/blob/master/nvim-fuel/fuel-haskell-rust.gif?raw=true" alt="haskell" />

### Kotlin:
#### With popup console
<img src="https://github.com/javiorfo/img/blob/master/nvim-fuel/fuel_popup.png?raw=true" alt="popup" />

**NOTE:** The colorscheme **nebula** from [nvim-nyctophilia](https://github.com/javiorfo/nvim-nyctophilia) is used in this image.

---

### Donate
- [Paypal](https://www.paypal.com/donate/?hosted_button_id=FA7SGLSCT2H8G)
