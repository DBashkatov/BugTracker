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
        <form class="form" action="addBugAction.cfm" method="post">
            <h2 class="form__title">Add new bug</h2>

            <div class="form__group">
                <label class="form__label" for="shortDescription">Short Description</label>
                <input class="form__field form__text" type="text" name="shortDescription" id="shortDescription"
                    maxlength=300 required>
            </div>

            <div class="form__group">
                <label class="form__label" for="longDescription">Long Description</label>
                <textarea class="form__field form__text" name="longDescription" id="longDescription"
                    maxlength=3000></textarea>
            </div>

            <div class="form__group">
                <label class="form__label">Urgency</label>
                <div class="form__field">
                    <div class="radio__group">
                        <input class="radio__btn" type="radio" name="urgency" id="urgency_1" required="true"
                            value="Extremely urgent">
                        <label class="radio__label" for="urgency_1">Extremely urgent</label>
                    </div>
                    <div class="radio__group">
                        <input class="radio__btn" type="radio" name="urgency" id="urgency_2" value="Urgent">
                        <label class="radio__label" for="urgency_2">Urgent</label>
                    </div>
                    <div class="radio__group">
                        <input class="radio__btn" type="radio" name="urgency" id="urgency_3" value="Not urgent">
                        <label class="radio__label" for="urgency_3">Not urgent</label>
                    </div>
                    <div class="radio__group">
                        <input class="radio__btn" type="radio" name="urgency" id="urgency_4" value="Not urgent at all">
                        <label class="radio__label" for="urgency_4">Not urgent at all</label>
                    </div>
                </div>
            </div>

            <div class="form__group">
                <label class="form__label">Cruciality</label>
                <div class="form__field">
                    <div class="radio__group">
                        <input class="radio__btn" type="radio" name="cruciality" id="cruciality_1" required="true"
                            value="Crash">
                        <label class="radio__label" for="cruciality_1">Crash</label>
                    </div>
                    <div class="radio__group">
                        <input class="radio__btn" type="radio" name="cruciality" id="cruciality_2" value="Critical">
                        <label class="radio__label" for="cruciality_2">Critical</label>
                    </div>
                    <div class="radio__group">
                        <input class="radio__btn" type="radio" name="cruciality" id="cruciality_3" value="Not Critical">
                        <label class="radio__label" for="cruciality_3">Not Critical</label>
                    </div>
                    <div class="radio__group">
                        <input class="radio__btn" type="radio" name="cruciality" id="cruciality_4"
                            value="Change Request">
                        <label class="radio__label" for="cruciality_4">Change Request</label>
                    </div>
                </div>
            </div>

            <input class="form__button" type="submit" value="Enter">
        </form>
    </section>

</body>

</html>