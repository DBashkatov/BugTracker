<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Bug Tracking System</title>

    <link href="https://fonts.googleapis.com/css?family=Roboto:400,700|Share+Tech+Mono&display=swap" rel="stylesheet">
    <link type="text/css" href="style.css" rel="stylesheet">
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


    <!-- Get All Bugs -->
    <cfquery name="getBugs" datasource="get_it">
        SELECT id, shortDescription, status, urgency, cruciality, createDate
        FROM bug
        ORDER BY id
    </cfquery>


    <section class="container">

        <cfif getBugs.RecordCount GT 0>
            <!-- History -->
            <div class="bugList">
                <h2 class="form__title">Bugs</h2>
                <table class="table">
                    <thead class="table__head">
                        <tr>
                            <th class="table__cell table__cell--head" id="shortDescription">Description</th>
                            <th class="table__cell table__cell--head" id="status">Status</th>
                            <th class="table__cell table__cell--head" id="urgency">Urgency</th>
                            <th class="table__cell table__cell--head" id="cruciality">Cruciality</th>
                            <th class="table__cell table__cell--head" id="date">Created</th>
                            <th class="table__cell table__cell--head" id="date"> </th>
                        </tr>
                    </thead>
                    <tbody class="table__body">
                        <cfoutput query="getBugs">
                            <tr class="table__row">
                                <td class="table__cell table__cell--data">#shortDescription#</td>
                                <td class="table__cell table__cell--data">#status#</td>
                                <td class="table__cell table__cell--data">#urgency#</td>
                                <td class="table__cell table__cell--data">#cruciality#</td>
                                <td class="table__cell table__cell--data">#dateFormat(createDate, 'dd mmm yyyy')#</td>
                                <td class="table__cell table__cell--data"><a class="table--link" href="editBug.cfm?bugID=#id#">Learn more</a></td>
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