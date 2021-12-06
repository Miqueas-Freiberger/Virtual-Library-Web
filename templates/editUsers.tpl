{include file='templates/header.tpl'}


<table class="table">
    <thead>
        <tr>
            <th scope="col">{$cabeceraCol_1}</th>
            <th scope="col">{$cabeceraCol_2}</th>
            <th scope="col">{$cabeceraCol_3}</th>
        </tr>
    </thead>
    <tbody>
        {foreach from=$users item=$user}
            <tr>
                {if $user->username != $smarty.session.ADMIN_NAME}
                    <td> {$user->username}</td>
                {else}
                    <td>{$user->username} <strong>(yo)</strong></td>
                {/if}

                <td>{$user->email}</td>

                {if $user->username != $smarty.session.ADMIN_NAME}
                    {if $user->rol == 0}
                        <td> <button type="button" class="btn rounded-pill btn-sm" data-bs-toggle="modal"
                                data-bs-target="#Modal{$user ->id}">
                                Asignar como administrador
                            </button>

                            <!-- Modal -->

                            <div class="modal fade" id="Modal{$user ->id}" tabindex="-1" aria-labelledby="exampleModalLabel"
                                aria-hidden="true">
                                <div class="modal-dialog modal-dialog-centered">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h6 class="modal-title">CONFIRMAR</h5>
                                        </div>
                                        <div class="modal-body">
                                            <p class="text-center">¿Estás seguro que desea otorgarle al usuario
                                                <strong>{$user->username}</strong> opciones de administración?</p>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-primary"><a href="assignAsAdmin/{$user ->id}"
                                                    class="text-decoration-none text-white">Si, estoy seguro</a></button>
                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">CERRAR</button>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        {else}
                        <td> <button type="button" class="btn rounded-pill btn-sm" data-bs-toggle="modal"
                                data-bs-target="#Modal{$user ->id}">
                                Eliminar permisos de administración
                            </button>

                            <!-- Modal -->

                            <div class="modal fade" id="Modal{$user ->id}" tabindex="-1" aria-labelledby="exampleModalLabel"
                                aria-hidden="true">
                                <div class="modal-dialog modal-dialog-centered">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h6 class="modal-title">CONFIRMAR</h5>
                                        </div>
                                        <div class="modal-body">
                                            <p class="text-center">¿Estás seguro que desea eliminar los permisos de administración
                                                al usuario <strong>{$user->username}</strong></p>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-primary"><a href="deletePermit/{$user ->id}"
                                                    class="text-decoration-none text-white">Si, estoy seguro</a></button>
                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">CERRAR</button>

                                        </div>
                                    </div>
                                </div>
                            </div>

                        {/if}
                    {/if}


                    {if $user->username != $smarty.session.ADMIN_NAME}
                        <button type="button" class="btn btn-danger rounded-pill btn-sm" data-bs-toggle="modal"
                            data-bs-target="#Modal2{$user ->id}">
                            Eliminar usuario
                        </button>

                        <!-- Modal -->

                        <div class="modal fade" id="Modal2{$user ->id}" tabindex="-1" aria-labelledby="exampleModalLabel"
                            aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h6 class="modal-title">CONFIRMAR</h5>
                                    </div>
                                    <div class="modal-body">
                                        <p class="text-center">¿Estás seguro que desea eliminar al usuario?</p>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-primary"><a href="deleteUser/{$user ->id}"
                                                class="text-decoration-none text-white">Si, estoy seguro</a></button>
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">CERRAR</button>
                                    </div>
                                </div>
                            </div>
                        </div>


                    {/if}



                </td>
            </tr>
        {/foreach}

    </tbody>
</table>


{include file='templates/footer.tpl'}