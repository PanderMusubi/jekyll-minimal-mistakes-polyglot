set -e
if ! dpkg -s ruby-dev >/dev/null 2>&1; then
    sudo apt-get update
    sudo apt-get -y install ruby-dev
fi
bundle config set --local path 'vendor/bundle'
bundle install

