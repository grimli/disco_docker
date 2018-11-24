FROM debian

# tell the port number the container should expose

# prepare environment
run echo "deb http://ftp.debian.org/debian testing main" >> /etc/apt/sources.list.d/backports.list
run echo 'Package: *' >> /etc/apt/preferences.d/policy_erlang
run echo Pin: release o=Debian,a=testing >> /etc/apt/preferences.d/policy_erlang
run echo Pin-Priority: 100 >> /etc/apt/preferences.d/policy_erlang
run echo  >> /etc/apt/preferences.d/policy_erlang
run echo Package: erlang >> /etc/apt/preferences.d/policy_erlang
run echo Pin: release o=Debian,a=testing >> /etc/apt/preferences.d/policy_erlang
run echo Pin-Priority: 900 >> /etc/apt/preferences.d/policy_erlang
run apt-get update 
run apt -y upgrade
run apt-get -y install apt-utils
run apt -y install python3
run apt -y install vim
run apt -y install git
run apt -y install make
run apt -y install rebar

# install disco
run mkdir /opt/disco
run git clone git://github.com/discoproject/disco.git /opt/disco
run cd /opt/disco; make
