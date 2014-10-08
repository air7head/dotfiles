PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

if [[ -d /usr/local/sbin ]];then
  PREPEND_PATH=/usr/local/sbin:${PREPEND_PATH}
fi

if [[ -d /usr/local/bin ]];then
  PREPEND_PATH=/usr/local/bin:${PREPEND_PATH}
fi

# for brew installed ruby path
if [[ -d /usr/local/opt/ruby/bin ]];then
  PREPEND_PATH=/usr/local/opt/ruby/bin:${PREPEND_PATH}
fi

#### For user's own bin directory, if present
if [[ -d ~/bin ]]; then
  PREPEND_PATH=~/bin:$PREPEND_PATH
fi

PATH=$PREPEND_PATH:$PATH
# Remove any instances of multiple colons:
PATH=${PATH/::/:}
# Remove leading : if present
PATH=${PATH#:}

# Export PATH as separate command to avoid dollar signs in export line
export PATH

# Avoid repeats in the path
typeset -U path

