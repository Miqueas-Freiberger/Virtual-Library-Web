{include file='templates/header.tpl'}
</head>
<table class="table">
    <thead>
        <tr>
          <th scope="col">{$cabeceraCol_1}</th>
          <th scope="col">{$cabeceraCol_2}</th>
          <th scope="col">{$cabeceraCol_3}</th>
        </tr>
    </thead>
    <tbody>
        {foreach from=$books item=$bookData}
            <tr>
             <td>
                <a class="navbar-brand" href="{BASE_URL}libros/{$bookData ->id_libros}">{$bookData ->nombre}</a>
                    {if isset($smarty.session.ADMIN_ID)}

                        <button type="button" class="btn btn-danger rounded-pill btn-sm" data-bs-toggle="modal" data-bs-target="#Modal{$bookData ->id_libros}">
                        BORRAR 
                        </button>

                        <!-- Modal -->
    
                            <div class="modal fade" id="Modal{$bookData ->id_libros}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered">
                                <div class="modal-content">
                                <div class="modal-header">
                                    <h6 class="modal-title">CONFIRMAR</h5> 
                                </div>
                                <div class="modal-body">
                                <p  class="text-center">¿Estás seguro que deseas eliminar el libro <strong>{$bookData ->nombre}</strong> de {$bookData->autor}?</p>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">CERRAR</button>
                                    <button type="button" class="btn btn-primary"><a href="deleteBook/{$bookData->id_libros}" class="text-decoration-none text-white">BORRAR LIBRO</a></button>
                                </div>
                                </div>
                            </div>
                            </div>

                    {/if}
                </td>
                <td><a class="navbar-brand" href="{BASE_URL}genero/{$bookData ->genero}">{$bookData ->genero}</a></td>
                <td><a class="navbar-brand" href="{BASE_URL}autor/{$bookData ->id_autor_fk}">{$bookData->autor}</a>
                </td>
            </tr> 
        {/foreach}
    
    </tbody>
</table>



{include file='templates/footer.tpl'}