<?php

require_once './libs/smarty-3.1.39/libs/Smarty.class.php';

class booksView
{
    private $smarty;

    public function __construct()
    {
        $this->smarty = new Smarty();
    }

    public function showAuthors($dataAutores){
        $this->smarty->assign('cabeceraAutor_1', 'Nombre');
        $this->smarty->assign('cabeceraAutor_2', 'Fecha de Nacimiento');
        $this->smarty->assign('cabeceraAutor_3', 'Fecha de Muerte');
        $this->smarty->assign('cabeceraAutor_4', 'Nacionalidad');

        $this->smarty->assign('authors', $dataAutores);

        $this->smarty->display('templates/authors.tpl');
    }

    public function showBooks($booksData)
    {
        $this->smarty->assign('cabeceraCol_1', 'Nombre del Libro');
        $this->smarty->assign('cabeceraCol_2', 'Genero');
        $this->smarty->assign('cabeceraCol_3', 'Autor');

        $this->smarty->assign('books', $booksData);

        $this->smarty->display('templates/tableBooks.tpl');
    }

    public function showAuthorData($dataQuery){
        $this->smarty->assign('cabeceraAutor_1', 'Nombre');
        $this->smarty->assign('cabeceraAutor_2', 'Fecha de Nacimiento');
        $this->smarty->assign('cabeceraAutor_3', 'Fecha de Muerte');
        $this->smarty->assign('cabeceraAutor_4', 'Nacionalidad');

        $this->smarty->assign('cabeceraAutor_5', 'Libros del Autor');
        $this->smarty->assign('cabeceraAutor_6', 'Genero');
     
        $this->smarty->assign('data', $dataQuery);

        $this->smarty->display('templates/authorDataTable.tpl');
    }

    public function showData($dataQuery, $dataComment){
        $this->smarty->assign('cabeceraCol_1', 'Nombre del Libro');
        $this->smarty->assign('cabeceraCol_2', 'Genero');
        $this->smarty->assign('cabeceraCol_3', 'Capitulos');
        $this->smarty->assign('cabeceraCol_4', 'Editorial');
        $this->smarty->assign('cabeceraCol_5', 'Año de publicacion');

        $this->smarty->assign('data', $dataQuery);
        $this->smarty->assign('dataComment', $dataComment);


        $this->smarty->display('templates/bookData.tpl');
    }

    function showAddBook($dataLibros,$dataAutores) {
        $this->smarty->assign('authorsData', $dataAutores);
        $this->smarty->assign('booksData', $dataLibros);

        $this->smarty->display('templates/Addbooks.tpl');
    }

    function showEditBook($dataLibros,$dataAutores) {
        $this->smarty->assign('authorsData', $dataAutores);
        $this->smarty->assign('booksData', $dataLibros);

        $this->smarty->display('templates/Editbooks.tpl');
    }

    function showAddAuthors() {
        $this->smarty-> display('templates/addAuthors.tpl');
    }

    function showEditAuthor($dataAutores) {
        $this->smarty->assign('authorsData', $dataAutores);

        $this->smarty->display('templates/editAuthor.tpl');
    }
    
    function showManageUsers($dataUsers) {
        $this->smarty->assign('cabeceraCol_1', 'Nombre de usuario');
        $this->smarty->assign('cabeceraCol_2', 'Email');
        $this->smarty->assign('cabeceraCol_3', 'Opciones');
        $this->smarty->assign('users',$dataUsers);
        $this->smarty->display('templates/editUsers.tpl');
    }

}
