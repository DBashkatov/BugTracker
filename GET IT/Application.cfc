<cfcomponent>
        <cfset This.name = "Orders">
        <cfset This.Sessionmanagement="True">
        <cfset This.loginstorage="session">
        
        <!---Logout--->
        <cffunction name="OnRequestStart">
        <cfargument name = "request" required="true"/>
            <cfif IsDefined("Form.logout")>
                <cflogout>
            </cfif>
            
        <!---Check if user is logged in--->
            <cflogin>
                <cfif NOT IsDefined("cflogin")>
                    <cfinclude template="login.cfm">
                    <cfabort>
                    
        <!---Form is submitted correctly--->
                <cfelse>
                    <cfquery name="loginQuery" dataSource="get_it">
                        SELECT username
                        FROM dbo.person
                        WHERE
                        username = '#cflogin.name#'
                        AND password = '#cflogin.password#'
                    </cfquery>
                    
        <!---Login user if credentials are correct--->
                <cfif loginQuery.username NEQ "">
                    <cfloginuser name="#cflogin.name#" Password = "#cflogin.password#"
                    roles="user">
                    
        <!---Wrong credentials--->
                <cfelse>
                    <cfoutput>
                        <div class="message message--error">
                               Wrong username or password.
                        </div>
                    </cfoutput>
                    <cfinclude template="login.cfm">
                    <cfabort>
                </cfif>
                </cfif>
            </cflogin>
                 
	</cffunction>
</cfcomponent>