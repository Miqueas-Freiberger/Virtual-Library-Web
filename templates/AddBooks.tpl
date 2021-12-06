{include file='templates/header.tpl'}
</head>

   <h2>AGREGAR LIBRO:</h2>

   <form method="POST" action="addBook">
        <div class="mb-3 mt-2">
            <label for="exampleFormControlInput1" class="form-label">Nombre del libro</label>
            <input type="text" class="form-control" name="nombre" id="exampleFormControlInput1" placeholder="Ingrese el nombre">
        </div>

        <div class="mb-3">
            <label for="exampleFormControlInput1"  class="form-label">Genero</label>
            <input type="text" class="form-control" name="genero" id="exampleFormControlInput1" placeholder="Ingrese el genero">
        </div>

        <div class="mb-3">
            <label for="exampleFormControlInput1" class="form-label">Cantidad de capitulos</label>
            <input type="number" class="form-control" name="capitulos" id="exampleFormControlInput1" placeholder="Ingrese la cantidad de Capitulos">
        </div>

        <div class="mb-3">
            <label for="exampleFormControlInput1" class="form-label">Editorial</label>
            <input type="text" class="form-control" name="editorial" id="exampleFormControlInput1" placeholder="Ingrese la editorial">
        </div>

        <div class="mb-3">
            <label for="exampleFormControlInput1" class="form-label">Año de publicacion</label>
            <input type="number" class="form-control" name="anio" id="exampleFormControlInput1" placeholder="Ingrese el año de publicacion">
        </div>

        <select class="form-select mt-2 mb-4" name="autor" aria-label="Default select example">
        <option selected>Elija el autor del Libro</option>
        {foreach from=$authorsData item=$author}
            <option value={$author->id_autor}>{$author->nombre}</option>
        {/foreach}
        
        </select>

        <div class="col-auto">
            <div class="alert alert-primary" role="alert">
            Si buscás un autor que no está en la lista, primero debe agregarlo desde la pestaña de <a href="agregarAutor">Nuevo Autor</a>
            </div>
            
            <button type="submit" class="btn btn-primary mb-3">Agregar Libro</button>
        </div>


    </form>

    {include file='templates/footer.tpl'}