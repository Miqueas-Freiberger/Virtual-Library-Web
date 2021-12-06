<?php

class booksModel
{
    private $db;

    public function __construct()
    {
        $this->db = new PDO('mysql:host=localhost;' . 'dbname=db_libros;charset=utf8', 'root', '');
    }

    //Obtiene todos los libros de la db
    function getAllData()
    {
        $query = $this->db->prepare('SELECT libros.*, autor.nombre as autor FROM libros JOIN autor ON libros.id_autor_fk = autor.id_autor');
        $query->execute();

        $booksData = $query->fetchAll(PDO::FETCH_OBJ);

        return $booksData;
    }
    function getAuthorsData()
    {
        $query = $this->db->prepare('SELECT * FROM autor');
        $query->execute();

        $authorData = $query->fetchAll(PDO::FETCH_OBJ);

        return $authorData;
    }

    function getBooksQueryData($queryId)
    {
        $query = $this->db->prepare('SELECT * FROM libros WHERE id_libros =' . $queryId);
        $query->execute();

        $queryData = $query->fetchAll(PDO::FETCH_OBJ);
        return $queryData;
    }

    function getAuthorQueryData($queryId)
    {
        $query = $this->db->prepare('SELECT libros.*, autor.nombre as autor_nombre, autor.nacimiento as nacimiento, autor.muerte as muerte, autor.nacionalidad as nacionalidad, autor.imagen as imagen FROM libros JOIN autor ON libros.id_autor_fk = autor.id_autor WHERE id_autor =' . $queryId);
        $query->execute();

        $queryData = $query->fetchAll(PDO::FETCH_OBJ);

        return $queryData;
    }

    function getFilteredBooks($bookGenre)
    {
        $query = $this->db->prepare('SELECT libros.*, autor.nombre as autor FROM libros JOIN autor ON libros.id_autor_fk = autor.id_autor WHERE genero = "' . $bookGenre . '" ');
        $query->execute();

        $queryData = $query->fetchAll(PDO::FETCH_OBJ);

        return $queryData;
    }

    function getBooksByAuthor($queryId)
    {
        $query = $this->db->prepare('SELECT libros.*, autor.nombre as autor FROM libros JOIN autor ON libros.id_autor_fk = autor.id_autor WHERE autor.id_autor =' . $queryId);
        $query->execute();

        $queryData = $query->fetchAll(PDO::FETCH_OBJ);

        return $queryData;
    }


    function getComment($id) {
        $query = $this->db->prepare('SELECT * FROM comentarios WHERE id=?');
        $query->execute([$id]);
        return $query->fetch(PDO::FETCH_OBJ);
    }

    function getInfoComments($libro) {
        $query = $this->db->prepare('SELECT comentarios.*, usuarios.email as email FROM comentarios JOIN usuarios ON comentarios.usuario = usuarios.id WHERE id_libro=?');
        $query->execute([$libro]);
        $data = $query->fetchAll(PDO::FETCH_OBJ);
        return $data;
    }
}
