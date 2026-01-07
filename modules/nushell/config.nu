# Hide welcome message.
$env.config.show_banner = false

$env.config.buffer_editor = "vi"

# Random aliases
def mkcd [dir: string] {
    mkdir $dir
    ## TODO: mkdir is fine but cd isn't working
    cd $dir
}


# Git aliases.
alias gb   = git branch
alias gco  = git checkout
alias gd   = git pull origin
alias gs   = git status
alias gu   = git push -u origin HEAD

# Rust aliases.
alias cf = cargo +nightly fmt
alias ck = cargo check
alias cl = cargo clippy --all-targets -- -D warnings
