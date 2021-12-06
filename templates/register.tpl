{include file='templates/header.tpl'}

<link rel="stylesheet" href="css/login.css">

</head>

<div class="wrapper fadeInDown">
  <div id="formContent">
    <form method="POST" action="register">
      <input type="text" id="email" class="fadeIn second mt-4" name="email" placeholder="Email">
      <input type="text" id="username" class="fadeIn second mt-4" name="username" placeholder="Nombre de usuario">
      <input type="password" id="password" class="fadeIn third mt-4" name="password" placeholder="*************">
      <input type="submit" class="fadeIn fourth mt-4" value="Registrarse">
    </form>
    {if $error} 
      <div class="alert alert-danger mt-3">
          {$error}
      </div>
      {/if}
  </div>
</div>

{include file='templates/footer.tpl'}