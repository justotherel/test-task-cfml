<div class="p-2 d-flex justify-content-center">
    <div class=" errors-container fuid d-flex justify-content-center">
        <div class='row'>
            <div class="col" style="background-color: ##f2f2f2; width: 36rem">
                <cfoutput>
                    <div class="list-group-item col-xs-6">
                        <div class="card-body">
                            <h5 class="card-title">Issue ###issue.id#
                                #issue.short_decsription#
                                <span class="badge status-#issue.status#">#statusOptions.status[issue.status]#</span>
                                <span
                                    class="badge bg-warning u-#issue.urgency#">#urgencyOptions.urgency[issue.urgency]#</span>
                                <span
                                    class="badge bg-danger s-#issue.severity#">#severityOptions.severity[issue.severity]#</span>
                            </h5>
                            <h6 class="card-title text-secondary">Issue registered
                                by
                                #issueHistory.username#
                                on #DateFormat(issueHistory.created_at, 'eeee d, mmmm yyyy,
                                at H:mm')#
                            </h6>
                            <cfform method='POST' id='editIssueFrom' name='editIssueFrom'
                                action='actions/updateIssueAction.cfm?issueID=#issue.id#'>

                                <div class="form-group pb-2">
                                    <!---             <label for="shortDescriptionInput">Short description of an issue</label> --->
                                    <input readonly type="text" class="form-control" id="shortDescriptionInput"
                                        aria-describedby="emailHelp" placeholder="Short description of an issue"
                                        value='#issue.short_decsription#'>
                                </div>
                                <div class="form-group pb-2">
                                    <!---             <label for="descriptionInput">Detailed description of a problem</label> --->
                                    <textarea readonly class="form-control" id="descriptionInput"
                                        placeholder="Detailed description of a problem">#issue.description#</textarea>
                                </div>
                                <div class='form-group pb-2'>
                                    <label class='pb-2' for='severityInput'>Severity</label>


                                    <cfselect readonly name='severityInput' id='severityInput'
                                        class="form-control form-control-sm" query='severityOptions' value='id'
                                        display='severity' queryposition='below'>
                                        <option value='0'>
                                            #severityOptions.severity[issue.severity]#
                                        </option>
                                    </cfselect>
                                </div>
                                <div class='form-group pb-2'>
                                    <label class='pb-2' for='urgencyInput'>Urgency</label>
                                    <cfselect readonly name='urgencyInput' id='urgencyInput'
                                        class="form-control form-control-sm" query='urgencyOptions' value='id'
                                        display='urgency' queryposition='below'>
                                        <option value='0'>
                                            #urgencyOptions.urgency[issue.urgency]#
                                        </option>
                                    </cfselect>
                                </div>

                                <cfif statuses !==''>
                                    <div class="form-group pb-2">
                                        <label class='pb-2' for='statusInput'>Status -
                                            #statusOptions.status[issue.status]#</label>
                                        <cfselect name='statusInput' id='statusInput'
                                            class="form-control form-control-sm" query='statuses' value='id'
                                            display='status' queryposition='below'>
                                            <option value='0'>
                                                #statusOptions.status[issue.status]#
                                            </option>
                                        </cfselect>
                                    </div>
                                    <div class="form-group pb-2">
                                        <!---             <label for="descriptionInput">Detailed description of a problem</label> --->
                                        <cftextarea class="form-control" id="commentInput" name="commentInput"
                                            placeholder="Commentary on issue status change" />
                                    </div>

                                    <div class="form-group pt-2">
                                        <button type='submit' id='editIssue' name='editIssue'
                                            class="btn btn-primary">Save
                                            changes</button>
                                        <a href='index.cfm' class="btn btn-secondary">Close</a>
                                    </div>

                                    <cfelse>

                                        <div class='form-group pb-2'>
                                            <label class='pb-2' for='statusInput'>Status -
                                                #statusOptions.status[issue.status]#</label>

                                            <input readonly type="text" class="form-control" id="statusIsClosed"
                                                aria-describedby="emailHelp" placeholder="Closed">

                                        </div>

                                        <div class="form-group pt-2">
                                            <!---             <label for="descriptionInput">Detailed description of a problem</label> --->
                                            <textarea readonly class="form-control" id="commentInput"
                                                name="commentInput" placeholder="Issue closed"></textarea>
                                        </div>

                                        <div class="form-group">
                                            <a href='index.cfm' class="btn btn-secondary">Close</a>
                                        </div>
                                </cfif>
                            </cfform>
                        </div>
                    </div>
                </cfoutput>
            </div>
            <div class="col list-group" style="background-color: ##f2f2f2; width: 36rem">
                <cfoutput query=issueHistory>
                    <div class="list-group-item col-xs-12">
                        <div class="card-body">
                            <h5 class="card-title">Issue ###issueHistory.issue_id#
                                <span class="badge #issueHistory.type#">#issueHistory.type#</span>
                            </h5>
                            <h6 class="card-title text-secondary">Issue's status changed
                                by
                                #issueHistory.username#
                                on #DateFormat(issueHistory.created_at, 'eeee d, mmmm yyyy,
                                at H:mm')#
                            </h6>
                            <p class="card-text">
                                #issueHistory.commentary#
                            </p>
                        </div>
                    </div>
                </cfoutput>
            </div>
        </div>
    </div>
</div>