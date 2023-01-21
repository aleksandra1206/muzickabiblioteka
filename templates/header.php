<?php

include('config/session.php');

if (isset($_POST['logout'])) {
    session_unset();
    header('Location: login.php');
}

?>


<head>
    <title>MusicLibrary</title>
    <linK rel="icon" href="img/icon.png">
    <link rel="stylesheet" href="css/materialize.min.css">
    <style>
        .title-text {
            font-size: xx-large;
        }

        .nav-text {
            font-size: large;
            font-weight: 600;
        }

        .icon-card {
            width: 100px;
            margin: 40px auto -30px;
            display: block;
            position: relative;
            top: -30px;
        }

        .radius-card {
            border-radius: 20px;
        }

        .form {
            padding: 10px;
            margin-left: 25%;
            width: 50%;
            text-align: center;
            border-radius: 15px;
        }
    </style>
</head>

<body class="pink lighten-4">
    <nav class="pink darken-1">
        <div class="container">
            <a href="index.php" class="title-text">MusicLibrary</a>

            <?php if ($loggedId != 0) : ?>
                <ul class="right">
                    <li>
                        <a href="profile.php?id=<?php echo $loggedId ?>" class="btn white pink-text nav-text z-depth-0">
                            Your profile
                        </a>
                    </li>
                    <li>
                        <a href="add.php" class="btn white pink-text nav-text z-depth-0">
                            Add a song
                        </a>
                    </li>
                    <li>
                        <form action="" method="POST">
                            <input type="submit" name="logout" value="logout" class="btn white pink-text nav-text z-depth-0">
                        </form>
                    </li>
                </ul>
            <?php else : ?>
                <ul class="right">
                    <li>
                        <a href="registration.php" class="btn white pink-text nav-text z-depth-0">
                            Register
                        </a>
                    </li>
                    <li>
                        <a href="login.php" class="btn white pink-text nav-text z-depth-0">
                            Login
                        </a>
                    </li>
                </ul>
            <?php endif; ?>
        </div>
    </nav>