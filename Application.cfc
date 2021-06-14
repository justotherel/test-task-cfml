<cfcomponent output="false">
    <cfset this.name='IssueManager' />
    <cfset this.datasource='CFMLDB' />
    <cfset this.sessionManagement=true />
    <cfset this.sessionTimeout=createTimespan(0,0,10,0) />

    <!---OnApplicationStart() method--->
    <cffunction name="onApplicationStart" returntype="boolean">
        <cfset application.issueController=createObject('component', 'test.components.issueController' ) />
        <cfreturn true />
    </cffunction>

    <!---onRequestStart() method--->
    <cffunction name="onRequestStart" returntype="boolean">
        <cfargument name="targetPage" type="string" required="true" />
        <!---handle some special URL parameters--->
        <cfif NOT isUserLoggedIn()>
            <cfif arguments.targetPage != '/test/login.cfm'>
                <cflocation url="login.cfm?accessDenied" addToken='no'>
            </cfif>
        </cfif>
        <cfif isDefined('url.restartApp')>
            <cfset this.onApplicationStart() />
        </cfif>
        <!---Implement ressource Access control for the 'admin' folder--->
        <!---         <cfif listFind(arguments.targetPage,'admin', '/' ) AND (NOT isUserLoggedIn() OR NOT 
            isUserInRole('Administrator'))>
            <cflocation url="/final/index.cfm?noaccess" />

        </cfif>
        --->
        <cfreturn true />
    </cffunction>
</cfcomponent>