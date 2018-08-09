<%-- 
    Document   : resultsList
    Created on : 1 Aug, 2018, 2:56:23 PM
    Author     : wrtrg2
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="../UItemplate/header2.jsp" %>
    <body>
        <div class="row">
            <div class="col-lg-offset-1 col-lg-10" style="margin: 80px;">
                <table id="resultsListDatable" class="table table-responsive table-bordered">
                    <thead>
                        <tr>
                            <th>Sr.No</th>
                            <th>Name</th>
                            <th>Marks</th>
                            <th>Time Taken</th>
                            <th>Has Submit</th>
                            <th>Re-Test</th>
                        </tr>
                    </thead>
                    <tbody>

                    </tbody>
                </table>
            </div>
        </div>
        <script src="resources/js/resultsJS.js" type="text/javascript"></script>
    </body>
</html>
