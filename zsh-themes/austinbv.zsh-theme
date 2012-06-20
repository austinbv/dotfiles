autoload -U colors && colors

username='%n'
hostname='%m'
current_path='%~'
permission='%(?..%F{red})%#%{$reset_color%}'

PS1="\
$username@$hostname:%E [$current_path]$permission "
