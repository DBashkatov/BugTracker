<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Bug Tracking System</title>

    <link href="https://fonts.googleapis.com/css?family=Roboto:400,700|Share+Tech+Mono&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="style.css">
</head>

<body>

    <!-- Navigation -->
    <nav class="nav">
        <div class="container">
            <div class="logo">BugTracker</div>

            <div class="nav__links">
                <a class="nav__link" href="bugList.cfm">Bugs</a>
                <a class="nav__link" href="addBug.cfm">New bug</a>
                <a class="nav__link" href="userList.cfm">Users</a>
                <a class="nav__link" href="register.cfm">New user</a>
                <a class="nav__link" href="editUser.cfm">Edit profile</a>
                <form class="logout" action="securitytest.cfm" method="Post">
                    <input class="nav__link logout__button" type="submit" Name="Logout" value="Logout">
                </form>
            </div>
        </div>
    </nav>

	<!-- Form -->
    <section class="container">
        <form class="form" action="registerAction.cfm" method="Post">
            <h2 class="form__title">Register</h2>

            <div class="form__group">
                <label class="form__label" for="username" required>Username</label>
                <input class="form__field form__text form__text--login" type="text" name="username" id="username" minlength=4 maxlength=30 required>
            </div>

            <div class="form__group">
                <label class="form__label" for="password">Password</label>
                <input class="form__field form__text form__text--login" type="password" name="password" id="password" minlength=8 maxlength=30 required>
            </div>

            <div class="form__group">
                <label class="form__label" for="confirmPassword">Confirm password</label>
                <input class="form__field form__text form__text--login" type="password" name="confirmPassword" id="confirmPassword" minlength=8 maxlength=30 required>
            </div>

            <input class="form__button" type="submit" value="Register">
        </form>
    </section>

</body>

</html>