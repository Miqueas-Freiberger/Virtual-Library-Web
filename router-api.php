<?php
include_once ('libs/Router.php');
include_once ('api/api.admin.controller.php');
include_once ('api/api.user.controller.php');

$router = new Router();

$router->addRoute('comentarios','POST','ApiUserController','insertComent');
$router->addRoute('comentarios','GET','ApiUserController','getAll');
$router->addRoute('comentarios/:ID','DELETE', 'ApiAdminController','deleteComent');

$router->addRoute('comentarios/:PUNTAJE', 'GET', 'ApiUserController', 'getCommentsByOrder'); 


$resource = $_GET['resource'];
$method = $_SERVER['REQUEST_METHOD'];
$router->route($resource, $method);