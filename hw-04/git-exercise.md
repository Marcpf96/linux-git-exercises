Parte II: Ejercicios Git

1. Crea un nuevo proyecto e inicializa git

git init

2. Añade una regla para ignorar los ficheros de tipo .sh 

touch .gitignore
echo '*.sh' >> .gitignore

3. Crea dos ficheros vacíos: demo1.txt y demo2.txt. Añade estos ficheros al stage 
area.

touch demo1.txt 
touch demo2.txt
git add demo1.txt
git add demo2.txt

4. Añade contenido al fichero demo1.txt. A continuación, realiza un commit con el 
mensaje “Modified demo1.txt” 

echo 'contenido' >> demo1.txt
git commit -m "Modified demo1.txt"

Despues de usar este comando pide identificarnos

git config --global user.email "marc.peligros@salle.url.edu"
git config --global user.name "Marcpf96"

Se repite comando 
git commit -m "Modified demo1.txt"

5. Añade contenido al fichero demo2. A continuación, realiza un commit con el 
mensaje “Modified demo3.txt” 

echo 'contenido' >> demo2.txt

git add demo2.txt

git commit -m "Modified demo3.txt"

6. Rectifica el commit anterior con el mensaje “Modified demo2.txt” 

git commit --amend -m "Modified demo2.txt"

7. Crea una nueva rama “develop” y añade un fichero script.sh que imprima por 
pantalla “Git 101” 

git branch develop
git checkout develop
touch script.sh
echo '#!/bin/bash' >> script.sh
echo 'echo "Git 101"' >> script.sh

git add script.sh

No deja añadirlo porque se creó un .gitignore, se decide no forzar

8. Da permisos de ejecución al script

chmod +x script.sh

9. Realiza un merge (develop -> master) para integrar los cambios

git checkout master

git merge develop
Devuelve un already up to date debido a que no se ha añadido nada.

10. Sube todos los cambios a tu repositorio remoto

git branch -M main (lo pide github)
git remote add origin https://github.com/Marcpf96/linux-git-exercises.git

git push --all origin
(pide email y contraseña)

Falla, se va a la pagina de github y se ve que se requiere solicitar un token y no usar contraseña, se crea token y se introduce en vez de contraseña y funciona.

git log --oneline > verification.log

También se decide subir haciendo un commit y push.



