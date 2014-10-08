#!/bin/sh

cd "$(dirname "$0")"

echo "  Installing IntelliJ Colors"
if [ -d ~/Library/Preferences/IntelliJIdea12/colors ]; then
  find . -name \*.icls -exec cp {} ~/Library/Preferences/IntelliJIdea12/colors \;
  ln -s "`PWD`"/settings.xml ~/Library/Preferences/IntelliJIdea12/settings.xml \;
fi
if [ -d ~/Library/Preferences/IntelliJIdea13/colors ]; then
  find . -name \*.icls -exec cp {} ~/Library/Preferences/IntelliJIdea13/colors \;
  ln -s "`PWD`"/settings.xml ~/Library/Preferences/IntelliJIdea13/settings.xml \;
fi

