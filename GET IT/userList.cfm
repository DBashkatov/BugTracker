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

    <!-- Get All Users -->
    <cfquery name="getUsers" datasource="get_it">
        SELECT username, firstName, lastName
        FROM person
    </cfquery>


    <section class="container">

        <cfif getUsers.RecordCount GT 0>
            <!-- History -->
            <div class="userList">
                <h2 class="form__title">Users</h2>
                <table class="table">
                    <thead class="table__head">
                        <tr>
                            <th class="table__cell table__cell--head" id="username">User</th>
                            <th class="table__cell table__cell--head" id="firstName">First Name</th>
                            <th class="table__cell table__cell--head" id="lastName">Last Name</th>
                        </tr>
                    </thead>
                    <tbody class="table__body">
                        <cfoutput query="getUsers">
                            <tr class="table__row">
                                <td class="table__cell table__cell--data">#username#</td>
                                <td class="table__cell table__cell--data">#firstName#</td>
                                <td class="table__cell table__cell--data">#lastName#</td>
                            </tr>
                        </cfoutput>
                    </tbody>
                </table>
            </div>

            <cfelse>
                <h2></h2>

        </cfif>

    </section>

</body>

</html>