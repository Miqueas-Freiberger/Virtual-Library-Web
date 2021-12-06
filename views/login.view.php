<?php

require_once './libs/smarty-3.1.39/libs/Smarty.class.php';

class loginView
{
    private $smarty;

    function __construct()
    {
        $this->smarty = new Smarty();
    }

    function showLogin($error = null)
    {
        $this->smarty ->assign('error', $error);
        $this->smarty->display('templates/login.tpl');
        
    }
    function showRegister($error = null){
        $this->smarty ->assign('error', $error);
        $this->smarty->display('templates/register.tpl');
    }
}
