# 📖 **Milenio API**

Una API RESTful para gestionar libros. Permite realizar operaciones CRUD (Crear, Leer, Actualizar, Eliminar), además de funcionalidades avanzadas como filtrado.

---

## 👥 **Integrantes**
- **Francisco Merlino Dabove**  
  📧 [francisco_mer004@hotmail.com](mailto:francisco_mer004@hotmail.com)

- **Mateo Corsi**  
  📧 [mateocorsi@gmail.com](mailto:mateocorsi@gmail.com)

---

## 📄 **Documentación de los Endpoints**

### **1. Obtener todos los libros**
Obtiene una lista de todos los libros existentes en la base de datos.

- **Verbo HTTP:** `GET`  
- **Ejemplo de uso:**  
GET http://localhost/api/libros

### **2. Obtener un libro específico**
Accede a un libro utilizando su ID.

- **Verbo HTTP:** `GET`  
- **Ejemplo de uso:**  
GET http://localhost/api/libros/:id
📝 **Nota:** Reemplaza `:id` por el ID del libro deseado.

### **3. Agregar un nuevo libro**
Permite agregar un libro enviando los datos en formato JSON.

- **Verbo HTTP:** `POST`  
- **Body (JSON):**
{
  "titulo": "El nombre del viento",
  "autor": "Patrick Rothfuss",
  "reseña": "Una historia fascinante de magia y misterio.",
  "genero_id": 1
}
- **Ejemplo de uso:** 
POST http://localhost/api/libros

### **4. Eliminar un libro**
Elimina un libro existente mediante su ID.

- **Verbo HTTP:** `DELETE`  
- **Ejemplo de uso:**  
DELETE http://localhost/api/libros/:id
📝 **Nota:** Reemplaza `:id` por el ID del libro deseado.

---


## 🚀 **Funcionalidades Avanzadas**

### **1. Filtrar libros por género**
Obtén una lista de libros que pertenezcan a un género específico.

- **Verbo HTTP:** `GET`  
- **Ejemplo de uso:**  
  ```bash
  GET http://localhost/api/libros?genero_id=1

  ## ⚙️ **Configuración del Proyecto**

---

### **Archivos Principales**
- **`config.php`:** Configuración de conexión a la base de datos (host, usuario, contraseña, etc.).  
- **`router.php`:** Maneja las rutas y redirige las solicitudes al controlador correspondiente.

### **Controladores**
- **`LibroApiController.php`:** Controlador principal para manejar las solicitudes relacionadas con libros.  
- **`JWTAuthMiddleware.php`:** Middleware para autenticación mediante JWT.

### **Modelos**
- **`LibroModel.php`:** Modelo para interactuar con la base de datos.

### **Vistas**
- **`JSONView.php`:** Genera las respuestas en formato JSON.

---

## 🗄️ **Base de Datos**
### **Tablas principales:**
- `libros`  
- `generos`
