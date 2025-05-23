# WendelVim

- Neovim config for clojure (mainly) and daily work.

# Install

```bash
git clone https://github.com/W3ND31/nvim ~/.config/nvim && nvim
```

# Todo

- [ ] Solve clojure dependencies `get to definition` problem
- [ ] Improve completion system (maybe change to `coq-nvim`)
- [ ] Improve LSP handling
- [ ] Maybe add something with copilot

# Reset

```bash
rm -rf ~/.local/share/nvim && rm -rf ~/.config/nvim/lazy-lock.json
```

├── commands.lua
├── mappings.lua
├── options.lua

# Dir structure

```bash
├── init.lua
├── lua
    └── config
        ├── commands.lua
        ├── lazy.lua
        ├── options.lua
    └── plugins
        └── ( all plugins ... )
```
