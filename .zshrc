alias ls='ls -la'
alias wdi="cd ~/code/wdi/ && echo 'you are at the root wdi folder...'"
alias reload="source ~/.zshrc && echo 'reloaded...'"
alias tma="echo 'loading tmux -2 attach-session -tX && sleep .5 && tmux -2 attach-session -t0"
alias tmux="echo 'loading tmux -2 (256-color mode) && sleep .5 && tmux -2"
# vim alias
alias vim="cat ~/gameboy.ascii && echo 'loading gvim -v..' && sleep .5 && gvim -v" 
alias vi="cat ~/gameboy.ascii && echo 'loading gvim -v..' && sleep .5 && gvim -v" 
alias vimwork="gvim -v -S ~/vimsesh1"
alias vimcfg="gvim -v -S ~/vimsesh2"
# get better response in terminal apps
KEYTIMEOUT=1
# zacks current class script
myfunction() {
	cd ~/code/wdi/WDI_NYC_Apr14_String/w0$1/d0$2/Zack_Levine
	}
alias wdc=myfunction
# prompt style
PS1="%{$fg[red]%}%n%{$reset_color%}@%{$fg[blue]%}%m %{$fg[yellow]%}%~ %{$reset_color%}%% "
# rbenv needs these
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
