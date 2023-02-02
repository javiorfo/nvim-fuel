# nvim-executor
*nvim-executor is a Neovim plugin for running a main or script in several languages. This is meant to be useful for practicing and maybe teaching.*

## Caveats
- To use this plugin in a particular language, **the compiler or language itself needs to be installed**.
- This plugin has been developed on and for Linux following open source philosophies.

## Overview
- [x] Characteristics
    - [x] Command to show results in Executor console
    - [x] Command to close Executor console
    - [x] Execution Neovim modes
        - [x] Normal mode
        - [ ] Insert mode
    - [x] Console size configurable
    - [x] Autosave configurable
    - [x] Supports different languages in same window (different buffers) 
    - [ ] Main args
    - [x] IO
        - [x] Std Output
        - [x] Std Input
- [x] Compiled and scripting languages (compilers or languages are required to be installed)
    - [x] C
    - [x] C++
    - [x] Go
    - [x] Haskell
    - [x] Java
    - [ ] Javascript/Typescript/Node
    - [x] Kotlin
    - [x] Lua
    - [x] Python
    - [x] Rust
    - [x] Scala

## Installation
`Vim Plug`
```vim
Plug 'javi-7/nvim-executor'
Plug 'javi-7/nvim-osfa'
```
`Packer`
```lua
use {
    'javi-7/nvim-executor'
    requires = {{ 'javi-7/nvim-osfa' }}
  }
```

### Configuration
- Set mappings in *init.vim* or *init.lua*
```lua
local opts = { noremap = true, silent = true }

-- Normal mode 
vim.api.nvim_set_keymap('n', '<leader>er', '<Plug>ExecutorRun', opts)
vim.api.nvim_set_keymap('n', '<leader>ec', '<Plug>ExecutorClose<CR>', opts)
```

- Only the installation step is required to use this plugin, but you can modify this options if you like:
```lua
require'executor'.setup{
    -- Default console size
    console_size = 10,

    -- Default autosave before pressing the executor shortcut
    autosave = true
}
```

# Usage
- Executing the map corresponding to `ExecutorRun` in a main or scripting file, it will compile and execute the aforementioned file opening a console ouput.
- Execute the map corresponding to `ExecutorClose` to close all open Executor console. 

## Screenshots
### Java:
<img src="https://github.com/javi-7/img/blob/master/nvim-executor/executor-java.gif?raw=true" alt="java" style="width:1200;"/>

### C:
<img src="https://github.com/javi-7/img/blob/master/nvim-executor/executor-c.gif?raw=true" alt="c" style="width:1200;"/>

### Haskell and Rust in the same window:
<img src="https://github.com/javi-7/img/blob/master/nvim-executor/executor-haskell-rust.gif?raw=true" alt="haskell" style="width:1200;"/>

**NOTE:** The colorscheme **blackcat** from [nvim-poe](https://github.com/javi-7/nvim-poe) is used in this image.

## Support
- [Paypal](https://www.paypal.com/donate/?hosted_button_id=DT5ZGHRJKYJ8C)
