{include file='templates/header.tpl'}
</head>
<div class="containter">
    <table class="table">
        <thead>
            <tr>
                <th scope="col">{$cabeceraAutor_1}</th>
                <th scope="col">{$cabeceraAutor_2}</th>
                <th scope="col">{$cabeceraAutor_3}</th>
                <th scope="col">{$cabeceraAutor_4}</th>
                <th scope="col">{$cabeceraAutor_5}</th>
                <th scope="col">{$cabeceraAutor_6}</th>

            </tr>
        </thead>
        <tbody>
            {foreach from=$data item=$queryData}
                <tr>
                    <td>{$queryData ->autor_nombre}</td>
                    <td>{$queryData ->nacimiento}</td>
                    {if ($queryData ->muerte != '0000-00-00')}
                        <td>{$queryData ->muerte}</td>
                    {else}
                        <td>Aun vive</td>
                    {/if}
                    <td>{$queryData ->nacionalidad}</td>
                    <td><a href="{BASE_URL}libros/{$queryData ->id_libros}">{$queryData ->nombre}</a></td>
                    <td>{$queryData ->genero}</td>
                </tr>

            {/foreach}
            
            {if isset($queryData->imagen)}
                <img src="{$queryData->imagen}" />
            {/if}


        </tbody>

    </table>






</div>



{include file='templates/footer.tpl'}