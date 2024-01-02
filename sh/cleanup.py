#!/bin/bash

with open('/Users/i/.zsh_history', encoding='latin1') as file:
    lines = file.readlines()

clean_lines = ''
for line in lines:
    if 'ytdl' in line:
        ...
    elif 'yt-dlp' in line:
        ...
    else:
        clean_lines += line

with open('/Users/i/.zsh_history', encoding='latin1', mode='w') as file:
    file.writelines(clean_lines)

print()
print('  -> done cleaning up...')
