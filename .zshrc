export LANG=ja_JP.UTF-8

# Alias
## EditorをGVimにする
export EDITOR=/Applications/MacVim.app/Contents/MacOS/Vim
alias vi='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
alias vim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'

## Other
alias la='ls -al'

# 補完
autoload -U compinit compinit
## 補完候補を一覧表示
setopt auto_list
## 補完方法毎にグループ化する。
### 補完方法の表示方法
### %B...%b: 「...」を太字にする。
### %d: 補完方法のラベル
zstyle ':completion:*' format '%B%d%b'
zstyle ':completion:*' group-name ''
## 補完侯補をメニューから選択する。
### select=2: 補完候補を一覧から選択する。
###           ただし、補完候補が2つ以上なければすぐに補完する。
zstyle ':completion:*:default' menu select=2
## 補完候補に色を付ける。
### "": 空文字列はデフォルト値を使うという意味。
zstyle ':completion:*:default' list-colors ""
## 補完候補がなければより曖昧に候補を探す。
### m:{a-z}={A-Z}: 小文字を大文字に変えたものでも補完する。
### r:|[._-]=*: 「.」「_」「-」の前にワイルドカード「*」があるものとして補完する。
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z} r:|[._-]=*'

# プロンプトが表示されるたびにプロンプト文字列を評価、置換する
setopt prompt_subst

# ビープを鳴らさない
setopt nobeep

# プロンプト
autoload -Uz vcs_info
zstyle ':vcs_info:*' formats '(%s)-[%b]'
zstyle ':vcs_info:*' actionformats '(%s)-[%b|%a]'
precmd () {
    psvar=()
    LANG=en_US.UTF-8 vcs_info
    [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}
autoload colors
colors
PROMPT="%{${fg[green]}%}%n %1(v|%F{green}%1v%f|) %% %{${reset_color}%}"
RPROMPT="%{${fg[green]}%}[%~]%{${reset_color}%}"
PROMPT2="%n>"

# cd
## 指定したコマンド名がなく、ディレクトリ名と一致した場合 cd する
setopt auto_cd
## cd でTabを押すとdir list を表示
setopt auto_pushd
## ディレクトリスタックに同じディレクトリを追加しないようになる
setopt pushd_ignore_dups
## コマンド名に / が含まれているとき PATH 中のサブディレクトリを探す
setopt path_dirs

# スペルチェック
## コマンドのスペルチェックをする
setopt correct
## コマンドライン全てのスペルチェックをする
setopt correct_all

# ヒストリ
## ヒストリを保存するファイル
HISTFILE=~/.zsh_history
## メモリ上のヒストリ数。
## 大きな数を指定してすべてのヒストリを保存するようにしている。
HISTSIZE=10000000
## 保存するヒストリ数
SAVEHIST=$HISTSIZE
## ヒストリファイルにコマンドラインだけではなく実行時刻と実行時間も保存する。
setopt extended_history
## 同じコマンドラインを連続で実行した場合はヒストリに登録しない。
setopt hist_ignore_dups
## スペースで始まるコマンドラインはヒストリに追加しない。
setopt hist_ignore_space
## すぐにヒストリファイルに追記する。
setopt inc_append_history
## zshプロセス間でヒストリを共有する。
setopt share_history
## ヒストリを選択する(C-n, C-p)
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end


PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
