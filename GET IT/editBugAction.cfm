<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Bug Tracking System</title>

    <link href="https://fonts.googleapis.com/css?family=Roboto:400,700|Share+Tech+Mono&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="style.css">
</head>

<body>

    <!-- Authentication check -->
    <cfif IsUserLoggedIn()>

        <!-- Insert new Bug -->
        <cfquery name="updateBug" datasource="get_it">
            UPDATE bug
            SET status='#Form.status#'
            WHERE id=#url.bugID#
        </cfquery>

        <!-- Add to history -->
        <cfquery name="addHistory" datasource="get_it">
            INSERT INTO bug_history(bug, action, actionDate, person, comment)
            VALUES (#url.bugID#, '#Form.status#', #Now()#, '#GetAuthUser()#', '#Form.comment#')
        </cfquery>

        <div class="message message--success">
            Bug has been updated!
        </div>

        <cfinclude template="bugList.cfm">
    <cfelse>
            <cfinclude template="loginform.cfm">
            <cfabort>
    </cfif>


</body>

</html>