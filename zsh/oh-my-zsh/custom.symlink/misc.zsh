if [[ -o interactive ]]; then

  function _exit()        # function to run upon exit of shell
  {
    echo -e "[1;31mHasta la vista, baby![0m"
  }
  trap _exit 0
fi

cdpath=(. ~/src)
typeset -U cdpath

#  setopt NO_all_export
setopt    always_last_prompt # 
setopt    always_to_end      # Dont move to end of word after competion inside the word
setopt    append_history     # multiple sessions append history instead of replacing
setopt    auto_cd            # executable dir names
setopt    auto_continue      # stopped and disowned jobs are automatically sent a CONT signal
setopt    auto_list          # automatically list choices on an ambiguous completion
setopt    auto_menu          # auto use menu completion after the by pressing tab repeatedly
#  setopt NO_auto_name_dirs
setopt    auto_param_keys
setopt    auto_param_slash   # add slash at the end of completed params that are dirs
setopt    auto_pushd         # make cd push old dir to dir stack
setopt    auto_remove_slash  # remove slash if param completion is followed by delimiter
#  setopt NO_auto_resume
setopt    bad_pattern
setopt    bang_hist
setopt NO_beep               # no beeps
setopt    brace_ccl
#  setopt NO_bsd_echo
setopt    cdable_vars        # when argument to cd is not a dir, try to expand assuming its a var
setopt NO_chase_links        # Dont resolve symbolic links to their true value when changing dirs
setopt    check_jobs         # Check for running jobs before exiting shell
setopt NO_clobber            # Dont allow truncating and creating files with > and >> (must use >| and >>|)
#  setopt    complete_aliases
setopt    complete_in_word   # not just at the end of words
#  setopt NO_correct
setopt    correct_all        # Correct params as well as commands
#  setopt    csh_junkie_history
setopt NO_csh_junkie_loops
setopt NO_csh_junkie_quotes
setopt NO_csh_null_glob
#  setopt    equals
setopt    extended_glob
setopt    extended_history   # save beginning timestamp and duration for each command
setopt    function_argzero
setopt    glob               # Perform filename generation (globbing)
setopt NO_glob_assign        # Backwards compatible option - can lead to confusion
setopt    glob_complete      # If current word has a glob pattern don't insert matches, but cycle thru like MENU_COMPLETE
setopt    glob_dots          # Dont require a leading '.' in filename to be matched explicitly
setopt NO_glob_subst         # Glob using substituted characters (eg from parameter expansion)
setopt    hash_cmds          # hash paths for commands to speed up subsequent lookup
setopt    hash_dirs          # when a command is hashed, hash all dirs in its parent path
setopt    hash_list_all      # when attempting command completion, ensure its parent path is hashed first
setopt    hist_allow_clobber # Add | to redirects(> or >>) in the history
setopt NO_hist_beep          # Dont beep if history entry doesnt exist
setopt    hist_ignore_dups   # ignore duplicate entries (only checks previous event)
setopt  hist_ignore_all_dups # This would ignore all dups (not just the previous event)
setopt    hist_ignore_space  # remove command lines from history list when first char is a space
setopt    hist_no_functions  # remove function definitions from history
setopt    hist_no_store      # remove the history command fc -l
setopt    hist_reduce_blanks # remove superfluous blanks from each line before appending to history
setopt    hist_verify        # don't execute history expansion lines automatically, but load into editing buffer
setopt NO_hup                # don't kill processes when exiting
setopt    ignore_eof         # don't exit on end-of-file. Require 'exit' or 'logout' instead
setopt    inc_append_history # Add new lines incrementally instead of waiting for shell to exit
setopt    interactive_comments # allow comments even in interactive shell
setopt NO_list_ambiguous
setopt    list_packed        # compact completion lists
setopt    list_types         # show filetypes on completion lists
setopt    long_list_jobs     # list jobs in the long format by default
setopt    magic_equal_subst
setopt NO_mail_warning
setopt NO_mark_dirs
#  setopt NO_menu_complete
setopt    multios
setopt    nomatch
setopt    notify
setopt NO_null_glob
#  setopt    numeric_glob_sort
#  setopt NO_overstrike
setopt    path_dirs
setopt    posix_builtins
setopt NO_print_exit_value   # dont print exit value of programs with non-zero exit status
#  setopt NO_prompt_cr
#  setopt    prompt_subst
setopt    pushd_ignore_dups  # ignore duplicates in dir stack
setopt NO_pushd_minus
#  setopt    pushd_silent
setopt    pushd_to_home
setopt    rc_expand_param
setopt NO_rc_quotes
setopt    rec_exact
setopt NO_rm_star_silent     # prompt for confirmation for rm *
setopt    rm_star_wait       # wait 10 seconds when prompting for rm * (avoids reflexive 'yes')
setopt NO_sh_file_expansion
#  setopt    sh_option_letters
#  setopt NO_sh_word_split
setopt    share_history      # turns on inc_append_history and imports changes to history file
setopt    short_loops        # allow the short forms of for, repeat, select, if and function constructs
setopt NO_single_line_zle    # Don't use ksh emulating single line editing (as opposed to multiline)
setopt NO_sun_keyboard_hack
setopt    unset
setopt NO_verbose
#  setopt    zle
#

LESSOPEN='|/usr/local/bin/lesspipe.sh %s'; export LESSOPEN
export LESS="-MQiFXR"
export EDITOR="mvim -f"
export MAVEN_OPTS="-Xmx3052m -XX:MaxPermSize=512m"

function setjdk {
  local ver=${1?Usage: setjdk <version>}
  export JAVA_HOME=$(/usr/libexec/java_home -v $ver)
  PATH=$(echo $PATH | tr ':' '\n' | grep -v Java | tr '\n' ':')
  export PATH=$JAVA_HOME/bin:$PATH
}
function _setjdk_completion (){
  COMPREPLY=()

  local cur=${COMP_WORDS[COMP_CWORD]//\\\\/}
  local options=$(/usr/libexec/java_home -x | plutil -convert json -r -o - - | grep JVMVersion | sed 's/[^:]*[^"]*"\([^"]*\).*/\1/')
  COMPREPLY=($(compgen -W "${options}" ${cur}))
}
#complete -F _setjdk_completion -o filenames setjdk
export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.7.0_67.jdk/Contents/Home"
