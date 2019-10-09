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

    <!-- Get Person -->
    <cfquery name="getPersonName" datasource="get_it">
        SELECT firstName, lastName FROM person
        WHERE username='#GetAuthUser()#'
    </cfquery>

    <section class="container">
        <cfoutput query="getPersonName">
            <form class="form" action="editUserAction.cfm" method="Post">
            	<h2 class="form__title">Edit Profile</h2>

                <div class="form__group">
                    <label class="form__label" for="firstName" required>First Name</label>
                    <input class="form__field form__text form__text--login" type="text" name="firstName" id="firstName" value="#firstName#" maxlength=30 required>
                </div>

                <div class="form__group">
                    <label class="form__label" for="lastName">Last Name</label>
                    <input class="form__field form__text form__text--login" type="text" name="lastName" id="lastName" value="#lastName#" maxlength=30 required>
                </div>

                <input class="form__button" type="submit" value="Enter">
            </form>
        </cfoutput>
    </section>

</body>

</html>