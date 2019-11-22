                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             <%-- 
Document   : laboratory_prescription_search
Created on : Jan 22, 2018, 4:50:59 PM
Author     : user10
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title>LAMIS 3.0</title>
    <jsp:include page="/WEB-INF/views/template/css.jsp"/>

    <jsp:include page="/WEB-INF/views/template/javascript.jsp"/>
    <script type="text/JavaScript">
        var updateRecord = false;
        $(document).ready(function () {
            resetPage();
            reports();

            $("#date1").mask("99/99/9999");
            $("#date1").datepicker({
                dateFormat: "dd/mm/yy",
                changeMonth: true,
                changeYear: true,
                constrainInput: true,
                buttonImageOnly: true,
                buttonImage: "/images/calendar.gif"
            });

            $("#date2").mask("99/99/9999");
            $("#date2").datepicker({
                dateFormat: "dd/mm/yy",
                changeMonth: true,
                changeYear: true,
                constrainInput: true,
                buttonImageOnly: true,
                buttonImage: "/images/calendar.gif"
            });

            $("#ok_button").bind("click", function (event) {
                //if(validateForm()) {
                event.preventDefault();
                event.stopPropagation();
                var reportType = $("input[name=reportType]:checked").val();

                if (reportType == "1") {
                    url = "Baselinevl_due.action";
                } else if (reportType == "2") {
                    url = "Secondvl_due.action";
                } else if (reportType == "3") {
                    url = "Routinevl_due.action";
                } else if (reportType == "4") {
                    url = "Repeatvl_due.action";
                }
                window.open(url);
                //}
                return false;
            });
            $("#cancel_button").bind("click", function (event) {
                $("#lamisform").attr("action", "Clinic_page");
                return true;
            });
        });

        function validateForm() {
            var validate = true;
            // check for valid input is entered
            if ($("#date1").val().length == 0) {
                $("#dateHelp1").html(" *");
                validate = false;
            } else {
                $("#date1").datepicker("option", "altField", "#reportingDateBegin");
                $("#date1").datepicker("option", "altFormat", "mm/dd/yy");
                $("#dateHelp1").html("");
            }
            if ($("#date2").val().length == 0) {
                $("#dateHelp2").html(" *");
                validate = false;
            } else {
                $("#date2").datepicker("option", "altField", "#reportingDateEnd");
                $("#date2").datepicker("option", "altFormat", "mm/dd/yy");
                $("#dateHelp2").html("");
            }
            return validate;
        }
    </script>
</head>

<body>
<jsp:include page="/WEB-INF/views/template/header.jsp"/>
<jsp:include page="/WEB-INF/views/template/nav_report.jsp"/>
<ol class="breadcrumb">
    <li class="breadcrumb-item"><a href="Home_page.action">Home</a></li>
    <li class="breadcrumb-item"><a href="Visualizer_page.action">Report</a></li>
    <li class="breadcrumb-item active" aria-current="page">Patients Due For Viral Load Test</li>
</ol>
<form id="lamisform" theme="css_xhtml">
    <div class="row">
        <div class="col-md-10 ml-auto mr-auto">
            <div class="card">
                <div class="card-body">
                    <div id="messageBar"></div>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="card-title">Viral Load Reporting</div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6 form-group">
                            <div class="form-check form-check-radio">
                                <label class="form-check-label">
                                    <input type="radio" name="reportType" value="1" class="form-check-input" checked/>
                                    <span class="form-check-sign"></span> Patients due for Baseline Viral Load Test
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6 form-group">
                            <div class="form-check form-check-radio">
                                <label class="form-check-label">
                                    <input type="radio" name="reportType" value="2" class="form-check-input"/>
                                    <span class="form-check-sign"></span> Patients due for Second Viral Load Test
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6 form-group">
                            <div class="form-check form-check-radio">
                                <label class="form-check-label">
                                    <input type="radio" name="reportType" value="3" class="form-check-input"/>
                                    <span class="form-check-sign"></span> Patients due for Routine Viral Load Test
                                    (Suppressed)
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6 form-group">
                            <div class="form-check form-check-radio">
                                <label class="form-check-label">
                                    <input type="radio" name="reportType" value="4" class="form-check-input"/>
                                    <span class="form-check-sign"></span> Patients due for Repeat Viral Load Test
                                    (Un-suppressed)
                                </label>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-6 pull-right">
                        <button id="ok_button" class="btn btn-info">Ok</button>
                        <button id="cancel_button" class="btn btn-default">Cancel</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</form>
<jsp:include page="/WEB-INF/views/template/footer.jsp"/>

</body>
</html>
