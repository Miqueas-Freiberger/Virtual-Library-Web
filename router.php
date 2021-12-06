<?php
require_once 'controllers/controller.php';
require_once 'controllers/admin.controller.php';
require_once 'controllers/user.controller.php';

// defino la base url para la construccion de links con urls semánticas
define('BASE_URL', '//' . $_SERVER['SERVER_NAME'] . ':' . $_SERVER['SERVER_PORT'] . dirname($_SERVER['PHP_SELF']) . '/');


if (!empty($_GET['action'])) {
    $action = $_GET['action'];
} else {
    $action = 'home';
}

$params = explode('/', $action);

switch ($params[0]) {
    case 'verify':
        $userController = new UserController();
        $userController->login();
        break;
    case 'login':
        $userController = new UserController();
        $userController->showLogin();
        break;
    case 'register':
        $userController = new UserController();
        $userController->register();
        break;
    case 'registerForm':
        $userController = new UserController();
        $userController->showRegister();
        break;
    case 'home':
        $controller = new booksController();
        $controller->showBooks();
        break;
    case 'logout':
        $userController = new UserController();
        $userController->logout();
        break;
    case 'autor':
        $controller = new booksController();
        $controller->showInfoAuthor($params[1]);
        break;
    case 'autores':
        $controller = new booksController();
        $controller->showAuthors();
        break;
    case 'libros':
        $controller = new booksController();
        $controller->showInfoBooks($params[1]);
        break;
    case 'genero':
        $controller = new booksController();
        $controller->genreFilter($params[1]);
        break;
    case 'agregarLibro':
        $adminController = new adminController();
        $adminController->showAdminOptions();
        break;
    case 'EditarLibro':
        $adminController = new adminController();
        $adminController->showEditBooks();
        break;
    case 'agregarAutor':
        $adminController = new adminController();
        $adminController->showAddAuthor();
        break;
    case 'EditarAutor':
        $adminController = new adminController();
        $adminController->showEditAuthor();
        break;
    case 'deleteBook':
        $adminController = new adminController();
        $adminController->deleteBook($params[1]);
        break;
    case 'deleteAuthor':
        $adminController = new adminController();
        $adminController->deleteAuthor($params[1]);
        break;
    case 'addBook':
        $adminController = new adminController();
        $adminController->addBook();
        break;
    case 'editBook':
        $adminController = new adminController();
        $adminController->editBook();
        break;
    case 'addAuthor':
        $adminController = new adminController();
        $adminController->addAuthor();
        break;
    case 'editAuthor':
        $adminController = new adminController();
        $adminController->editAuthor();
        break;
    case 'userManage':
        $adminController = new adminController();
        $adminController->ShowManageUsers();
        break;
    case 'assignAsAdmin':
        $adminController = new adminController();
        $adminController->assignAsAdmin($params[1]);
        break;
    case 'deleteUser':
        $adminController = new adminController();
        $adminController->deleteUser($params[1]);
        break;
    case 'assignAsAdmin':
        $adminController = new adminController();
        $adminController->assignAsAdmin($params[1]);
        break;
    case 'deletePermit':
        $adminController = new adminController();
        $adminController->deletePermit($params[1]);
        break;
    default:
        echo '404 - Página no encontrada';
        break;
}
