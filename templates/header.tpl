<!DOCTYPE html>
<html lang="en">

<head>
    <base href="<?php echo BASE_URL ?>">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Biblioteca Virtual</title>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <link rel="stylesheet" href="css/style.css">

    <!-- development version, includes helpful console warnings -->
    <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>

<body>
    <header>
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container-fluid">                    
                        <a class="navbar-brand" href="{BASE_URL}">Biblioteca Virtual</a>                
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarText">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        {if isset($smarty.session.ADMIN_ID) } <!-- verifico el rol de el usuario ingresado -->
                           <div class="dropdown">
                            <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="{BASE_URL}" id="navbarDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                        Opciones de Administracion
                                    </a>
                                    <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                                        <li><a class="dropdown-item" href="{BASE_URL}agregarLibro">Agregar libro</a></li>
                                        <li><a class="dropdown-item" href="{BASE_URL}EditarLibro">Editar libro</a></li>
                                        <li><hr class="dropdown-divider"></li>
                                        <li><a class="dropdown-item" href="{BASE_URL}agregarAutor">Agregar autor</a></li>
                                        <li><a class="dropdown-item" href="{BASE_URL}EditarAutor">Editar/Eliminar autor</a></li>
                                        <li><hr class="dropdown-divider"></li>
                                         <li><a class="dropdown-item" href="{BASE_URL}userManage">Administracion de usuarios</a></li>
                                   
                                    </ul>
                                </li>
                         </div>
                            
                            {/if}
                        <li class="nav-item"> <a class="nav-link active" aria-current="page" href="autores">Autores</a> </li>

                    </ul>
                    
                    <ul class="navbar-nav ml-auto">
                    
                    {if isset($smarty.session.ADMIN_ID) || isset($smarty.session.USER_ID)}
                            <li class="nav-item"> <a class="nav-link active" aria-current="page" href="{BASE_URL}logout"> <button type="button" class="btn btn-outline-secondary">Log Out </button></a> </li>   
                    {else} 
                        <li class="nav-item "> <a class="nav-link active" aria-current="page" href="{BASE_URL}login"><button type="button" class="btn btn-outline-secondary">Log In </button></a> </li>
                        <li class="nav-item "> <a class="nav-link active" aria-current="page" href="{BASE_URL}registerForm"><button type="button" class="btn btn-outline-secondary">Registrarse </button></a> </li>
                    {/if}
                            
                       
                    </ul>
                </div>
            </div>
        </nav>
    </header>
    
    <!-- inicio de contenido principal -->
    <div class="container">
