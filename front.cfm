<cfparam name="attributes.title" default="Issue Manager">
    <cfif thistag.executionMode EQ 'start'>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8" />
            <meta http-equiv="X-UA-Compatible" content="IE=edge" />
            <meta name="viewport" content="width=device-width, initial-scale=1.0" />
            <title>
                <cfoutput>#attributes.title#</cfoutput>
            </title>

            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet"
                integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x"
                crossorigin="anonymous">

            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4"
                crossorigin="anonymous"></script>

        </head>

        <style>
            html,
            body {
                height: 100%;
                margin: 0;
                background-color: #f1f1f1;
                overflow-x: hidden !important;
            }

            .Opened,
            .status-2,
            .u-3,
            .s-3 {
                background-color: #ffc107;
            }

            .u-1,
            .s-1 {
                background-color: #dc3545;
            }

            .u-2,
            .s-2 {
                background-color: #fd7e14;
            }

            .status-1 {
                background-color: #17a2b8;
            }

            .Entered {
                background-color: #6c757d;
            }

            .Solved,
            .status-3,
            .u-4,
            .s-4 {
                background-color: #28a745;
            }

            .Closed,
            .status-4 {
                background-color: #343a40;
            }
        </style>

        <body>
            <cfinclude template="components/navbar.cfc" />
    
    <cfelse>
                <div class="footer pt-4 d-flex justify-content-center">
                    <p>Test task, 2021</p>
                </div>
        </body>


    </cfif>

    </html>