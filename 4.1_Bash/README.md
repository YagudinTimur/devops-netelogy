
------

## Задание 1

Есть скрипт:
```bash
a=1
b=2
c=a+b
d=$a+$b
e=$(($a+$b))
```

Какие значения переменным c,d,e будут присвоены? Почему?

c = a + b потому что мы складываем 2 строки без указания, что это переменные

d = 1+2 - мы сложили 2 переменные, но не задекларировали, что d - это integer и нужно провести арифмитическую операцию 

e = 3 = потому что выполнили арифметическую операцию с использованием двойных круглых скобок

----

## Задание 2

На нашем локальном сервере упал сервис и мы написали скрипт, который постоянно проверяет его доступность, записывая дату проверок до тех пор, пока сервис не станет доступным (после чего скрипт должен завершиться). В скрипте допущена ошибка, из-за которой выполнение не может завершиться, при этом место на Жёстком Диске постоянно уменьшается. Что необходимо сделать, чтобы его исправить:
```bash
while ((1==1)
do
	curl https://localhost:4757
	if (($? != 0))
	then
		date >> curl.log
	fi
done
```

### Ваш скрипт:
```bash
#!/usr/bin/env bash
   rm ./curl.log
while ((1==1))
do
        curl http://localhost
        if (($? != 0))     
        then       
	date >> ./curl.log              
        else     
                break               
        fi       
        sleep 5       
done
```
Добавил 

   удаление страрога файла curl.log
   
   добавил else когда код выхода curl равен 0, что бы цикл завершался
   
   добавил sleep 5, что бы не так сильно забивать жесктий диск

Проверка:

![image](https://user-images.githubusercontent.com/42189764/208249425-be135448-1bde-4672-96c3-f40e546795e9.png)

Во время работающего скрипта в другой сессии терминала запустил веб-сервер, скрипт завершился
---

## Задание 3

Необходимо написать скрипт, который проверяет доступность трёх IP: `192.168.0.1`, `173.194.222.113`, `87.250.250.242` по `80` порту и записывает результат в файл `log`. Проверять доступность необходимо пять раз для каждого узла.

### Ваш скрипт:
```bash
#!/usr/bin/env bash
rm ./curl.log
host=(192.168.0.1 173.194.222.113 87.250.250.242 )
for a in ${host[@]}
do
        for (( i=0; i < 5; i++ ))      
        do        
                curl --connect-timeout 2 http://$a                
                echo $a $i >> curl.log               
        done
done
```
Проверка 



---
![image](https://user-images.githubusercontent.com/42189764/208253748-65f4f01e-2bc4-4edc-803c-5dd2db5ccdce.png)
## Задание 4

Необходимо дописать скрипт из предыдущего задания так, чтобы он выполнялся до тех пор, пока один из узлов не окажется недоступным. Если любой из узлов недоступен - IP этого узла пишется в файл error, скрипт прерывается.

### Ваш скрипт:
```bash
#!/usr/bin/env bash

rm ./curl.log
host=(173.194.222.113 192.168.0.1 87.250.250.242 )
for a in ${host[@]}
do
        for (( i=0; i < 5; i++ ))     
        do     
                echo $a $i >> curl.log              
                curl --connect-timeout 2 http://$a
        done    
      if (( $? != 0))
        then  
          break     
      fi   
done
```
![image](https://user-images.githubusercontent.com/42189764/208254107-5f160a06-12ff-4c40-a4e2-adbe9f4aa3ee.png)

![image](https://user-images.githubusercontent.com/42189764/208254122-34f59d1b-28b6-430a-82bc-ab2a3d7dfb66.png)
----