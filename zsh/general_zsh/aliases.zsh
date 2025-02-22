alias szshrc='source ~/.zshrc'
alias du='du -h'
alias df='df -h'
alias free='free -h'
alias f='find -iname'
alias v='vim'
alias meteo='curl http://wttr.in/Lille'
alias up='sudo apt update && sudo apt -V --yes upgrade'
alias ydl="youtube-dl --format best --output '%(upload_date)s.%(title)s.%(ext)s' --restrict-filenames --write-description"

# Multitail with basic java colorization
alias mu='multitail -cS apache -cS log4j -n 1000 --no-repeat -b 2 --mark-interval 2'

# History with timestamps and elapsed time
alias h='history -iD'

# ls
# -v: natural sort of version
alias ls='ls                                  -v --classify --group-directories-first --color=auto'
alias  l='ls -l              --human-readable -v --classify --group-directories-first --color=auto'
alias ll='ls -l              --human-readable -v --classify --group-directories-first --color=auto'
alias la='ls -l --almost-all --human-readable -v --classify --group-directories-first --color=auto'

# grep
alias  grep='grep --color=auto'
alias egrep='grep --color=auto'
alias zgrep='grep --color=auto'

# More verbose fileutils
alias cp='nocorrect cp -iv' # -i to prompt for every file
alias mv='nocorrect mv -iv'
alias rm='nocorrect rm -Iv' # -I to prompt when more than 3 files
alias rmdir='rmdir -v'
alias chmod='chmod -v'
alias chown='chown -v'

# ZSH global aliases for piping
# Example : cat myfile.txt G pattern
alias -g G='| grep -in'
alias -g T='| tail'
alias -g L='| less'

# Parent directories
alias cd..='cd ..'
alias '..'='cd ..'
alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias -g ......='../../../../..'
alias -g .......='../../../../../..'

# Git
alias      g='git'
compdef    g=git
alias     gs='git status'
alias   glog='git log --graph --abbrev-commit --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset"'
alias    gpl='git pull; git log -n 1 | grep -q -c "\-\-wip\-\-" && echo "\033[0;33mWARNING: Last commit is a WIP\!\033[0m"'
alias    gaa='git add -A'
alias    gcm='git rev-parse --abbrev-ref origin/HEAD | cut -c8- | xargs -n 1 git checkout' # checkout master/main/develop automatically
alias     gc='git checkout -'
alias  gpsfl='git push --force-with-lease'
alias   gpsf='git push -u --force'
alias   gwip='git add -A; git rm $(git ls-files --deleted) 2> /dev/null; git commit --no-verify -m "--wip-- [skip ci]"'
alias  gwipp='gwip && git push --force-with-lease'
alias gunwip='git log -n 1 | grep -q -c "\-\-wip\-\-" && git reset HEAD~1'
alias   gbrd='git branch -D'
# https://www.shellhacks.com/git-create-tag-push-tag-to-remote/
# https://devconnected.com/how-to-delete-local-and-remote-tags-on-git/
alias   gtag="git tag"
alias   gtag_d="git tag -d"                 #delete tag
alias   gtagsl="git describe --tags"        #show all tags
alias   gptags="git push origin --tags"     #push all local tags
alias   gulc="git reset --soft HEAD~1"      #undo last commit
# shellcheck disable=SC2142
alias delete-merged-branches="git fetch -p && git for-each-ref --format '%(refname:short) %(upstream:track)' | awk '\$2 == \"[gone]\" {print \$1}' | xargs -r git branch -D"

function gco_main() {                       #checkout to the main branch
  NAME=$(git remote show origin | sed -n '/HEAD branch/s/.*: //p')
  echo "checking out to main branch: $NAME"
  eval "gco $NAME"
}

function gpsb() {                           #git push current branch
  NAME=$(git rev-parse --abbrev-ref HEAD)
  echo "pushing branch $NAME"
  git push --set-upstream origin $NAME
}


# Maven
alias m='mvn-in-colors'
compdef _mvn m=mvn
MAVEN_SKIP_TESTS='-Dmaven.test.skip=true' # or -DskipTests
alias   mc='alert printAndRun mvn-in-colors clean'
alias   mt='alert printAndRun mvn-in-colors test'
alias  mct='alert printAndRun mvn-in-colors clean test'
alias  mcp='alert printAndRun mvn-in-colors clean package'
alias mcpt='alert printAndRun mvn-in-colors clean package $MAVEN_SKIP_TESTS'
alias  mpt='alert printAndRun mvn-in-colors package $MAVEN_SKIP_TESTS'
alias  mci='alert printAndRun mvn-in-colors clean install'
alias mcit='alert printAndRun mvn-in-colors clean install $MAVEN_SKIP_TESTS'
alias  mdt='mvn dependency:tree'
alias  msb='printAndRun mvn spring-boot:run'

# NPM
alias  ns='printAndRun npm start'
alias nsd='printAndRun npm run start:dev'
alias nsh='printAndRun npm run start:hmr'
alias  nt='printAndRun npm test'
alias ntw='printAndRun npm run test:watch'

# Scala SBT
alias st='printAndRun sbt ~test-quick'

# Docker compose
alias   dup='alert printAndRun docker-compose up -d'
alias ddown='alert printAndRun docker-compose down -t 5'
alias   dsa='alert printAndRun docker-compose start'
alias   dso='alert printAndRun docker-compose stop'
alias    dl='docker-compose logs'
alias   dlf='docker-compose logs -f'
