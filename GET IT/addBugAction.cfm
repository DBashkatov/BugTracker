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
        <cfquery name="UploadBug" datasource="get_it">
            INSERT INTO bug(person, createDate, shortDescription, longDescription, status, urgency, cruciality)
            VALUES ('#GetAuthUser()#', #Now()# ,'#Form.shortDescription#', '#Form.longDescription#', 'New',
            '#Form.urgency#', '#Form.cruciality#')
        </cfquery>

        <div class="message message--success">
            Bug has been added!
        </div>

        <cfinclude template="bugList.cfm">

    <cfelse>
        <cfinclude template="loginform.cfm">
        <cfabort>
    </cfif>

</body>

</html>