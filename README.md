<h2 align="center">Database Status</h3>

---

<p align="center"> En este proyecto se intena desplegar una aplicación con varios servicios asociados, mediante el uso de las herramientas Docker y Terraform.
    
</p>

## 📝 Table of Contents

- [Getting Started](#getting_started)
- [Running Tests](#tests)
- [Built Using](#built_using)
- [Author](#author)

## 🧐 About <a name = "about"></a>

Este proyecto consta de una aplicación web, hecha con node.js y express.js; de una base de datos, hecha con postgres; de una cache, hecha con redis; de un balanceador de carga, hecho con haproxy; de un sistema de monitorización, hecho con Prometheus, Grafana y Node-Exporter; de un almacenamiento compartido, hecho con nginx.

## 🏁 Getting Started <a name = "getting_started"></a>

Hay que seguir las siguientes instrucciones para desplegar un entorno adecuado para la ejecución de este proyecto.

### Requisitos

Es necesario tener instalado Visual Studio Code, Docker, Docker Desktop y Terraform.

Para instalar Terraform y Docker, se puede introducir los siguientes comandos en la terminal WSL de VSC.

```
apt install docker
```
```
apt install terraform
```

### Despliegue del Entorno de Trabajo

* Descargar o clonar el repositorio de Github
* Abrir una terminal en WSL de Visual Studio Code
* Insertar los siguientes comandos para inicializar los contenedores y servicios.
```
terraform init
```
```
terraform apply
```

Ahora los contenedores y los servicios estan levantados, para acceder a la app y poder ver los datos mostrados por la app hay que acceder a la siguiente dirección:

```
http://localhost:80
```
En la web aparecen los datos de la base de datos y de la cache (en modo producción), además de visualizarse que isntancia de la app se esta usando, ya que en modo producción estan desplegadas 3 instancias de la app.

Para eliminar los contenedores y bajar los servicios, simplemente hay que ejecutar el siguiente comando:
```
terraform destroy
```

## 🔧 Ejecución de los Tests <a name = "tests"></a>


### Monitorización Activa de la Aplicación

Para comprobar que hay monitorización activa, simplemente tenemos que acceder a la dirección donde se encuentra Grafana (localhost:4000) o Prometheus (localhost:9090). 

En Prometheus podemos ejecutar alguna query, como por ejemplo "node_cpu_seconds_total", y veremos las métricas resultantes a esa query.

![Prometheus](/Exec-Terraform-Docker/images/prom.PNG)

La ingesta de logs en Grafana todavia no está implementada, aunque se puede acceder al portal de Grafana.
### Correcto Funcionamiento del Balanceador de Carga

Para comprobar que el balanceador de carga dirige el tráfico como debe ser, podemos acceder a la dirección del balanceador (localhost:80) y fijarnos en la instancia de la app que nos muestra

![Instancia 1](/Exec-Terraform-Docker/images/ins1.PNG)

Si despues volvemos a acceder a la dirección del balanceador a través de otra pestaña, veremos como la instancia de la app ha cambiado.

![Instancia 2](/Exec-Terraform-Docker/images/ins2.PNG)

### Correcto Funcionamiento del Almacenamiento de Archivos Estáticos

Para comprobar que el almacenamiento compartido de archivos estáticos funciona correctamente, podemos mirar en la herramienta Docker Desktop los archivos de los contenedores, en los contenedores que tengamos configurado que se puedan comaprtir los archivos se vera algo tal que asi:

![Archivo Estatico](/Exec-Terraform-Docker/images/static.PNG)

El proyecto esta configurado de tal forma que solo la app pueda acceder a estos archivos, en este caso se comparte un favicon.ico para que se muestre en la pestaña del navegador de la app.

![Icono](/Exec-Terraform-Docker/images/icon.PNG)

En caso de que se quiera que algun otro servicio pueda acceder a estos archivos, hay que añadir el siguiente fragmento de codigo en la definición del contenedor:

```
mounts {
    target = "/app/shared_files"   # Ruta dentro de tu contenedor de aplicación
    source = var.shared_name       # Nombre del volumen definido anteriormente
    type   = "volume"
  }
```

Además, tambien hay que añadir el siguiente fragmento de código en el main.tf:

```
shared_name = docker_volume.shared_volume.name
```
Nota: Hay que tener en cuenta que tambíen habra que declarar la variable shared_name en el archivo variables.tf del modulo correspondiente.

## ⛏️ Built Using <a name = "built_using"></a>

- [PostgresSQL](https://www.postgresql.or) - Database
- [Express](https://expressjs.com/) - Server Framework
- [Redis](https://redis.io/) - Cache Database
- [NodeJs](https://nodejs.org/en/) - Server Environment
- [Docker](https://www.docker.com/) - Containers
- [Terraform](https://www.terraform.io/) - IaC
- [Prometheus](https://prometheus.io/) - Metrics Visualizer
- [Grafana](https://grafana.com/) - Logs Visualizer


## ✍️ Author <a name = "authors"></a>

- [@VictorC02](https://github.com/VictorC02) 

