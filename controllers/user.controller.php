<?php

require_once('api/APIViews.php');
require_once 'models/admin.model.php';
require_once 'models/model.php';
require_once 'models/user.model.php';
require_once 'views/login.view.php';
require_once 'helpers/auth.helper.php';

class UserController
{
    private $authHelper;
    private $userModel;
    private $loginView;
    private $view;
    private $apiView;
    private $model;


    public function __construct()
    {
        $this->adminModel = new AdminModel();
        $this->userModel = new UserModel();
        $this->loginView = new loginView();
        $this->authHelper = new AuthHelper();
        $this->model = new booksModel();
        $this->view = new booksView();
    }

    public function showLogin()
    {
        $this->loginView->showLogin();
    }
    public function showRegister()
    {
        $this->loginView->showRegister();
    }

    public function register()
    {
        if (!empty($_POST['email']) && !empty($_POST['username']) && !empty($_POST['password'])) {
            $email = $_POST['email'];
            $username = $_POST['username'];
            $password = password_hash($_POST['password'], PASSWORD_BCRYPT);
            $data = $this->userModel->verifyNewUser($email);
            if ($data) {
                $this->loginView->showRegister("El mail ingresado ya esta asociado a una cuenta existente");
            } else {
                $this->userModel->registerUser($email, $username, $password);
                $this->login();
            }
        }
    }

    public function login()
    {
        if (!empty($_POST['username']) && !empty($_POST['password'])) {
            $username = $_POST['username'];
            $password = $_POST['password'];

            $user = $this->userModel->getUser($username);

            if ($user && password_verify($password, $user->password)) {
                $this->authHelper->login($user);
                header("Location: " . BASE_URL);
            } else {
                $this->loginView->showLogin("Usuario o contraseña incorrectos");
            }
        }
    }

    function logout()
    {
        session_destroy();
        $this->authHelper->logout();
    }
}
