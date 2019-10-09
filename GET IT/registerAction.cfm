<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Bug Tracking System</title>

    <link href="https://fonts.googleapis.com/css?family=Roboto:400,700|Share+Tech+Mono&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="style.css">
</head>

<body>

   <!-- Check if username is free -->
    <cfquery name="registerQuery" dataSource="get_it">
        SELECT username FROM person
        WHERE username='#Form.username#'
    </cfquery>
            
    <!-- Validate password -->
    <cfif #Form.password# NEQ #Form.confirmPassword#>
        <div class="message message--error">
            Passwords should match
        </div>
        
        <cfinclude template="register.cfm">
        <cfabort>

    <cfelseif registerQuery.RecordCount NEQ 0 >
        <div class="message message--error">
                Username is already taken
        </div>
                
        <cfinclude template="register.cfm">
        <cfabort>
                    
    <cfelse>
        <!-- Add user -->
        <cfquery name="registerQuery" dataSource="get_it">
            INSERT INTO person(username, password)
            VALUES ('#Form.username#', '#Form.password#')
        </cfquery>
        
        <div class="message message--success">
            User has been registred!
        </div>


        <cfinclude template="userList.cfm">
            
    </cfif>

</body>

</html>