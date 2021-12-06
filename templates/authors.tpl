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

          </tr>
        </thead>
        <tbody>
        {foreach from=$authors item=$authorsData}
          <tr>
            <td>{$authorsData ->nombre}</td>
            <td>{$authorsData ->nacimiento}</td>
            {if ($authorsData ->muerte != '0000-00-00')}
              <td>{$authorsData ->muerte}</td>
              {else}
                <td>Aun vive</td>
            {/if}
            <td>{$authorsData ->nacionalidad}</td>
          </tr> 
          {/foreach}
        </tbody>
      </table>

          
    </div>


{include file='templates/footer.tpl'}