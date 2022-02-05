if [[ -f ~/.profile ]]
then source ~/.profile
fi

if [[ $- == *i* ]] && [[ -f ~/.bashrc ]]
then source ~/.bashrc
fi
