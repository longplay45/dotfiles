# tmux Cheat Sheet (DE Layout + Kitty) ## Prefix 
- `Ctrl + a` → tmux command prefix --- ## 
Sessions - `tmux` → start new session - `tmux 
ls` → list sessions - `tmux attach -t <name>` → 
attach to session - `Ctrl + a d` → detach 
session --- ## Windows (Tabs) - `Ctrl + a c` → 
new window - `Ctrl + a n` → next window - `Ctrl 
+ a p` → previous window - `Ctrl + a ,` → 
rename window - `Ctrl + a &` → close window --- 
## Panes (Splits) - `Ctrl + a v` → split 
left/right - `Ctrl + a s` → split top/bottom - 
`Ctrl + a x` → close pane --- ## Move Between 
Panes - `Ctrl + a h` → left - `Ctrl + a j` → 
down - `Ctrl + a k` → up - `Ctrl + a l` → right 
--- ## Resize Panes - `Ctrl + a H` → resize left 
- `Ctrl + a J` → resize down - `Ctrl + a K` → 
resize up - `Ctrl + a L` → resize right (hold 
key to keep resizing) --- ## Copy Mode (vi-style) 
- `Ctrl + a [` → enter copy mode - `v` → start 
selection - `y` → copy to macOS clipboard - `q` 
→ exit copy mode --- ## Paste - `Ctrl + a p` → 
paste from macOS clipboard --- ## Misc - `Ctrl + 
a r` → reload config - Mouse → click to select 
panes, scroll to navigate --- ## Tip - You can 
type commands manually:
  `Ctrl + a :` → then enter any tmux command
