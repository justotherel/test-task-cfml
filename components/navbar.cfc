<cfif structKeyExists(url, 'logout' )>
    <cfset userController=createObject('component', 'test.components.userController' ).logout() />
    <cflocation url="login.cfm" addToken='no'>
</cfif>

<nav class="navbar navbar-expand-lg navbar-light bg-light sticky-top">
    <div class="container-fluid">
        <a href='index.cfm' class="navbar-brand">Issue Manager</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
            aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">

                <cfif cgi.script_name=='/test/index.cfm' AND NOT structKeyExists(url, 'issueID' )>
                    <li class="nav-item">
                        <div class="dropdown px-2">
                            <a class="btn btn-outline-info dropdown-toggle" href="#" role="button" id="dropdownMenuLink"
                                data-bs-toggle="dropdown" aria-expanded="false">
                                Order by
                            </a>
                            <ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                                <li><a class="dropdown-item" href="index.cfm?orderBy=id">Issue id</a></li>
                                <li><a class="dropdown-item" href="index.cfm?orderBy=status">Issue status</a></li>
                                <li><a class="dropdown-item" href="index.cfm?orderBy=severity">Issue severity</a></li>
                                <li><a class="dropdown-item" href="index.cfm?orderBy=urgency">Issue urgency</a></li>
                                <li><a class="dropdown-item" href="index.cfm?orderBy=date">Issue creation date</a></li>
                                <li><a class="dropdown-item" href="index.cfm?orderBy=user">Username</a></li>
                            </ul>
                        </div>
                    </li>

                </cfif>

                <li class='nav-item px-2'>
                    <a href='users.cfm' class="btn btn-outline-primary">View users</a>
                </li>

                <cfif structKeyExists(session, 'loggeduser' )>

                    <li class="nav-item px-2">
                        <button class="btn btn-outline-success" data-bs-toggle="modal"
                            data-bs-target="#createIssueModal">Open new
                            issue</button>
                    </li>
                    <li class="nav-item px-2">

                        <a href='login.cfm?logout' class="btn btn-outline-danger">Log out</a>
                    </li>
                </cfif>
            </ul>
        </div>
    </div>
</nav>