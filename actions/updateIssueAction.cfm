<cfif structKeyExists(Form, 'editIssue' )>
    <cfset username = session.loggedUser.username>
    <cfset application.issueController.updateIssue(url.issueID, Form.statusInput, '#form.commentInput#' , '#username#' )/>
    <cflocation url="http://127.0.0.1:8500/test/index.cfm?issueID=#url.issueID#" addToken="no"> 
</cfif>