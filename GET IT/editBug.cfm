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

    <!-- Get Bug by Id -->
    <cfquery name="getBug" datasource="get_it">
        SELECT person, createDate, shortDescription, longDescription, status, urgency, cruciality
        FROM bug
        WHERE id=#url.bugID#
    </cfquery>

    <!-- Get Person -->
    <cfquery name="getPersonName" datasource="get_it">
        SELECT firstName, lastName
        FROM person
        WHERE username='#getBug.person#'
    </cfquery>

    <cfset fullName=getPersonName.firstName & ' ' & getPersonName.lastName />

    <!-- Get Bug History -->
    <cfquery name="getHistory" datasource="get_it">
        SELECT action, actionDate, person, comment
        FROM bug_history
        WHERE bug=#url.bugID#
    </cfquery>


    <section class="container">

        <!-- Form -->
        <cfoutput query="getBug">

            <form class="form" action="editBugAction.cfm?bugID=#url.bugID#" method="post">
                <h2 class="form__title">Edit bug</h2>

                <div class="form__group">
                    <label class="form__label">Person</label>
                    <span class="form__field form__field--info">#fullName#</span>
                </div>

                <div class="form__group">
                    <label class="form__label">Date</label>
                    <span class="form__field form__field--info">#DateFormat(createDate, "dd mmm yyyy")#</span>
                </div>

                <div class="form__group">
                    <label class="form__label">Short Description</label>
                    <span class="form__field form__field--info"> #shortDescription# </span>
                </div>

                <div class="form__group">
                    <label class="form__label">Long Description</label>
                    <span class="form__field form__field--info"> #longDescription#
                </div>

                <div class="form__group">
                    <label class="form__label">Urgency</label>
                    <span class="form__field form__field--info">#urgency#</span>
                </div>

                <div class="form__group">
                    <label class="form__label">Cruciality</label>
                    <span class="form__field form__field--info">#cruciality#</span>
                </div>

                <div class="form__group">
                    <label class="form__label">Current status</label>
                    <span class="form__field form__field--info"> #status# </span>
                </div>

                <div class="form__group">
                    <cfif #status# NEQ 'Closed'>
                        <label class="form__label">New status</label>
                        <div class="form__field">

                            <cfif #status# EQ "New">
                                <div class="radio__group">
                                    <input class="radio__btn" type="radio" name="status" id="status_2" value="Open"
                                        required="true">
                                    <label class="radio__label" for="status_2">Open</label>
                                </div>
                            </cfif>

                            <cfif #status# EQ "Open">
                                <div class="radio__group">
                                    <input class="radio__btn" type="radio" name="status" id="status_3" value="Solved"
                                        required="true">
                                    <label class="radio__label" for="status_3">Solved</label>
                                </div>
                            </cfif>

                            <cfif #status# EQ "Solved">
                                <div class="radio__group">
                                    <input class="radio__btn" type="radio" name="status" id="status_2" value="Open"
                                        required="true">
                                    <label class="radio__label" for="status_2">Open</label>
                                </div>

                                <div class="radio__group">
                                    <input class="radio__btn" type="radio" name="status" id="status_4" value="Closed">
                                    <label class="radio__label" for="status_4">Closed</label>
                                </div>
                            </cfif>

                        </div>

                    </cfif>
                </div>


                <cfif #status# NEQ 'Closed'>
                    <div class="form__group">
                        <label class="form__label" for="comment">Comment</label>
                        <input class="form__field form__text" type="text" name="comment" id="comment" maxlength=300
                            required>
                    </div>

                    <input class="form__button" type="submit" value="Enter">
                </cfif>
            </form>
        </cfoutput>

        <cfif  getHistory.RecordCount GT 0>
            <!-- History -->
            <div class="sidebar">
                <h4 class="sidebar__title">Bug History</h4>
                <table class="table table--side">
                    <thead class="table__head">
                        <tr>
                            <th class="table__cell table__cell--head" id="action">Action</th>
                            <th class="table__cell table__cell--head" id="actionDate">Date</th>
                            <th class="table__cell table__cell--head" id="person">Person</th>
                            <th class="table__cell table__cell--head" id="comment">Comment</th>
                        </tr>
                    </thead>
                    <tbody class="table__body">
                        <cfoutput query="getHistory">
                            <tr class="table__row">
                                <td class="table__cell table__cell--data">#action#</td>
                                <td class="table__cell table__cell--data">#DateFormat(actionDate, "dd mmm yyyy")#</td>
                                <td class="table__cell table__cell--data">#fullName#</td>
                                <td class="table__cell table__cell--data">#comment#</td>
                            </tr>
                        </cfoutput>
                    </tbody>
                </table>
            </div>
        </cfif>

    </section>

</body>

</html>