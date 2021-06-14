<cf_front title='Issue Manager - Users'>

    <cfset userController=createObject('component', 'test.components.userController' ) />
    <cfset users=userController.getAllUsers() />

    <div class="p-2 d-flex page-container justify-content-center">

        <div class="card errors-container fuid">
            <div class="row list-group" style="background-color: ##f2f2f2">
            <div class="list-group-item text-center col-xs-12">
            <h3>Users</h3>
            </div>
                <cfoutput query='users'>
                    <div class="list-group-item col-xs-12">
                        <div class="card-body">
                            <h5 class="card-title">#users.firstname# '#users.username#' #users.surname#
                            </h5>

                        </div>
                    </div>
                </cfoutput>
            </div>
        </div>
    </div>

</cf_front>