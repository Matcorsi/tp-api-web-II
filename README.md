**Milenio API**

**Integrantes:**
- **Francisco Merlino Dabove**
  [francisco_mer004@hotmail.com](mailto:francisco_mer004@hotmail.com)
- **Mateo Corsi**
  [mateocorsi@gmail.com](mailto:mateocorsi@gmail.com)

**Documentación de los Endpoints:**

**Obtener todos los libros**
Obtiene una lista de todos los libros existentes en la base de datos.
Verbo HTTP: GET
Ejemplo de uso: GET http://localhost/api/libros

**Obtener un libro específico**
Accede a un libro utilizando su ID.
Verbo HTTP: GET
Ejemplo de uso: GET http://localhost/api/libros/:id
Nota: Reemplaza :id por el ID del libro deseado.

**Agregar un nuevo libro**
Permite agregar un libro enviando los datos en formato JSON.
Verbo HTTP: POST
Body (JSON):
{
  "titulo": "El nombre del viento",
  "autor": "Patrick Rothfuss",
  "reseña": "Una historia fascinante de magia y misterio.",
  "genero_id": 1
}
Ejemplo de uso: POST http://localhost/api/libros

**Eliminar un libro**
Elimina un libro existente mediante su ID.
Verbo HTTP: DELETE
Ejemplo de uso: DELETE http://localhost/api/libros/:id
Nota: Reemplaza :id por el ID del libro que deseas eliminar.

**Editar un libro existente**
Actualiza los datos de un libro enviando la información en formato JSON y especificando el ID.

Verbo HTTP: PUT
Body (JSON):
{
  "titulo": "El temor de un hombre sabio",
  "autor": "Patrick Rothfuss",
  "reseña": "Segunda parte de la fascinante trilogía.",
  "genero_id": 1
}
Ejemplo de uso: PUT http://localhost/api/libros/:id
Nota: Reemplaza :id por el ID del libro que deseas modificar.

**Funcionalidades avanzadas:**

**Filtrar libros por género**
Obtén una lista de libros que pertenezcan a un género específico.
Verbo HTTP: GET
Ejemplo de uso: GET http://localhost/api/libros?genero_id=1
Nota: Reemplaza 1 por el ID del género deseado.

**Parámetros opcionales:**
pagina: Número de la página (por defecto 1).
limite: Número máximo de libros por página.
Ejemplo de uso: GET http://localhost/api/libros?pagina=1&limite=10


**Configuración del proyecto:**

**Archivos principales:**

**config.php**
Contiene la configuración de conexión a la base de datos (host, usuario, contraseña, etc.).

**router.php**
Maneja las rutas y redirige las solicitudes al controlador correspondiente.

**Controladores:**

**LibroApiController.php:** Controlador principal para manejar las solicitudes relacionadas con libros.
**JWTAuthMiddleware.php:** Middleware para autenticación mediante JWT.

**Modelos:**
**LibroModel.php:** Modelo para interactuar con la base de datos.

**Vistas:**
**JSONView.php:** Genera las respuestas en formato JSON.

**Base de datos:**
**Tablas principales:**
libros
generos