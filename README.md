# HVIM
## Installing
To install HVIM simply use;
```bash
mv ~/.config/nvim ~/.config/nvim_backup
git clone https://github.com/hanoglu/HVIM ~/.config/nvim
nvim
```
## Dependencies
```bash
# rocks.nvim installation
sudo dnf install lua5.1 luarocks
nvim -u NORC -c "source https://raw.githubusercontent.com/nvim-neorocks/rocks.nvim/master/installer.lua"
```

## Neorg Error Fix
### "insertenter" Error
To fix "insertenter" error related with Neorg;
```bash
nvim $(find -name "module.lua" 2> /dev/null | grep auto | head -n1) # Possibly: ~/.local/share/nvim/lazy/neorg/lua/neorg/modules/core/autocommands/module.lua

```
You will see this in line *74*;
```lua
if dont_isolate and vim.fn.exists("#Neorg#" .. autocmd .. "#*") == 0 then
    vim.api.nvim_create_autocmd(autocmd, {
        callback = function(ev)
            _neorg_module_autocommand_triggered("core.autocommands.events." .. autocmd, false, ev)
        end,
    })
elseif vim.fn.exists("#Neorg#" .. autocmd .. "#*.norg") == 0 then
    vim.api.nvim_create_autocmd(autocmd, {
        pattern = "*.norg",
        callback = function(ev)
            _neorg_module_autocommand_triggered("core.autocommands.events." .. autocmd, true, ev)
        end,
    })
end
vim.cmd("augroup END")
module.events.subscribed["core.autocommands"][autocmd] = true
```
**Delete** lines between *81..86* as stated below;
```lua
    vim.api.nvim_create_autocmd(autocmd, {
        pattern = "*.norg",
        callback = function(ev)
            _neorg_module_autocommand_triggered("core.autocommands.events." .. autocmd, true, ev)
        end,
    })
```
### norg_meta Treesitter Error
If you get an error about missing norg_meta package, you should manually install norg_meta Treesitter package with;
```vimscript
:TSInstall norg_meta
```
## Gallery
![1](https://github.com/user-attachments/assets/4ce4234b-ec31-4638-afcb-b15bc83f3d61)

![2](https://github.com/user-attachments/assets/ecc68a27-b037-460d-a222-8a25ae3064e5)

![3](https://github.com/user-attachments/assets/d921d44a-2c75-4add-af9e-50169897d2a2)
