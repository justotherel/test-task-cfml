<cfcomponent output='false'>

    <cffunction name="validateUser" access='public' output='false' returntype='array'>
        <cfargument name="username" type='string' required='true' />
        <cfargument name="password" type='string' required='true' />
        <cfargument name="firstname" type='string' required='false' />
        <cfargument name="surname" type='string' required='false' />

        <cfset var errors=arrayNew(1) />

        <cfif arguments.username==''>
            <cfset arrayAppend(errors, 'Username is empty' ) />
        </cfif>

        <cfif structKeyExists(arguments, 'firstname' )>
            <cfif arguments.firstname==''>
                <cfset arrayAppend(errors, 'First name is empty' ) />
            </cfif>

            <cfif arguments.surname==''>
                <cfset arrayAppend(errors, 'Surname is empty' ) />
            </cfif>
        </cfif>

        <cfif arguments.password==''>
            <cfset arrayAppend(errors, 'Password is empty' ) />
        </cfif>

        <cfreturn errors />

    </cffunction>

    <cffunction name="signup" access='public' output='false' returntype='boolean'>
        <cfargument name="username" type='string' required='true' />
        <cfargument name="password" type='string' required='true' />
        <cfargument name="firstname" type='string' required='false' />
        <cfargument name="surname" type='string' required='false' />

        <cfset var isSignedUp=false />

        <cfquery name='doesExist'>
            SELECT username FROM [CFMLDB].[dbo].[users]
            WHERE username = '#arguments.username#'
        </cfquery>

        <cfif doesExist.recordCount==0>

            <cftry>

                <cfquery name='userSignUp'>
                    INSERT INTO users
                    (username, firstname, surname, password)
                    VALUES ('#arguments.username#', '#arguments.firstname#', '#arguments.surname#',
                    '#arguments.password#')
                </cfquery>

                <cflogin>
                    <cfloginuser name='#arguments.firstname# #arguments.surname#' password="#arguments.password#"
                        roles="user">
                </cflogin>

                <cfset
                    session.loggedUser={'name'=arguments.firstname, 'surname'=arguments.surname, 'username'=arguments.username} />
                <cfset var isSignedUp=true />


                <cfcatch type="any">
                    Error: <cfoutput>#cfcatch.message#</cfoutput>
                </cfcatch>

            </cftry>

        </cfif>

        <cfreturn isSignedUp>

    </cffunction>

    <cffunction name="login" access='public' output='false' returntype='boolean'>
        <cfargument name="username" type='string' required='true' />
        <cfargument name="password" type='string' required='true' />

        <cfset var isLoggedIn=false />

        <cfquery name='userLogin'>
            SELECT * FROM [CFMLDB].[dbo].[users]
            WHERE username = '#arguments.username#' AND password = '#arguments.password#'
        </cfquery>

        <cfif userLogin.recordCount EQ 1>
            <cflogin>
                <cfloginuser name="#userLogin.firstname# #userLogin.surname#" password="#userLogin.password#"
                    roles="user">
            </cflogin>
            <cfset
                session.loggedUser={'name'=userLogin.firstname, 'surname'=userLogin.surname, 'username'=userLogin.username} />
            <cfset var isLoggedIn=true />
        </cfif>

        <cfreturn isLoggedIn>

    </cffunction>

    <cffunction name="logout" access='public' output='false' returntype='void'>
        <cfset structDelete(session, 'loggedUser' ) />
        <cflogout />
    </cffunction>

    <cffunction  name="getAllUsers" access='public' returntype='query'>

        <cfset var users = ''>

        <cfquery name='users'>
            SELECT username, firstname, surname FROM users 
            ORDER BY surname ASC
        </cfquery>

        <cfreturn users>

    </cffunction>


</cfcomponent>