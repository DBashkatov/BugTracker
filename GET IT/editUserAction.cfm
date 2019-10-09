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

        <!-- Update User Profile -->
        <cfquery name="UpdateUser" datasource="get_it">
            UPDATE person
            SET firstName='#Form.firstName#', lastName='#Form.lastName#'
            WHERE username='#GetAuthUser()#'
        </cfquery>

        <div class="message message--success">
            Profile has been updated!
        </div>

        <cfinclude template="editUser.cfm">
    <cfelse>
        <cfinclude template="loginform.cfm">
        <cfabort>
    </cfif>

</body>

</html>