<cfoutput>
    <cfif attributes.action=='create'>

        <cfset severityOptions=application.issueController.getSeverityOptions() />
        <cfset urgencyOptions=application.issueController.getUrgencyOptions() />

        <cfform method='POST' id='createIssueFrom' name='createIssueForm' action='actions/createIssueAction.cfm'>
            <div class="form-group pb-2">
                <!--- <label for="shortDescriptionInput">Short description of an issue</label> --->
                <input type="text" class="form-control" name='shortDescriptionInput' id="shortDescriptionInput"
                    aria-describedby="emailHelp" placeholder="Short description of an issue">
            </div>
            <div class="form-group pb-2">
                <!--- <label for="descriptionInput">Detailed description of a problem</label> --->
                <textarea class="form-control" name='descriptionInput' id="descriptionInput"
                    placeholder="Detailed description of a problem"></textarea>
            </div>
            <div class='form-group pb-2'>
                <label class='pb-2' for='severityInput'>Severity</label>
                <cfselect name='severityInput' id='severityInput' class="form-control form-control-sm"
                    query='severityOptions' value='id' display='severity' queryposition='below'>
                    <option value='0'>Select the severity of the issue</option>
                </cfselect>
            </div>
            <div class='form-group pb-2'>
                <label class='pb-2' for='urgencyInput'>Urgency</label>
                <cfselect name='urgencyInput' id='urgencyInput' class="form-control form-control-sm"
                    query='urgencyOptions' value='id' display='urgency' queryposition='below'>
                    <option value='0'>Select the urgency of the issue</option>
                </cfselect>
            </div>
            <input type='submit' class="btn btn-primary" id='createIssue' name='createIssue' value='Open new issue' />
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        </cfform>
    </cfif>
</cfoutput>