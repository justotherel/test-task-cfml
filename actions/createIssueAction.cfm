<cfif structKeyExists(Form, 'createIssue' )>

    
    <cfset username = session.loggedUser.username>
    <cftransaction>
        <cfset
            createIssueQ=application.issueController.createIssue('#form.shortDescriptionInput#', '#form.descriptionInput#'
            , '#form.urgencyInput#' , '#form.severityInput#' , '#username#', 'Entered', 'Issue created.') />
    </cftransaction>
    
</cfif>

<cflocation url = "http://127.0.0.1:8500/test/index.cfm" addToken = "no">