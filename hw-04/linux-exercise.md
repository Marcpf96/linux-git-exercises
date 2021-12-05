Parte I: Ejercicios Linux

curl -o nginx_logs_examples.log  
https://raw.githubusercontent.com/elastic/examples/master/Common%20Data%20Formats/nginx_logs
/nginx_logs

Una vez ejecutado este comando disponemos de el log en el linux.

sed 's/-/ /' nginx_logs_examples.log | awk '{print $1}'  |sort -t. -k1,1 -k2,2 -k3,3 -k4,4 | uniq -c >> nginx-requests_total.txt

Con este comando se consigue el resultado deseado, ordenando por la primera columna y contando sus coincidencias, se hace un sed (split) para solo mostrar la primera columna, cosa que se consigue con el awk, sort para ordenar y uniq -c para el contador.

Se puede ver el .txt en el directorio principal del repositio

2. Crea un script que cumpla con los siguientes requisitos:

Comprueba la existencia del siguiente directorio: 
 
/backup/<student_name>/<year>/<month>/<day> 
 
Si no existe el directorio, se deberá crear. Este directorio contendrá una copia del fichero 
de logs del ejercicio anterior siguiendo el siguiente formato: 
 
nginx_log_requests_<date>.log donde la fecha vendrá definida como YYYYMMDD (año-
mes-día). 
 
Por ejemplo: 
 
nginx_log_requests_20210125.log 
 
Si la fecha de ejecución del script se realiza el último día de la semana, además del 
cumplir el requisito anterior, se deberá guardar en un fichero comprimido tar.gz el 
resultado de las ejecuciones de todos los días de la semana (solo la semana vigente). 
 
Ejemplo: 
 
nginx_logs_20210131.tar.gz 
 
- nginx_log_requests_20210125.log 
- nginx_log_requests_20210126.log 
- nginx_log_requests_20210127.log 
- nginx_log_requests_20210128.log 
- nginx_log_requests_20210129.log 
- nginx_log_requests_20210130.log 
- nginx_log_requests_20210131.log 

Ver script.sh

Se utiliza un mkdir para crear de forma recursiva todos los directorios en caso de no existir hasta llegar al ultimo directorio, el del dia.

Se copia el txt del directorio raiz hasta la carpeta donde tocaria guardar el backup, cambiandole el formato de txt a log y renombrando reutilizando la función date que nos devuelve el año mes y dia.

Se comprueba si el dia de la semana es 7, si es así, se hace una copia de todos los logs de los ultimos 7 dias añadiendo a date 'X days ago', una vez con todos los logs en la carpeta del domingo se hace un tar -czvf con todos ellos para lograr el resultado deseado.

No lo he incluído pero podría haber borrado todos los logs haciendo un rm de los 6 ficheros.

3. Utilizando  el  script  del  ejercicio  anterior,  crea  un  crontab  con  los  siguientes 
requerimientos: 
 
• El script se deberá ejecutar exclusivamente de lunes a domingo 
• La hora de ejecución será 23.59 hrs 
• Todos los meses del año 

apt-get install cron

crontab -e

Se añade la siguiente linea

59 23 * * * /script.sh > output.txt

service cron start

Digno de mención que crontab actuará desde el directorio home del usuario, en caso de root desde /root el resultado en este caso del output.txt estará localizado ahí.



