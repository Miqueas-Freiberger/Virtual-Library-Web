<?php
require_once 'models/admin.model.php';
require_once 'models/model.php';
require_once 'models/user.model.php';
require_once 'views/login.view.php';
require_once 'views/view.php';
require_once 'helpers/auth.helper.php';
require_once 'api/APIViews.php';

class adminController
{
    private $model;
    private $adminModel;
    private $view;
    private $authHelper;
    private $userModel;
    private $loginView;

    public function __construct()
    {
        $this->adminModel = new AdminModel();
        $this->userModel = new UserModel();
        $this->loginView = new loginView();
        $this->authHelper = new AuthHelper();
        $this->model = new booksModel();
        $this->view = new booksView();
    }

    public function showAdminOptions()
    {
        $this->authHelper->checkAdminLogedIn();
        $dataLibros = $this->model->getAllData();
        $dataAutores = $this->model->getAuthorsData();
        $this->view->showAddBook($dataLibros, $dataAutores);
    }

    public function showEditBooks()
    {
        $this->authHelper->checkAdminLogedIn();
        $dataLibros = $this->model->getAllData();
        $dataAutores = $this->model->getAuthorsData();
        $this->view->showEditBook($dataLibros, $dataAutores);
    }

    public function showAddAuthor()
    {
        $this->authHelper->checkAdminLogedIn();
        $this->view->showAddAuthors();
    }

    public function showEditAuthor()
    {
        $this->authHelper->checkAdminLogedIn();
        $dataAutores = $this->model->getAuthorsData();
        $this->view->showEditAuthor($dataAutores);
    }

    public function addBook()
    {
        $this->authHelper->checkAdminLogedIn();

        if (!empty($_POST['nombre']) && !empty($_POST['genero']) && !empty($_POST['capitulos']) && !empty($_POST['editorial']) && !empty($_POST['anio'])) {
            $nombre = $_POST['nombre'];
            $genero = $_POST['genero'];
            $capitulos = $_POST['capitulos'];
            $editorial = $_POST['editorial'];
            $anio = $_POST['anio'];
            $autor = $_POST['autor'];
            $this->adminModel->addBook($nombre, $genero, $capitulos, $editorial, $anio, $autor);

            header("Location: " . BASE_URL);
        }
    }

    public function editBook()
    {
        $this->authHelper->checkAdminLogedIn();
        if (!empty($_POST['nombre']) && !empty($_POST['genero']) && !empty($_POST['capitulos']) && !empty($_POST['editorial']) && !empty($_POST['anio'])) {
            $id_libros = $_POST['idLibro'];
            $nombre = $_POST['nombre'];
            $genero = $_POST['genero'];
            $capitulos = $_POST['capitulos'];
            $editorial = $_POST['editorial'];
            $anio = $_POST['anio'];
            $autor = $_POST['autor'];

            $this->adminModel->editBook($nombre, $genero, $capitulos, $editorial, $anio, $autor, $id_libros);

            header("Location: " . BASE_URL);
        }
    }

    public function AddAuthor()
    {
        $this->authHelper->checkAdminLogedIn();
        if (!empty($_POST['nombre']) && !empty($_POST['fecha_nacimiento']) && !empty($_POST['nacionalidad'])) {
            $nombre = $_POST['nombre'];
            $nacimiento = $_POST['fecha_nacimiento'];
            $muerte = $_POST['fecha_muerte'];
            $nacionalidad = $_POST['nacionalidad'];

            if ($_FILES['input_name']['type'] == "image/jpg" || $_FILES['input_name']['type'] == "image/jpeg" || $_FILES['input_name']['type'] == "image/png") {
                $this->adminModel->addAuthor($nombre, $nacimiento, $muerte, $nacionalidad, $_FILES['input_name']['tmp_name']);
                header("Location: " . BASE_URL);
            } else {
                $this->adminModel->addAuthor($nombre, $nacimiento, $muerte, $nacionalidad);
                header("Location: " . BASE_URL);
            }
        }
    }

    public function editAuthor()
    {
        if (isset($_POST['update_button'])) {
            $this->authHelper->checkAdminLogedIn();
            if (!empty($_POST['id_autor']) && !empty($_POST['nombre']) && !empty($_POST['fecha_nacimiento']) && !empty($_POST['nacionalidad'])) {
                $id_autor = $_POST['id_autor'];
                $nombre = $_POST['nombre'];
                $nacimiento = $_POST['fecha_nacimiento'];
                $muerte = $_POST['fecha_muerte'];
                $nacionalidad = $_POST['nacionalidad'];

                if ($_FILES['input_name']['type'] == "image/jpg" || $_FILES['input_name']['type'] == "image/jpeg" || $_FILES['input_name']['type'] == "image/png") {
                    $this->adminModel->editAuthor($nombre, $nacimiento, $muerte, $nacionalidad, $id_autor, $_FILES['input_name']['tmp_name']);
                    header("Location: " . BASE_URL);
                } else {
                    $this->adminModel->editAuthor($nombre, $nacimiento, $muerte, $nacionalidad, $id_autor);
                    header("Location: " . BASE_URL);
                }
            }
        } else if (isset($_POST['delete_button'])) {
            $this->authHelper->checkAdminLogedIn();
            if (!empty($_POST['id_autor'])) {
                $id_autor = $_POST['id_autor'];

                $this->adminModel->eraseAuthor($id_autor);
                header("Location: " . BASE_URL);
            }
        }
    }

    public function deleteBook($id)
    {
        $this->authHelper->checkAdminLogedIn();
        $this->adminModel->eraseBook($id);
        header("Location: " . BASE_URL);
    }

    public function deleteAuthor($id)
    {
        $this->authHelper->checkAdminLogedIn();
        $this->adminModel->eraseAuthor($id);
        header("Location: " . BASE_URL);
    }

    public function ShowManageUsers()
    {
        $this->authHelper->checkAdminLogedIn();
        $dataUsers = $this->userModel->getUsersData();
        $this->view->showManageUsers($dataUsers);
    }

    public function assignAsAdmin($id)
    {
        $this->authHelper->checkAdminLogedIn();
        $this->adminModel->setAsAdmin($id);
        header("Location: " . BASE_URL . 'userManage');
    }
    public function deletePermit($id)
    {
        $this->authHelper->checkAdminLogedIn();
        $this->adminModel->changeRol($id);
        header("Location: " . BASE_URL . 'userManage');
    }

    public function deleteUser($id)
    {
        $this->authHelper->checkAdminLogedIn();
        $this->adminModel->eraseUser($id);
        header("Location: " . BASE_URL . 'userManage');
    }
}
