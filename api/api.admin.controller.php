<?php
require_once 'models/admin.model.php';
require_once 'models/model.php';
require_once 'models/user.model.php';
require_once 'api/APIViews.php';
require_once 'helpers/auth.helper.php';

class ApiAdminController {
    private $model;
    private $adminModel;
    private $userModel;
    private $authHelper;
    private $apiView;

    public function __construct()
    {
        $this->adminModel = new AdminModel();
        $this->userModel = new UserModel();
        $this->model = new booksModel();
        $this->apiView = new APIView();
        $this->authHelper = new AuthHelper();
    }

    function deleteComent($params=null) {
        $this->authHelper->checkAdminLogedIn();
        
        $id = $params[':ID'];
        $coment = $this->model->getComment($id);

        if($coment) {
         $coment = $this->adminModel-> eraseComment($id);
         $this->apiView->response("El comentario con id=$id fue eliminado con exito",200);
        } else 
            $this->apiView->response("El comentario con id=$id no fue encontrado",404);

    }

}