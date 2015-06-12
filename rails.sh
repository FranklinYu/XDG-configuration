# default to --simple-prompt (`~/.irbrc` is suppressed with `-f` option)
# see http://ruby-doc.com/docs/ProgrammingRuby/html/irb.html
echo 'IRB.conf[:PROMPT_MODE] = :SIMPLE' >> ~/.irbrc

# RSpec
if [ -f ~/.rspec ] ; then echo >> ~/.rspec ; fi
cat suggested/.rspec >> ~/.rspec
