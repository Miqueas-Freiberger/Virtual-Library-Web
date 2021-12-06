{include file='templates/header.tpl'}
</head>

<h2>EDITAR/ELIMINAR AUTOR:</h2>

<form id="myForm1" method="POST" action="editAuthor" enctype="multipart/form-data">

    <select class="form-select mt-2 mb-4" name="id_autor" aria-label="Default select example">
        <option selected>Elija el autor a editar/eliminar</option>
        {foreach from=$authorsData item=$autor}
            <option value={$autor->id_autor}>{$autor->nombre}</option>
        {/foreach}
    </select>

    <div class="mb-3 mt-2">
        <label for="exampleFormControlInput1" class="form-label">Nuevo nombre del Autor</label>
        <input type="text" class="form-control" name="nombre" id="exampleFormControlInput1"
            placeholder="Ingrese el nombre modificado" required>
    </div>

    <div class="mb-3">
        <label for="exampleFormControlInput1" class="form-label">Nacimiento</label>
        <input type="date" class="form-control" name="fecha_nacimiento" id="exampleFormControlInput1"
            placeholder="Fecha de nacimiento" required>
    </div>

    <div class="mb-3">
        <label for="exampleFormControlInput1" class="form-label">Muerte</label>
        <input type="date" class="form-control" name="fecha_muerte" id="exampleFormControlInput1"
            placeholder="Fecha de muerte">
    </div>

    <div class="mb-3">
        <label for="exampleFormControlInput1" class="form-label">Nacionalidad</label>
        <input type="text" class="form-control" name="nacionalidad" id="exampleFormControlInput1"
            placeholder="Ingrese la nacionalidad" required>
    </div>

    <div class="mb-3">
        <label for="exampleFormControlInput1" class="form-label">Agregar Imagen</label>
        <input type="file" class="form-control" name="input_name" id="imageToUpload">
    </div>


    <div class="col-auto">
        {*  <button type="submit" class="btn btn-primary mb-3 btn-danger">Editar Autor</button>  *}

        <div class="alert alert-info" role="alert">
            Tené en cuenta que al borrar un autor también <strong>eliminarás todos sus libros de la lista</strong>.
        </div>

        <input type="submit" class="btn btn-primary mb-3" name="update_button" value="Editar Autor" />

        <!-- Button trigger modal -->
        <input type="button" class="btn btn-primary mb-3 btn-danger" value="Eliminar Autor" data-bs-toggle="modal"
            data-bs-target="#exampleModal">

        <!-- Modal -->
        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel"> Confirmar </h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"> x </button>
                    </div>
                    <div class="modal-body">
                        <p class="text-center"> ¿Confirma que desea elimnar al autor y <strong>todos sus
                                libros</strong>? </p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                        <button type="submit" name="delete_button" class="btn btn-primary btn-danger">Eliminar
                            Autor</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

</form>


{include file='templates/footer.tpl'}