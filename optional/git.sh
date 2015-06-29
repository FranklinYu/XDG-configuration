# add username and email (use yours, of course)
git config --global user.name 'Franklin Yu'
git config --global user.email franklinyu@hotmail.com

# create SSH pairs (need to add the public key to the online accounts)
ssh-keygen -b 2048 -t rsa -f ~/.ssh/id_rsa -q -N '' -C franklinyu@hotmail.com
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa
