#!/bin/bash










run_nexus(){
    nohup  /usr/local/lib/nexus-3.6.1-02/bin/nexus start  &

}


main(){

    run_nexus

}

main


while [ True ]  ; do

	sleep 999
	echo "i'm live"
done
