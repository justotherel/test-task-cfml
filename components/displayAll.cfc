<div class="p-2 d-flex page-container justify-content-center">

    <div class="card errors-container fuid">
        <div class="row list-group" style="background-color: ##f2f2f2">
            <cfoutput query='allIssues'>
                <div class="list-group-item col-xs-12">
                    <div class="card-body">

                        <h5 class="card-title">Issue ###allIssues.id#
                            #allIssues.short_decsription#
                            <span
                                class="badge status-#statusOptions.id[allIssues.status]#">#statusOptions.status[allIssues.status]#</span>
                            <span
                                class="badge u-#urgencyOptions.id[allIssues.urgency]#">#urgencyOptions.urgency[allIssues.urgency]#</span>
                            <span
                                class="badge s-#severityOptions.id[allIssues.severity]#">#severityOptions.severity[allIssues.severity]#</span>
                        </h5>
                        <h6 class="card-title text-secondary">Created
                            by
                            #allIssues.created_by#
                            on #DateFormat(allIssues.created_at, 'eeee d, mmmm yyyy,
                            at H:mm')#
                        </h6>
                        <p class="card-text">
                            #allIssues.description#
                        </p>
                        <a href='index.cfm?issueID=#allIssues.id#' class='btn btn-primary' data-toggle="modal"
                            data-target="###allIssues.id#">Edit</a>
                    </div>
                </div>
            </cfoutput>
        </div>
    </div>
</div>