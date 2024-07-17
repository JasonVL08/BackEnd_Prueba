----------------PASOS PARA LA EJECUCION DE LA PRUEBA TECNICA----------------------

                ---CREACION DE LA BASE DE DATOS---
  -Abrir SQL SERVER y ejecutar el script "PruebaBD" proporcionado en el repositorio del BACKEND
  -Corroborar que la BD fue creada correctamente.

                ----Configuracion del BACKEND----
  -Abrir la solución del proyecto "Backend_PruebaTecnica" en Visual Studio 2022.
  -Ya abierto el proyecto, ingresar al archivo "appsettings.json".
  -Modificar la conexión con la bd en el archivo "appsettings.json" : "Server=DESKTOP--\\SQLEXPRESS;Database=WayniBD;User Id=sa;Password=sql; TrustServerCertificate=true;" con sus respectivos DATOS.
  -Ya modificada la conexión, ejecutar el proyecto. (De ser necesario probar los endpoint con el SWAGGER o POSTMAN)

                ----Configuración del FRONTEND-----
  -abrir el proyecto "frontend-prueba-tecnica" en VISUAL STUDIO CODE o el editor que desee.
  -abrir el BASH de la terminal en el proyecto para la instalación de las librerias.
  -Realizar los siguientes comandos en el BASH:
    npm install typescript @types/react @types/react-dom --save-dev
    npm install react react-dom
    npm install @mui/material @emotion/react @emotion/styled
    npm install @mui/x-data-grid
    npm install sweetalert2
    npm install
  -Ya instaladas todas las librerias ejecutar el proyecto FrontEnd con el siguiente comando:
    npm start
  -Probar funcionalidad.


-------------Recomendaciones---------------
Verificar los puertos tanto del backend y frontend.
Verificar que los datos de la conexión con la BD coincidan con los suyos.



    
    
