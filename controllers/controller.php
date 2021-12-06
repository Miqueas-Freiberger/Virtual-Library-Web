<?php
include_once('models/model.php');
include_once('views/view.php');
include_once('helpers/auth.helper.php');

class booksController
{
    private $model;
    private $view;
    private $authHelper;

    public function __construct()
    {
        $this->model = new booksModel();
        $this->view = new booksView();
        $this->authHelper = new AuthHelper();
    }

    public function showAuthors(){

        $dataAutores = $this->model->getAuthorsData();
        $this->view->showAuthors($dataAutores);
    }

    public function showBooks()
    {
        $dataLibros = $this->model->getAllData();
        $this->view->showBooks($dataLibros);
    }

    public function showInfoBooks($queryId)
    {
        $dataQuery = $this->model->getBooksQueryData($queryId);
        $dataComment = $this->model->getInfoComments($queryId);
        $this->view->showData($dataQuery, $dataComment);  
    }

    public function showInfoAuthor($queryId)
    {
        $booksByAuthor = $this->model->getAuthorQueryData($queryId);

        $this->view->showAuthorData($booksByAuthor);
    }

    public function genreFilter($bookGenre)
    {
        $dataQuery = $this->model->getFilteredBooks($bookGenre);
        $this->view->showBooks($dataQuery);
    }

    
}
