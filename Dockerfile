#Empezamos especificando la imagen de PHP:8.2-fpm, la cual se encuentra en los repositorios de hub.docker.com.
FROM php:8.2-fpm
#OPCIONAL:Agregamos argumentos los cuales más adelante definiremos en el archivo docker-compose.yml
ARG user
ARG uid 

#Instalamos las dependencias y extensiones necesarias para que funcione Laravel
RUN apt-get update && apt-get install -y \
   git \
   curl \
   libpng-dev \
   libonig-dev \
   libxml2-dev \
   zip \
   unzip

RUN apt-get clean && rm -rf /var/lib/apt/lists/*
 
RUN docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd  

#Instalamos composer (a partir de otra imagen) y node para poder ejecutar comandos de artisan y npm dentro del contenedor
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer
 
RUN curl -fsSL https://deb.nodesource.com/setup_15.x | bash -
RUN apt-get install -y nodejs 

#Damos permisos de ejecución a la carpeta HOME
RUN chmod +x /home 


 
#Creamos los usuarios de sistema que podrán ejecutar comandos de Compose y Artisan
RUN useradd -G www-data,root -u $uid -d /home/$user $user
RUN mkdir -p /home/$user/.composer && \
   chown -R $user:$user /home/$user 

#Especificamos la carpeta de trabajo y el usuario creado
WORKDIR /var/www/base-laravel9
USER $user 