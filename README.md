# Docker php 8.2 , laravel 9

## DOCKER-COMPOSE:

image: Es la imagen oficial base que utilizaremos para crear nuestro contenedor, puedes consultar las imágenes disponibles aquí. 

container_name: Es el nombre que le daremos al contenedor

ports: Para poder interactuar con el contenedor es necesario enlacer el puerto de nuestro equipo (host) al puerto del contenedor, ejemplo; 
porthost:portcontainer.

volumes: Los volúmenes permiten cargar una carpeta o archivos de nuestro equipo (host) al contenedor. Esto es muy útil ya que cada que estemos 
guardando nuestros cambios, estos también se actualizarán dentro del contenedor. Más adelante crearemos el archivo de configuración de nginx 
que estamos montando aquí.

depends_on: El contenedor no se ejecutará hasta que se hayan levantado los servicios especificados.

networks: Creamos una red mediante la cual los servicios se comunicarán entre sí.

environment: Especificamos las variables necesarias para levantar el contenedor de mysql.

volumes: En este caso le decimos a Docker que utilice el volumen dbdata para almacenar la base de datos. Dichos volúmenes son manejados por Docker y nosotros no tenemos acceso a ellos, si queremos ver esos datos podemos montar una carpeta de nuestra computadora.

Si en el archivo Dockerfile utilizamos  argumentos;(en este caso user y uid), aca se le asigna un valor.

args: Argumentos que se toman al momento de crear el build del contenedor.

context: Contexto desde el cual se realiza el build.

dockerfile: Se pueden crear múltiples archivos Dockerfile para diferentes servicios y en este apartado se le dice cual es la ruta donde 
encontrara dicho archivo, en este caso es el Dockerfile que creamos anteriormente y será utilizado para crear la imagen del servicio app.

working_dir: Carpeta en la cual se trabajará dentro del contenedor.

volumes: Cargamos todo nuestro proyecto a la ruta /var/www/html dentro del contenedor.


## Para levantar bash de php
```bash
docker-compose exec -it -u root:root app bash
```
## Para errores de permisos en carpeta storage

```bash
chmod 777 -R storage/
```