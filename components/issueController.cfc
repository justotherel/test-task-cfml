<cfcomponent output='false'>

    <cffunction name="createIssue" access='public' returntype='any'>

        <cfargument name="sd" type="string" required='true' />
        <cfargument name="d" type="string" required='true' />
        <cfargument name="urge" type="numeric" required='true' />
        <cfargument name="svrt" type="numeric" required='true' />
        <cfargument name="crtby" type="string" required='true' />
        <cfargument name="type" type="string" required='true' />
        <cfargument name="comment" type="string" required='true' />

        <cfquery name='insert'>
            INSERT INTO issue
            (short_decsription, description, status, urgency, severity, created_by)

            VALUES ('#arguments.sd#', '#arguments.d#', 1, '#arguments.urge#',
            '#arguments.svrt#', '#arguments.crtby#')

            INSERT INTO issue_history 
            (issue_id, type, commentary, username)

            VALUES (( SELECT TOP 1 id AS myID FROM issue ORDER BY id DESC ), '#arguments.type#', '#arguments.comment#', '#arguments.crtby#')

        </cfquery>
    </cffunction>

    <cffunction  name="getIssues" access='public' returntype='query'>

        <cfargument  name="param">

        <cfset var allIssues='' />

        <cfquery name='allIssues'>
            SELECT * FROM issue
            ORDER BY #arguments.param# ASC
        </cfquery>

        <cfreturn allIssues />

    </cffunction>

    <cffunction name="getAllIssues" access='public' returntype='query'>
    
        <cfset var allIssues='' />
        <cfquery name='allIssues'>
            SELECT * FROM issue
            ORDER BY created_at DESC
        </cfquery>
        <cfreturn allIssues />
    </cffunction>

    <cffunction name="getStatusOptions" access='public' returntype='query'>
        <cfset var statusOptions='' />
        <cfquery name='statusOptions'>
            SELECT id, status
            FROM status
            ORDER BY id ASC
        </cfquery>
        <cfreturn statusOptions />
    </cffunction>

    <cffunction name="getUrgencyOptions" access='public' returntype='query'>
        <cfset var urgencyOptions='' />
        <cfquery name='urgencyOptions'>
            SELECT id, urgency
            FROM urgency
            ORDER BY id ASC
        </cfquery>

        <cfreturn urgencyOptions />
    </cffunction>

    <cffunction name="getSeverityOptions" access='public' returntype='query'>
        <cfset var severityOptions='' />
        <cfquery name='severityOptions'>
            SELECT id, severity
            FROM severity
            ORDER BY id ASC
        </cfquery>
        <cfreturn severityOptions />
    </cffunction>

    <cffunction name="getIssueByID" access='public' returntype='query'>
        <cfargument name="issueID" type='numeric' required='true' />
        <cfset var issue='' />
        <cfquery name='issue'>
            SELECT * FROM issue
            WHERE id = #arguments.issueID#
        </cfquery>
        <cfreturn issue />
    </cffunction>

    <cffunction name="getIssueHistory" access='public' returntype='query'>
        <cfargument name="issueID" type='numeric' required='true' />
        <cfset var issueHistory=''>
            <cfquery name='issueHistory'>
                SELECT * FROM issue_history
                WHERE issue_id = #arguments.issueID#
                ORDER BY created_at ASC
            </cfquery>
            <cfreturn issueHistory />
    </cffunction>

    <cffunction name="updateIssue" access='public' returntype='void'>

        <cfargument name="id" type="numeric" required='true' />
        <cfargument name="status" type="numeric" required='true' />
        <cfargument name="comment" type="string" required='true' />
        <cfargument name="user" type="string" required='true' />

        <cfset issueHtype='' />

        <cfif status==2>
            <cfset issueHtype='Opened' />
            <cfelseif status==3>
                <cfset issueHtype='Solved' />
                <cfelseif status==4>
                    <cfset issueHtype='Closed' />
        </cfif>

        <cfquery >
            UPDATE issue
            SET status = #arguments.status#
            WHERE id = #arguments.id#

            INSERT INTO issue_history
            (issue_id, type, commentary, username)

            VALUES (#arguments.id#, '#issueHtype#', '#arguments.comment#',
            '#arguments.user#')
        </cfquery>
    </cffunction>

</cfcomponent>