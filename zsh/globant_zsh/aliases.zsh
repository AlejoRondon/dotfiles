alias -g adk2224=dev/ADKTOOLS-2224/arondon/upload_general_documentation
alias -g adk2213=dev/ADKTOOLS-2213/arondon/shield_schema_rust_crate
# empty
alias -g shield_agent_dir=~/repositories/shield-agent
alias -g shield_iliad_dir=~/repositories/shield-iliad
alias -g shield_wasm_dir=~/repositories/shield-wasm
alias -g repositories_dir=~/repositories

alias cdsa="cd shield_agent_dir"
alias cdsi="cd shield_iliad_dir"
alias cdsw="cd shield_wasm_dir"
alias repos="cd repositories_dir"
alias opensa="code shield_agent_dir"
alias opensi="code shield_iliad_dir"
alias opensw="code shield_wasm_dir"
alias -g main_branch="git remote show origin | sed -n '/HEAD branch/s/.*: //p'"

function gcadk() {   #git commit message / adktools
  BRANCH_NAME=$(git rev-parse --abbrev-ref HEAD)
  TICKET_CODE="$(cut -d'/' -f2 <<<$BRANCH_NAME)"
  git commit -m "$TICKET_CODE: $1"
}