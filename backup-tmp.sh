#!/bin/bash

if [ "$UID" != "0"  ]; then
	echo "Apensa root pode rodar o backup"
	exit 1
fi

if [ ! -d "/tmp/backup" ] ; then
	echo "Criando a pasta de backup que não existe"
	mkdir /tmp/backup
fi
tar -czpvf /tmp/backup/etc.tar.gz /etc

if [ -f /tmp/backup/etc.tar.gz ]; then
	tar -tzf /tmp/backup/etc.tar.gz
	if [ $? != 0  ]; then
       		echo "A verificação de backup falhou"
       		exit 1
	fi
fi
echo "Backup concluído"
:
