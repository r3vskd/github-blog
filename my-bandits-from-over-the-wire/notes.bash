==========
|=level0=|
ssh bandit0@bandit.labs.overthewire.org -p2220
-> ls 
-> cat readme

==========
|=level1=|
ssh bandit1@bandit.labs.overthewire.org -p2220
-> ls
-> cat ./- or more -

==========
|=level2=|
ssh bandit2@bandit.labs.overthewire.org -p2220
-> ls
-> cat s [TAB]

==========
|=level3=|
ssh bandit3@bandit.labs.overthewire.org -p2220
-> ls
-> cd inhere
-> ls -la
[ a partir de este nivel en adelante hay que ir un poco mas aya cuando con list all para tener una visibilidad mas completa y ganar algo de tiempo ]
-> more .hidden

==========
|=level4=|
ssh bandit4@bandit.labs.overthewire.org -p2220
-> ls -la
-> cd inhere
-> file ./*
-> more ./-file07

==========
|=level5=|
ssh bandit5@bandit.labs.overthewire.org -p2220
-> ls -la
-> cd inhere
-> ls -la
-> find ./ -size 1033c
-> more {past response}

==========
|=level6=|
ssh bandit6@bandit.labs.overthewire.org -p2220
-> ls -la
-> cd / & ls
-> cd /home & ls
-> cd
-> find / -size 33c -user bandit7 -group bandit6
-> find / -size 33c -user bandit7 -group bandit6 grep 
-> man tail
-> find / -size 33c -user bandit7 -group bandit6 | tail[tail sirve para archivos o para stdin y primero filtra por archivos y en segundo lugar filtra por la ultima linea o linea mas corta siempre y cuando haya un archivo en el input que le demos]
-> more {ruta y archivo}

==========
|=level7=|
ssh bandit7@bandit.labs.overthewire.org -p2220
-> ls -la
-> more data.txt | grep millionth

==========
|=level8=|
ssh bandit8@bandit.labs.overthewire.org -p2220
-> ls -la
-> more data.txt | sort | uniq -u
[sort ordena junta las que son iguales por orden alfabetico y uniq solo, imprime las lineas que se repiten y -u las que solo ocurren una vez]

==========
|=level9=|
ssh bandit9@bandit.labs.overthewire.org -p2220
-> ls -la
->  strings data.txt | grep = | awk 'length>10' |  tr -cs '[:alnum:]' '[\n*]' | tail -n1
[strings para cadenas de texto
 awk 'length>10' solo mayores a 10 caracteres
 el tr filtra por alphanumericos nada mas
 el tail -n1 solo la ultima linea

 (fui probando de distindas formas en foros)

https://unix.stackexchange.com/questions/42898/find-any-lines-exceeding-a-certain-length

https://unix.stackexchange.com/questions/598387/select-lines-based-on-length

https://stackoverflow.com/questions/37328853/how-to-print-words-that-contain-only-letters

https://unix.stackexchange.com/questions/169746/how-to-print-only-certain-characters

https://stackoverflow.com/questions/28080743/bash-how-to-only-keep-specific-characters-from-a-string

https://www.google.com/search?q=only+print+letters+linux&ei=r6p6ZKP7FO-vqtsP4aKPoA8&ved=0ahUKEwjjjsj3i6b_AhXvl2oFHWHRA_QQ4dUDCA8&uact=5&oq=only+print+letters+linux&gs_lcp=Cgxnd3Mtd2l6LXNlcnAQAzIICCEQoAEQwwQyCAghEKABEMMESgQIQRgBUJgCWJgCYJMNaAFwAHgAgAGGAYgBhgGSAQMwLjGYAQCgAQHAAQE&sclient=gws-wiz-serp

]

===========
|=level10=|
ssh bandit10@bandit.labs.overthewire.org -p2220
-> ls -la
-> more data.txt | base64 -–decode

===========
|=level11=|
ssh bandit11@bandit.labs.overthewire.org -p2220
-> ls -la
-> more 
-> more data.txt | tr a-zA-Z n-za-mN-ZA-M
tr sirve para traducir (intercambiar o eliminar chars)
[ 1- a-z minusculas y A-Z mayuculas ubica letras a usar
  2- n-z minusculas rotadas 13 lugares respecto a-m
  3- N-Z mayusculas rotadas 13 lugares respecto A-M ]

ilustracion: abcdefghijklm
             |||||||||||||
             nopqrstuvwxyz

===========
|=level12=|
ssh bandit12@bandit.labs.overthewire.org -p2220
-> ls -la
-> more data.txt
-> mkdir /tmp/pavan
-> cp data.txt /tmp/pavan
-> cd /tmp/pavan
-> ls
-> file data.txt
-> xxd -r data.txt data1
-> file data1
-> mv data1 data2.gz
-> gzip -d data2.gz

[ La flag esta en un archivo hexadecimal (hexdump) y esta comprimido muchas veces, no podemos crear dirs en /home/bandit12, asi que creamos en /tmp/ y copiamos data en /tmp/{nombre_dir}, hacemos un file a data.txt y vemos que es ascii, por lo que podemos usar la herramienta xxd que es como base64 --decrypt pero para hexdumps, 
--------
lo que sigue es una tarea repetitiva y es simplemente comprimir y descomprimir cada archivo, hasta llegar a la flag

]

-> file data2
-> mv data2 data3.bz2
-> bzip2 -d data3.bz2
-> file data3
-> mv data3 data4.gz
-> gzip -d data4.gz
-> file data4
-> tar -xvf data4
-> file data5.bin
-> tar -xvf data5.bin
-> file data6.bin
-> mv data6.bin data7.bz2
-> bzip2 -d data7.bz2
-> file data7
-> tar -xvf data7
-> file data8.bin
-> mv data8.bin data9.gz
-> gzip -d data9.gz
-> file data9
-> less data9

===========
|=level13=|
ssh bandit13@bandit.labs.overthewire.org -p2220
-> ls -la
[ No tenemos flag, bueno si, pero esta representada digamos en forma de clave privada para acceder via ssh directamente, lo que quiere decir que no nos pedira password, nos logueara directamente ]
-> scp -P 2220 bandit13@bandit.labs.overthewire.org:sshkey.private .
[ scp sirve para copiar archivos desde servidores/conexiones ssh usando el servvicio openssh ]
-> ssh -i sshkey.private bandit14@bandit.labs.overthewire.org -p 2220
[ Una vez tengamos el archivo en nuestra pc, usamos la clave privada para loguearnos en bandit14 ]

[ si dice "Permissions 0640 for 'sshkey.private' are too open" hay que darle permisos: chmod 700 sshkey.private ]


===========
|=level14=|
ssh -i sshkey.private bandit14@bandit.labs.overthewire.org -p 2220
-> ls -la
-> more /etc/bandit_pass/bandit14
[ recordemos que previamente nos habian dicho que solo el usuario "bandit14" tenia acceso a leer: /etc/bandit_pass/bandit14 ]
-> nc localhost 30000
-> {flag que nos dio al leer /etc/bandit_pass/bandit14}

===========
|=level15=|
ssh bandit15@bandit.labs.overthewire.org -p2220
-> ls -la
[ Hay que conectarnos usando openssh, s_client es el usuario por defecto de SSL/TLS (simple client) -connect y le decimos que que nos queremos conectar con las credenciales que nos dan: localhoost:30001 ]
-> openssl s_client -connect localhost:30001
-> {flag del nivel anterior, como nos dice la instruccion}

===========
|=level16=|
ssh bandit16@bandit.labs.overthewire.org -p2220
-> ls -la
-> [ si nos hablan de rangos en puertos, en automatico debe venir a la mente nmap, es por excelencia la herramienta adecuada para eso ]
-> nmap -sV localhost -p 31000-32000
[ 31790/tcp open  ssl/unknown ----> todos los echo no funcionan, por lo que el unknown es sospechoso ]
-> openssl s_client -connect localhost:31790
-> ponemos la ultima flag que usamos {bandit16 flag}
-> copiamos y pegamos la clave RSA en un archivo sshkey.private
-> hay que salir a nuestra compu y crear un archivo y pegarlo ahi, pero se tiene que llamar sshkey{algo}private 
-> ssh -i sshkey17.private bandit14@bandit.labs.overthewire.org -p 2220
-> si nos dice que no tiene permisos de ejecucion a
   el archivo sshkey.private, ya sabemos:
   chmod 700 sshkey.private

===========
|=level17=|
ssh -i sshkey17.private bandit17@bandit.labs.overthewire.org -p 2220
-> ls -la
-> usamos diff para mostrar la diferencia entre los dos archivos
-> podemos usar grep para mostrar la flag
-> o podemos usar sort para mostrar la que ocurre solo una vez, como en el nivel 9.
-> sort passwords.old passwords.new | uniq -u
-> more passwords.new | grep glZreTEH1V3cGKL6g4conYqZqaEj0mte
-> more passwords.new | grep hga5tuuCLF6fFzUpnagiMN8ssu9LFrdg
-> ssh bandit18@bandit.labs.overthewire.org -p 2220 "cat ~/readme" 
-> hga5tuuCLF6fFzUpnagiMN8ssu9LFrdg

=========
ssh bandit18@bandit.labs.overthewire.org -p 2220

The password for the next level is stored in a file readme in the homedirectory. Unfortunately, someone has modified .bashrc to log you out when you log in with SSH.

-> ls -la
-> ssh -T bandit18@localhost

Once you enter this you will see a blank terminal and ther you enter

-> cat readme
-> ctrl + c
-> ssh bandit19@localhost

==============
ssh bandit19@bandit.labs.overthewire.org -p2220

To gain access to the next level, you should use the setuid binary in the homedirectory. Execute it without arguments to find out how to use it. The password for this level can be found in the usual place (/etc/bandit_pass), after you have used the setuid binary.

-> ls -la

-> ./bandit20-do

-> ./bandit20-do cat /etc/bandit_pass/bandit20

-> ssh bandit20@localhost

==============
ssh bandit20@bandit.labs.overthewire.org -p2220

There is a setuid binary in the homedirectory that does the following: it makes a connection to localhost on the port you specify as a commandline argument. It then reads a line of text from the connection and compares it to the password in the previous level (bandit20). If the password is correct, it will transmit the password for the next level (bandit21).

NOTE: Try connecting to your own network daemon to see if it works as you think

-> ls -la
-> ./suconnect
-> nc -lvp 4444
-> ./suconnect 4444
pegar la pass del nivel anterior

============
ssh bandit21@bandit.labs.overthewire.org -p2220

A program is running automatically at regular intervals from cron, the time-based job scheduler. Look in /etc/cron.d/ for the configuration and see what command is being executed.
-> ls -la
-> cd /etc/cron.d/
-> ls -la
-> cat cronjob_bandit22
-> Enter the below command
-> cat /usr/bin/cronjob_bandit22.sh
-> cat /tmp/t7O6lds9S0RqQh9aMcz6ShpAoZKF7fgv

==============
ssh bandit22@bandit.labs.overthewire.org -p2220

A program is running automatically at regular intervals from cron, the time-based job scheduler. Look in /etc/cron.d/ for the configuration and see what command is being executed.

-> ls -la
-> cd /etc/cron.d/
-> ls -la
-> cat cronjob_bandit23
-> cat /usr/bin/cronjob_bandit23.sh
-> /usr/bin/cronjob_bandit23.sh
-> echo I am user bandit23 | md5sum | cut -d ‘ ‘ -f 1
-> cat /tmp/8ca319486bfbbc3663ea0fbe81326349

==============
ssh bandit23@bandit.labs.overthewire.org -p2220

-> ls -la /etc/cron.d
-> cat /etc/cron.d/cronjob_bandit24
-> cat /usr/bin/cronjob_bandit24.sh
-> mktemp -d
-> cd /tmp/tmp.c0jGzjEtqq
-> nano pass.sh

==============
ssh bandit24@bandit.labs.overthewire.org -p2220


==============
ssh bandit25@bandit.labs.overthewire.org -p2220


==============
ssh bandit26@bandit.labs.overthewire.org -p2220


==============
ssh bandit27@bandit.labs.overthewire.org -p2220


==============
ssh bandit28@bandit.labs.overthewire.org -p2220


==============
ssh bandit29@bandit.labs.overthewire.org -p2220


==============
ssh bandit30@bandit.labs.overthewire.org -p2220


==============
ssh bandit31@bandit.labs.overthewire.org -p2220


==============
ssh bandit32@bandit.labs.overthewire.org -p2220


==============
ssh bandit33@bandit.labs.overthewire.org -p2220


==============
