RedBubble Code Challenge
========================

## Installation Instruction

    git clone https://github.com/davelooi/redbubble.git
    cd redbubble
    bundle install

## RSpec Instruction

    bundle exec rake test

## Execute Simulations

    bundle exec rake[input_xml,output_dir]

    example:
    bundle exec rake[~/temp/works.xml, ~/temp/html]

## Note

    Make sure the output_dir is writable and empty
    Generated html will overwrite existing files
