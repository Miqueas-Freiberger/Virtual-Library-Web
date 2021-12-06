
    <form method="POST" id="FormComments" action="">
        {if isset($smarty.session.USER_ID)}
        <div class="container">
           
            <div class="mb-3 mt-2">

                <label for="exampleFormControlInput1" class="form-label">Agregue un comentario: </label>
                <textarea type="text" class="form-control" name="comentario" id="exampleFormControlInput1"
                    placeholder="Que le parecio el libro?"></textarea>
            </div>

            <div>
                <label>Puntaje</label>
                <select name="puntaje" class="form-select" aria-label="Default select example">

                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value="4">4</option>
                    <option value="5">5</option>
                </select>
            </div>
        
            {if isset($smarty.session.USER_ID)}
                <input type="hidden" name="usuario" value="{$smarty.session.USER_ID}">
                 <input type="hidden" name="libro" value="{$queryData ->id_libros}">
            {/if}
        
          
            <button type="submit" class="btn btn-primary mb-3 mt-3">Enviar</button>
            {/if}

             {if !isset($smarty.session.USER_ID) && !isset($smarty.session.ADMIN_ID)}
             <div class="alert alert-info" role="alert">
           Para postear un comentario necesitas estar loggeado
        </div>
           
        </div>
 {/if}
    </form>

    
