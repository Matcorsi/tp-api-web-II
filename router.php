<?php
    require_once 'config.php';
    require_once 'libs/router.php';
    require_once 'app/controllers/libro.api.controller.php';
    require_once './app/middleware/jwt.auth.middleware.php';

    $router = new Router();

    $router->addMiddleware(new JWTAuthMiddleware());

    #                 endpoint        verbo      controller              metodo
    $router->addRoute('libros'      ,'GET',      'LibroApiController',   'getAll');
    $router->addRoute('libros/:id'  ,'GET',      'LibroApiController',   'get'   );
    $router->addRoute('libros'      ,'POST',     'LibroApiController',   'create');
    $router->addRoute('libros/:id'  ,'DELETE',   'LibroApiController',   'delete');
    
    $router->setDefaultRoute('ReviewsController', 'pageNotFound');

    $router->route($_GET['resource'], $_SERVER['REQUEST_METHOD']);

