<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Bug Tracking System</title>

    <link href="https://fonts.googleapis.com/css?family=Roboto:400,700|Share+Tech+Mono&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="style.css">
</head>

<body>

    <!-- Form -->
    <section class="container">
        <form class="form" action="#CGI.script_name#?#CGI.query_string#" method="Post">
            <h2 class="form__title">Log in</h2>

            <div class="form__group">
                <label class="form__label" for="username" required>Username</label>
                <input class="form__field form__text form__text--login" type="text" name="j_username" id="username"
                    minlength=4 maxlength=30 required>
            </div>

            <div class="form__group">
                <label class="form__label" for="password">Password</label>
                <input class="form__field form__text form__text--login" type="password" name="j_password" id="password"
                    minlength=8 maxlength=30 required>
            </div>

            <input class="form__button" type="submit" value="Log In">
        </form>
    </section>

</body>

</html>