#!/bin/bash

set_source_list(){
    local sources_file="/etc/apt/sources.list"
    [ -f ${sources_file} ] && mv ${sources_file} ${sources_file}.bak
    echo "deb http://mirrors.163.com/ubuntu/ $(lsb_release -cs) main restricted universe multiverse" >${sources_file}
    echo "deb http://mirrors.163.com/ubuntu/ $(lsb_release -cs)-security main restricted universe multiverse" >>${sources_file}
    echo "deb http://mirrors.163.com/ubuntu/ $(lsb_release -cs)-updates main restricted universe multiverse" >>${sources_file}
    echo "deb http://mirrors.163.com/ubuntu/ $(lsb_release -cs)-proposed main restricted universe multiverse" >>${sources_file}
    echo "deb http://mirrors.163.com/ubuntu/ $(lsb_release -cs)-backports main restricted universe multiverse" >>${sources_file}
    echo "deb-src http://mirrors.163.com/ubuntu/ $(lsb_release -cs) main restricted universe multiverse" >>${sources_file}
    echo "deb-src http://mirrors.163.com/ubuntu/ $(lsb_release -cs)-security main restricted universe multiverse" >>${sources_file}
    echo "deb-src http://mirrors.163.com/ubuntu/ $(lsb_release -cs)-updates main restricted universe multiverse" >>${sources_file}
    echo "deb-src http://mirrors.163.com/ubuntu/ $(lsb_release -cs)-proposed main restricted universe multiverse" >>${sources_file}
    echo "deb-src http://mirrors.163.com/ubuntu/ $(lsb_release -cs)-backports main restricted universe multiverse" >>${sources_file}

}


install_docker(){
    apt-get remove docker docker-engine  docker.io
    apt-get install  apt-transport-https  ca-certificates  curl  software-properties-common  -y
    apt-get install linux-image-extra-$(uname -r) linux-image-extra-virtual  -y

    # addd gpg
    #curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    #add-apt-repository  "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

    echo "deb [arch=amd64] https://download.docker.com/linux/ubuntu zesty  stable" >>/etc/apt/sources.list
    apt-get update -y
    apt-get install docker-ce -y    # --allow-unauthenticated 
}






main(){
    #set_source_list
    #apt-get update -y
    #install_docker


}
main
