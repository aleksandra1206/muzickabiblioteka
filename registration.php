<?php

include('config/db_connect.php');
include('models/User.php');

$email = $username = $password = '';

$errors = ['email' => '', 'username' => '', 'password' => ''];

if (isset($_POST['registration'])) { 

    if (empty($_POST['email'])) { 
        $errors['email'] = 'Email is required!'; 
    } else {
        $email = $_POST['email']; 
        if (filter_var($email, FILTER_VALIDATE_EMAIL)==false) {
            $errors['email'] = 'Invalid email address!';
        }
    }

    if (empty($_POST['username'])) {
        $errors['username'] = 'Username is required!';
    } else {
        $username = $_POST['username'];

        
        $query = "SELECT * FROM user WHERE username = '$username'";
        $result = mysqli_query($conn, $query);
        $userWithSameUsername = mysqli_fetch_assoc($result);
        mysqli_free_result($result);

        if ($userWithSameUsername != null) { 
            $errors['username'] = "User with username $username already exists!";
        }
    }

    if (empty($_POST['password'])) {
        $errors['password'] = 'Password is required!';
    } else {
        $password = $_POST['password'];
        if (strlen($password) < 8) { 
            $errors['password'] = 'Password must be at least 8 characters long!';
        }
    }

    if (!array_filter($errors)) {  
        $email = $_POST['email'];
        $username = $_POST['username'];
        $password = $_POST['password'];

        $newUser = new User(null, $email, $username, $password, null);
        $newUser->createUser();
    }
}

?>

<!DOCTYPE html>
<html>

<?php include('templates/header.php') ?>

<section class="container">
    <h4 class="center">Create account to post songs!</h4>

    
    <form action="<?php echo $_SERVER['PHP_SELF'] ?>" class="white form" method="POST">
        <label for="email">Email:</label>
        <input type="text" name="email" value="<?php echo htmlspecialchars($email); ?>">
        <div class="red-text"><?php echo $errors['email']; ?></div>

        <label for="username">Username:</label>
        <input type="text" name="username" value="<?php echo htmlspecialchars($username); ?>">
        <div class="red-text"><?php echo $errors['username']; ?></div>

        <label for="password">Password:</label>
        <input type="password" name="password" value="<?php echo htmlspecialchars($password); ?>">
        <div class="red-text"><?php echo $errors['password']; ?></div>

        <div class="center">
            <input type="submit" name="registration" value="Create account" class="btn pink darken-2 z-depth-0">
        </div>
    </form>
</section>

<?php include('templates/footer.php') ?>

</html>