<?php

class LibroModel {
    private $db;

    public function __construct() {
        // Accede a las constantes de clase globalmente con la palabra `self::`
        $this->db = new PDO(
            "mysql:host=" . MYSQL_HOST . ";dbname=" . MYSQL_DB . ";charset=utf8", 
            MYSQL_USER, 
            MYSQL_PASS
        );
    }
    

    public function getLibros() {
        $query = $this->db->prepare('
            SELECT libros.*, generos.nombre AS genero_nombre, generos.descripcion AS genero_descripcion 
            FROM libros
            JOIN generos ON libros.genero_id = generos.id
        ');
        $query->execute();

        $libros = $query->fetchAll(PDO::FETCH_OBJ); 

        return $libros;
    }
    
 
    public function getLibro($id) {
        $query = $this->db->prepare('
            SELECT libros.*, generos.nombre AS genero_nombre 
            FROM libros 
            LEFT JOIN generos ON libros.genero_id = generos.id 
            WHERE libros.id = ?
        ');
        $query->execute([$id]);
    
        $libro = $query->fetch(PDO::FETCH_OBJ);
    
        return $libro;
    }
    

    public function insertLibro($titulo, $autor, $reseña, $genero_id) { 
        $query = $this->db->prepare('
            INSERT INTO libros(titulo, autor, reseña, genero_id) 
            VALUES (?, ?, ?, ?)
        ');
        $query->execute([$titulo, $autor, $reseña, $genero_id]);
    
        $id = $this->db->lastInsertId();
    
        return $id;
    }
 
    public function eraseLibro($id) {
        $query = $this->db->prepare('DELETE FROM libros WHERE id = ?');
        $query->execute([$id]);
    }

    public function editLibro($id, $titulo, $autor, $reseña, $genero_id) {
        $query = $this->db->prepare('
            UPDATE libros 
            SET titulo = ?, autor = ?, reseña = ?, genero_id = ? 
            WHERE id = ?
        ');
        $query->execute([$titulo, $autor, $reseña, $genero_id, $id]);
    }

    public function getLibrosPorGeneroNombre($generoNombre) {
        $query = $this->db->prepare('
            SELECT libros.*, generos.nombre AS genero_nombre, generos.descripcion AS genero_descripcion
            FROM libros
            JOIN generos ON libros.genero_id = generos.id
            WHERE generos.nombre = ?
        ');
        $query->execute([$generoNombre]);
    
        return $query->fetchAll(PDO::FETCH_OBJ); 
    }
    
}
