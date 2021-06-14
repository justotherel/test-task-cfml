<cfset statusOptions=application.issueController.getStatusOptions() />
<cfset severityOptions=application.issueController.getSeverityOptions() />
<cfset urgencyOptions=application.issueController.getUrgencyOptions() />

<cf_editIssueModal id='createIssueModal' title='Open New Issue' action='create' />

<cfif isDefined('url.issueID')>

    <cf_front title='Issue Editor - issue ###url.issueID#'>

        <cfset issue=application.issueController.getIssueByID(url.issueID) />
        <cfset issueHistory=application.issueController.getIssueHistory(url.issueID) />
        <cfset statuses='' />

        <cfif statusOptions.status[issue.status]=='New'>
            <cfset statuses=queryNew("id, status","Integer,Varchar", [ {id=2,status="Open" } ])>
                <cfelseif statusOptions.status[issue.status]=='Open'>
                    <cfset statuses=queryNew("id, status","Integer,Varchar", [ {id=3,status="Solved" } ])>
                        <cfelseif statusOptions.status[issue.status]=='Solved'>
                            <cfset statuses=queryNew("id, status","Integer,Varchar", [ {id=2,status="Open" }, {id=4,
                                status="Closed" } ])>
        </cfif>

        <cfinclude template="components/editIssuePage.cfc">

    </cf_front>

    <cfelse>

        <cf_front title='Issue Manager'>

            <cfset allIssues = ''/>

            <cfif isDefined('url.orderBy')>

                <cfscript>

                    param = url.orderBy;

                    switch(param) {
                        
                        case "status":
                            allIssues = application.issueController.getIssues('status');
                            break;
                        case "severity":
                            allIssues = application.issueController.getIssues('severity');
                            break;
                        case "urgency":
                            allIssues = application.issueController.getIssues('urgency');
                            break;
                        case "date":
                            allIssues = application.issueController.getIssues('created_at');
                            break;
                        case "user":
                            allIssues = application.issueController.getIssues('created_by');
                            break;
                        default:
                            allIssues=application.issueController.getAllIssues()
                            break;
                    }

                </cfscript>
            
            <cfelse>
            
                <cfset allIssues=application.issueController.getAllIssues()/>

            </cfif>

            <cfinclude template="components/displayAll.cfc">

        </cf_front>

</cfif>