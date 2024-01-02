import subprocess


themes = ['3024_Day', 'Argonaut', 'Atom', 'AtomOneLight', 'ayu_light', 'Batman', 'Brogrammer', 'CLRS', 'DotGov', 'Dracula', 'Hardcore', 'Material', 'Spring', 'Thayer Bright']

theme_name = themes[0]

try:
    subprocess.run(["rm", "-rf", "~/.config/kitty/theme.conf"]) 
except expression as identifier:
    pass

subprocess.run(["ln", 
                    "-s", 
                    f"~/.config/kitty/kitty-themes/themes/{theme_name}.conf", 
                    "~/.config/kitty/theme.conf"]) 




