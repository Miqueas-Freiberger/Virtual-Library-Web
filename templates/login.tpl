{include file='templates/header.tpl'}

<link rel="stylesheet" href="css/login.css">

</head>

<div class="wrapper fadeInDown">
  <div id="formContent">
    <!-- Tabs Titles -->
    <!-- Username: Admin || Password: admin123 -->
    <!-- Login Form -->
    <form method="POST" action="verify">
      <input type="text" id="username" class="fadeIn second mt-4" name="username" placeholder="Nombre de usuario">
      <input type="password" id="password" class="fadeIn third mt-4" name="password" placeholder="*************">
      <input type="submit" class="fadeIn fourth mt-4" value="Ingresar">
    </form>
    {if $error} 
        <div class="alert alert-danger mt-3">
            {$error}
        </div>
        {/if}
  </div>
</div>

{include file='templates/footer.tpl'}