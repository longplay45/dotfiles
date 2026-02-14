# tmux Cheat Sheet (DE Layout + Kitty)

## Prefix
- `Ctrl + a` → tmux command prefix

---

## Sessions
- `tmux` → start new session
- `tmux ls` → list sessions
- `tmux attach -t <name>` → attach to session
- `Ctrl + a d` → detach session

---

## Windows (Tabs)
- `Ctrl + a c` → new window
- `Ctrl + a n` → next window
- `Ctrl + a p` → previous window
- `Ctrl + a ,` → rename window
- `Ctrl + a &` → close window

---

## Panes (Splits)
- `Ctrl + a v` → split left/right
- `Ctrl + a s` → split top/bottom
- `Ctrl + a x` → close pane

---

## Move Between Panes
- `Ctrl + a h` → left
- `Ctrl + a j` → down
- `Ctrl + a k` → up
- `Ctrl + a l` → right

---

## Resize Panes
- `Ctrl + a H` → resize left
- `Ctrl + a J` → resize down
- `Ctrl + a K` → resize up
- `Ctrl + a L` → resize right

(hold key to keep resizing)

---

## Copy Mode (vi-style)
- `Ctrl + a [` → enter copy mode
- `v` → start selection
- `y` → copy to macOS clipboard
- `q` → exit copy mode

---

## Paste
- `Ctrl + a p` → paste from macOS clipboard

---

## Misc
- `Ctrl + a r` → reload config
- Mouse → click to select panes, scroll to navigate

---

## Tip
- You can type commands manually:
  `Ctrl + a :` → then enter any tmux command

### .tmux.conf

```sh

# Tell tmux to handle pastes correctly
set -g set-clipboard on
set -g assume-paste-time 1

# Enable bracketed paste (important for nano)
# set -g terminal-features 'xterm-kitty:clipboard,RGB,ccolour,cstyle,focus'
set -as terminal-features ',*:clipboard,RGB'

##### Prefix (reliable)
unbind C-b
set -g prefix C-a
bind C-a send-prefix

##### Terminal / colors (kitty)
set -g default-terminal "tmux-256color"
set -ga terminal-overrides ",xterm-kitty:RGB"
set -g focus-events on

##### Mouse + responsiveness
set -g mouse on
set -s escape-time 0
set -g history-limit 100000

##### Indexing
set -g base-index 1
setw -g pane-base-index 1

##### Splits (German keyboard friendly)
# Ctrl+a v = split left/right
# Ctrl+a s = split top/bottom
unbind '"'
unbind %
bind v split-window -h
bind s split-window -v

##### Pane movement (hjkl = layout-independent)
bind h select-pane -L
bind j select-pane -D
bind k select-pane -U
bind l select-pane -R

##### Resize panes (repeatable)
bind -r H resize-pane -L 5
bind -r J resize-pane -D 5
bind -r K resize-pane -U 5
bind -r L resize-pane -R 5

##### Copy mode (vi) + macOS clipboard
setw -g mode-keys vi
set -g set-clipboard on

# Start selection with v, copy with y (to system clipboard via pbcopy)
bind -T copy-mode-vi v send -X begin-selection
bind -T copy-mode-vi y send -X copy-pipe-and-cancel "pbcopy"

##### Paste from macOS clipboard into tmux buffer, then paste
bind p run-shell 'tmux set-buffer "$(pbpaste)" \; paste-buffer'

##### Quick reload
bind r source-file ~/.tmux.conf \; display-message "tmux.conf reloaded"

```