<?php
require_once 'models/admin.model.php';
require_once 'models/model.php';
require_once 'models/user.model.php';
require_once 'api/APIViews.php';
require_once 'helpers/auth.helper.php';

class ApiUserController{
    private $userModel;
    private $adminModel;
    private $model;
    private $view;
    private $authHelper;

    public function __construct()
    {

        $this->userModel = new UserModel;
        $this->adminModel = new AdminModel();
        $this->model = new booksModel();
        $this->apiView = new APIView();
        $this->authHelper = new AuthHelper();
    }

    private function getData() {
        $data = file_get_contents("php://input");
        return json_decode($data);
    }

    public function insertComent($params=null)
    {
        $this->authHelper->checkLogedIn();

        $data = $this->getData();
        $comentario = $data->comentario;
        $puntuacion = $data->puntuacion;
        $usuario = $data->usuario;
        $libro = $data->id_libro;


        $id = $this->userModel->postComent($comentario, $puntuacion, $usuario, $libro);

        $coment = $this->model->getComment($id);
        if($coment)
            $this->apiView->response($coment,200);
        else
            $this->apiView->response("El comentario no pudo ser posteado",500);

    }
    
    public function getAll($params=null) {
        $coments = $this->userModel->getAllComents();
        $this->apiView->response($coments,200);

    }

    public function getCommentsByOrder($params=null) {
        $puntaje = $params[':PUNTAJE'];
        $filtredComments = $this-> userModel -> getCommentsByRating($puntaje);

        if($filtredComments) {
            $this->apiView->response($filtredComments,200);
        }
        else
         $this->apiView->response('Error al obtener comentarios filtrados', 500);
    }
}