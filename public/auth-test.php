<?php

    // Require this web authentication class file
    require_once 'WebAuth.php';

    // Create a new authentication object
    $auth_object = new WebAuth();

    // Next, we can check whether or not you're logged
    // in by checking the $auth->isLoggedIn()  method
    if ($auth_object->isLoggedIn()) {
       echo "<a href='$auth_object->logout_url'><b>Logout</b></a><br>";
    }
    else {
        echo "<a href='$auth_object->login_url'><b>Login</b></a><br>";
    }

    // Also, you can look at all the values within
    // the auth object by using the code:
    print "<pre>";
    print_r ($auth_object);
    print "<br>";
    echo "UCI NET ID: $auth_object->ucinetid<br>";
    echo "CAMPUS ID: $auth_object->campus_id";
    print "</pre>";

?>