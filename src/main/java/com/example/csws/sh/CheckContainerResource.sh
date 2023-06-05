#!/usr/bin/bash
. ~/sh/CSWSException.sh
CheckContainerResource()
{
    local hostName=$1
    local hostIp=$2 
    local container=$3

    ssh $hostName@$hostIp "mkdir -p ~/etc/info/con"
    ssh $hostName@$hostIp "touch ~/etc/info/con/$container.txt"

    ssh $hostName@$hostIp "docker stats $container --no-stream --format 'table {{.MemUsage}}' > ~/etc/info/con/$container.txt"
    ssh $hostName@$hostIp "echo ================================================================== >> ~/etc/info/con/$container.txt"
    ssh $hostName@$hostIp "echo "Disk Usage" >> ~/etc/info/con/$container.txt"
    ssh $hostName@$hostIp "docker ps --size --filter "name=$container" --format "{{.Size}}" >> ~/etc/info/con/$container.txt"
    ssh $hostName@$hostIp "echo ================================================================== >> ~/etc/info/con/$container.txt"
    ssh $hostName@$hostIp "docker stats $container --no-stream --format 'table {{.CPUPerc}}' >> ~/etc/info/con/$container.txt"


    # info ���丮�� �������� ������ ����
    if [ ! -d ~/info/con/$hostName ]; then
        mkdir -p ~/info/con/$hostName
    fi

    if [ -f ~/info/con/$hostName/$container.txt ]; then
        rm ~/info/con/$hostName/$container.txt
    fi

    scp $hostName@$hostIp:~/etc/info/con/$container.txt ~/info/con/$hostName/  
}

Start CheckContainerResource
CheckContainerResource $1 $2 $3 && CSWSSuccess CheckContainerResource || CSWSFailure CheckContainerResource