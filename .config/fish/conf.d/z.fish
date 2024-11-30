
if test -f /usr/local/share/z.lua/z.lua
    lua /usr/local/share/z.lua/z.lua --init fish enhanced once fzf | source
else
    lua /opt/homebrew/opt/z.lua/share/z.lua/z.lua --init fish enhanced once fzf | source
end
