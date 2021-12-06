{include file='templates/header.tpl'}
</head>

<h2>NUEVO AUTOR:</h2>

<form method="POST" action="addAuthor" enctype="multipart/form-data">
    <div class="mb-3 mt-2">
        <label for="exampleFormControlInput1" class="form-label">Nombre del Autor</label>
        <input type="text" class="form-control" name="nombre" id="exampleFormControlInput1"
            placeholder="Ingrese el nombre">
    </div>

    <div class="mb-3">
        <label for="exampleFormControlInput1" class="form-label">Nacimiento</label>
        <input type="date" class="form-control" name="fecha_nacimiento" id="exampleFormControlInput1"
            placeholder="Fecha de nacimiento">
    </div>

    <div class="mb-3">
        <label for="exampleFormControlInput1" class="form-label">Muerte</label>
        <input type="date" class="form-control" name="fecha_muerte" id="exampleFormControlInput1"
            placeholder="Fecha de muerte">
    </div>

    <div class="mb-3">
        <label for="exampleFormControlInput1" class="form-label">Nacionalidad</label>
        <input type="text" class="form-control" name="nacionalidad" id="exampleFormControlInput1"
            placeholder="Ingrese la nacionalidad">
    </div>

    <div class="mb-3">
        <label for="exampleFormControlInput1" class="form-label">Agregar Imagen</label>
        <input type="file" class="form-control" name="input_name" id="imageToUpload">
    </div>

    <div class="col-auto">
        <button type="submit" class="btn btn-primary mb-3">Agregar Autor</button>
    </div>



</form>

{include file='templates/footer.tpl'}