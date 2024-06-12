# faff with keys
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
command curl -sSL https://rvm.io/mpapis.asc | sudo gpg --import -    command curl -sSL https://rvm.io/pkuczynski.asc | sudo gpg --import -
# rvm
curl -sSL https://get.rvm.io | sudo bash -s stable