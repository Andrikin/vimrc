#!/bin/bash

if [ -s /home/andre/.vim/log_java.txt ]
then
	echo "Arquivo não está vazio![Tamanho maior que 0kb]" > /home/andre/.vim/log_java.txt
else
	echo "Compilação encerrada com sucesso!" > /home/andre/.vim/log_java.txt
fi;
