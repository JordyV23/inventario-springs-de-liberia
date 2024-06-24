# Inventario Springs de Liberia

Este repositorio almancea el codigo para el sistema de inventario
springs de liberia.

---

## Pasos para instalar la base de datos

Para esta este desarrollo se utiliza Microsoft SQL Server, por lo que se adjuntas las instrucciones a seguir para instalar el respaldo de bases de datos.

1. Abrir MSSQL
2. Click en `File > Open > File` y buscar el respaldo mas reciente ubicado en el directorio `./dbBackups/` del respositorio
3. Click en `Execute`

**Nota** En el directorio `./dbBackups/` se encuentran archivos con diferentes nomenclaturas. El archivo que contiene el termino *"Clea"* hace referencia a una base de datos que cuenta con unicamente la estructura. Mientras que el archivo que tiene el termino *"Full"* cuenta con la estructura y datos de prueba. Esto para dar una idea de como lucen las tablas con informacion

---

## Pruebas con la API del Backend

Para probar el backend en el directorio `./postman` se encuentra las copias correspondientes a la documentacion de los *'endpoints'* de la API.

Para instalar la ultima copia de deben de seguir los siguientes pasos:

1. Abrir Postman
2. Ubicar en la esquina superior izquierda la instruccion `import` o `importar`
3. Seleccionar el archivo o arrastarlo al campo de archivos
4. Click en aceptar
5. La coleccion deberia de estar importada de manera exitosa

**Nota:** En caso de existir la misma coleccion con el mismo nombre se desplegará en postman un cuadro de texto con la instruccion de reemplazar la coleccion o importarla como una copia.

---

## Pasos para levantar el Backend

A continuaciuon se muestran los pasos a seguir junto a los comandos a ejectuar

1. Entrar a la carptea denominada 'backend'
  `cd ./backend/`
2. Instalar las dependencias necesarias del proyecto
  `npm i` o `npm install`
3. Crea una copia del archivo `.env.example` y llenar cada uno de las variables de entorno con los datos necesarios.

4. Instalar la copia mas reciente, disponible de la base de datos, las copias o respaldos se encuentran en la ruta `./dbBackups/`

5. Una vez hecho todo lo anterior, el proyecto se puede iniciar con el siguiente comando.
  `npm run dev`

  **Nota 1:** Para ejecutar el comando que levanta el proyecto del backend, se debe de estar en el directorio `./backend/` y haber seguido **TODOS** los pasos anteriores.

  **Nota 2:** En el directorio `./dbBackups/ProcedimientosAlmacenados/` se encuentran las copias actualizadas de **TODOS** los procedimientos almacenados dentro de la base de datos. Se debe de comparar si todos estos existen en el respaldo de la base de datos instalada. Esto debido que son de vital importancia para el correcto funcionamiento del sistema

---

## Pasos para levantar el Frontend

*Proximamente...*
