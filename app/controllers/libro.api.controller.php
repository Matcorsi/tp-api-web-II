<?php
require_once './app/models/libro.model.php';
require_once './app/views/json.view.php';

class LibroApiController {
    private $model;
    private $view;

    public function __construct() {
        $this->model = new LibroModel();
        $this->view = new JSONView();
    }

    // /api/libros
    public function getAll($req, $res) {
        $generoNombre = isset($req->query->genero) ? $req->query->genero : null;

        if ($generoNombre) {
            $libros = $this->model->getLibrosPorGeneroNombre($generoNombre);
    
            if (empty($libros)) {
                return $this->view->response("No se encontraron libros para el género '$generoNombre'", 404);
            }
    
            return $this->view->response($libros);
        } else {
            $libros = $this->model->getLibros();
            return $this->view->response($libros);
        }
    }

    // /api/libros/:id
    public function get($req, $res) {
        $id = $req->params->id;

        $libro = $this->model->getLibro($id);

        if(!$libro) {
            return $this->view->response("El libro con el id=$id no existe", 404);
        }

        return $this->view->response($libro);
    }
    
    // api/libros (POST)
    public function create($req, $res) {

        if (!isset($req->body->titulo) || !isset($req->body->autor) || !isset($req->body->reseña) || !isset($req->body->genero_id)) {
            return $this->view->response('Faltan completar datos', 400);
        }

        $titulo = $req->body->titulo;       
        $autor = $req->body->autor;       
        $reseña = $req->body->reseña;       
        $genero_id = $req->body->genero_id;       

        $id = $this->model->insertLibro($titulo, $autor, $reseña , $genero_id);

        if (!$id) {
            return $this->view->response("Error al insertar el nuevo libro", 500);
        }

        $newLibro = $this->model->getLibro($id);
        return $this->view->response($newLibro, 201);
    }

    // api/libros/:id (DELETE)
    public function delete($req, $res) {
        $id = $req->params->id;

        $libro = $this->model->getLibro($id);

        if (!$libro) {
            return $this->view->response("El libro con el id=$id no existe", 404);
        }

        $this->model->eraseLibro($id);
        $this->view->response("El libro con el id=$id se eliminó con éxito");
    }


}
