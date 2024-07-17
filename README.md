# PASOS PARA LA EJECUCION DE LA PRUEBA TECNICA
### CREACION DE LA BASE DE DATOS
***
1. __Abrir SQL SERVER y ejecutar el script "PruebaBD" proporcionado en el repositorio del BACKEND.__
2. __Corroborar que la BD fue creada correctamente.__
### CONFIGURACION DEL BACKEND
3. __Abrir la solución del proyecto "Backend_PruebaTecnica" en Visual Studio 2022.__
4. __Ya abierto el proyecto, ingresar al archivo "appsettings.json"__
5. __Modificar la conexión con la bd en el archivo "appsettings.json" con sus respectivos DATOS.:__
    
 * "Server=DESKTOP--\\SQLEXPRESS;Database=WayniBD;User Id=sa;Password=sql; TrustServerCertificate=true;" 
6. __Ya modificada la conexión, ejecutar el proyecto. (De ser necesario probar los endpoint con el SWAGGER o POSTMAN)__
### Configuración del FRONTEND
7. Abrir el proyecto "frontend-prueba-tecnica" en VISUAL STUDIO CODE o el editor que desee.
8. Abrir el BASH de la terminal en el proyecto para la instalación de las librerias.
9. Realizar los siguientes comandos en el BASH:
  ```
    npm install typescript @types/react @types/react-dom --save-dev
    npm install react react-dom
    npm install @mui/material @emotion/react @emotion/styled
    npm install @mui/x-data-grid
    npm install sweetalert2
    npm install
```
    
10. Ya instaladas todas las librerias ejecutar el proyecto FrontEnd con el siguiente comando:
```
     npm start
```
11. Probar funcionalidad.

## Recomendaciones
 * Verificar los puertos tanto del backend y frontend.
* Verificar que los datos de la conexión con la BD coincidan con los suyos.



    
    
