<cfif structKeyExists(Form, 'logInBtn' ) AND structKeyExists(url, 'action' )>

    <cfset userController=createObject('component', 'test.components.userController' ) />
    <cfset errors=userController.validateUser(form.usernameInput, form.passwordInput) />

    <cfif arrayIsEmpty(errors)>

        <cfset isLoggedIn=userController.login(form.usernameInput, form.passwordInput)>

    </cfif>

    <cfif structKeyExists(session, 'loggedUser' )>
        <cflocation url="index.cfm" addToken='no'>
    </cfif>

</cfif>

<cfif structKeyExists(Form, 'signupBtn' ) AND structKeyExists(url, 'action' )>

    <cfset userController=createObject('component', 'test.components.userController' ) />
    <cfset errors=userController.validateUser(form.usernameInput, form.passwordInput, form.firstNameInput,
        form.surnameInput) />

    <cfif arrayIsEmpty(errors)>

        <cfset isLoggedIn=userController.signup(form.usernameInput, form.passwordInput, form.firstNameInput, form.surnameInput)>

    </cfif>

    <cfif structKeyExists(session, 'loggedUser' )>
        <cflocation url="index.cfm" addToken='no'>
    </cfif>

</cfif>


<cfif structKeyExists(url, 'signup' )>

    
    <cf_front title='Issue Manager - Sign up'>

        <div class="p-2 d-flex  justify-content-center">

            <div class="card loginform-container" style='width: 20rem'>
                <div class="row list-group" style="background-color: ##f2f2f2">
                    <cfoutput>
                        <div class="list-group-item col-xs-12">
                            <div class="card-body text p-1">
                                <div class='text-center'>
                                    <h5>Create new account</h5>
                                </div>
                                <form id='loginForm' name='loginForm' method='POST' action='login.cfm?action=signup'>

                                    <cfif structKeyExists(variables, 'errors' ) AND NOT arrayIsEmpty(errors)>
                                        <div class="alert alert-danger p-2" role="alert">
                                            <cfoutput>
                                                <cfloop array="#errors#" item="message">
                                                    Erros: #message# <br>
                                                </cfloop>
                                            </cfoutput>
                                        </div>
                                    </cfif>

                                    <cfif structKeyExists(variables, 'isLoggedIn' ) AND isLoggedIn==false>
                                        <cfoutput>

                                            <div class="alert alert-danger p-2" role="alert">
                                                Error: User with such username already exists
                                            </div>
                                        </cfoutput>
                                    </cfif>


                                    <div class="form-group pb-2">
                                        <label class='pb-2' for="usernameInput">Username</label>
                                        <input type="text" class="form-control" name='usernameInput' id="usernameInput"
                                            placeholder="Enter your username">
                                    </div>
                                    <div class="form-group pb-2">
                                        <label class='pb-2' for="usernameInput">First name</label>
                                        <input type="text" class="form-control" name='firstNameInput'
                                            id="firstNameInput" placeholder="Enter your username">
                                    </div>
                                    <div class="form-group pb-2">
                                        <label class='pb-2' for="usernameInput">Surname</label>
                                        <input type="text" class="form-control" name='surnameInput' id="surnameInput"
                                            placeholder="Enter your username">
                                    </div>
                                    <div class="form-group pb-2">
                                        <label class='pb-2' for="passwordInput">Password</label>
                                        <input type="password" class="form-control" name='passwordInput'
                                            id="psswordInput" placeholder="Enter your password">
                                    </div>

                                    <div class="form-group py-2">
                                        <input id='signupBtn' name='signupBtn' type='submit' class='btn btn-primary'
                                            value='Sign up' />
                                        <a href='login.cfm' class='btn btn-success'>Log into existing account</a>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </cfoutput>
                </div>
            </div>
        </div>

    </cf_front>

        <cfelse>

    <cf_front title='Issue Manager - Log in'>

            <div class="p-2 d-flex  justify-content-center">

                <div class="card loginform-container" style='width: 20rem'>
                    <div class="row list-group" style="background-color: ##f2f2f2">
                        <cfoutput>
                            <div class="list-group-item col-xs-12">
                                <div class="card-body text p-1">
                                    <div class='text-center'>
                                        <h5>Log in</h5>
                                    </div>
                                    <form id='loginForm' name='loginForm' method='POST' action='login.cfm?action=login'>

                                        <cfif structKeyExists(variables, 'errors' ) AND NOT arrayIsEmpty(errors)>
                                            <div class="alert alert-danger p-2" role="alert">
                                                <cfoutput>
                                                    <cfloop array="#errors#" item="message">
                                                        Erros: #message# <br>
                                                    </cfloop>
                                                </cfoutput>
                                            </div>
                                        </cfif>

                                        <cfif structKeyExists(variables, 'isLoggedIn' ) AND isLoggedIn==false>
                                            <cfoutput>

                                                <div class="alert alert-danger p-2" role="alert">
                                                    Error: Invalid credantials
                                                </div>
                                            </cfoutput>
                                        </cfif>


                                        <div class="form-group pb-2">
                                            <label class='pb-2' for="usernameInput">Username</label>
                                            <input type="text" class="form-control" name='usernameInput'
                                                id="usernameInput" placeholder="Enter your username">
                                        </div>
                                        <div class="form-group pb-2">
                                            <label class='pb-2' for="passwordInput">Password</label>
                                            <input type="password" class="form-control" name='passwordInput'
                                                id="psswordInput" placeholder="Enter your password">
                                        </div>

                                        <div class="form-group py-2">
                                            <input id='logInBtn' name='logInBtn' type='submit' class='btn btn-primary'
                                                value='Log in' />
                                            <a href='login.cfm?signup' class='btn btn-success'>Create an account</a>
                                        </div>
                                    </form>


                                </div>
                            </div>
                        </cfoutput>
                    </div>
                </div>
            </div>

    </cf_front>

    </cfif>

