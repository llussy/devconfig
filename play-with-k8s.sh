#!/bin/bash

# play with kubernetes init (https://labs.play-with-k8s.com/)

# basic
yum install -y wget vim 

# fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
y | ~/.fzf/install

# helm
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod +x get_helm.sh 
export VERIFY_CHECKSUM=false && ./get_helm.sh

# kubens 
wget https://github.com/ahmetb/kubectx/releases/download/v0.9.5/kubens_v0.9.5_linux_x86_64.tar.gz
tar zxvf kubens_v0.9.5_linux_x86_64.tar.gz 
mv kubens /usr/local/bin/


# kube-ps1
wget https://raw.githubusercontent.com/jonmosco/kube-ps1/master/kube-ps1.sh

echo "source /root/kube-ps1.sh" >> ~/.bashrc
echo "PS1='[\u@\h \W \$(kube_ps1)]\$ '" >> ~/.bashrc
echo "export KUBE_PS1_SYMBOL_ENABLE=false" >> ~/.bashrc
echo "export KUBE_PS1_CONTEXT_ENABLE=false" >> ~/.bashrc
echo "export KUBE_PS1_PREFIX=''" >> ~/.bashrc
echo "export KUBE_PS1_SUFFIX=''" >> ~/.bashrc
source ~/.bashrc
