<?php
class UserModel{

    private $db;

    public function __construct()
    {
        $this->db = new PDO('mysql:host=localhost;' . 'dbname=db_libros;charset=utf8', 'root', '');
    }

    function getUser($username)
    {
        $query = $this->db->prepare('SELECT * FROM usuarios WHERE username = ?');
        $query->execute([$username]);
        $user = $query->fetch(PDO::FETCH_OBJ);
        return $user;
    }

    function getUsersData()
    {
        $query = $this->db->prepare('SELECT * FROM usuarios');
        $query->execute();
        $usersData= $query->fetchAll(PDO::FETCH_OBJ);
        return $usersData;
    }

    function verifyNewUser($email){
        $query = $this->db->prepare('SELECT * FROM usuarios WHERE email = ?');
        $query->execute([$email]);
        $data = $query->fetchAll(PDO::FETCH_OBJ);
        
        return $data;
    }

    function registerUser($email,$username,$password){
        $query = $this->db->prepare('INSERT INTO usuarios (email,username,password,rol) VALUES (?,?,?,?)');
        $query->execute([$email,$username,$password,0]);
    } 

    function postComent($comentario, $puntuacion, $usuario, $libro)
    {
        $query = $this->db->prepare('INSERT INTO comentarios(comentario, puntuacion, usuario, id_libro) VALUES(?,?,?,?)');
        $query->execute([$comentario, $puntuacion, $usuario, $libro]);
        return $this->db->lastInsertId();
    }

    function getAllComents()
    {
        $query = $this->db->prepare('SELECT comentarios.*, usuarios.email as email FROM comentarios JOIN usuarios ON comentarios.usuario = usuarios.id');
        $query->execute();

        $coments = $query->fetchAll(PDO::FETCH_OBJ);
        return $coments;
    }

    function getCommentsByRating($puntaje) {

        $query = $this->db->prepare('SELECT comentarios.*, usuarios.email as email FROM comentarios JOIN usuarios ON comentarios.usuario = usuarios.id WHERE puntuacion = ?');
        $query->execute([$puntaje]);

        $filtredComments = $query->fetchAll(PDO::FETCH_OBJ);
        return $filtredComments;

    }
    
}