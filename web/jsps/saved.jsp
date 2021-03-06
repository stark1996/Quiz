<%@ page language="java" import="com.iocl.quiz.*, java.util.ArrayList" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <%@include file="../UItemplate/header2.jsp" %>
    
    <body style="background-image:url(resources/images/exam.jpg);color:black;padding:10px;box-shadow: 0px 2px 15px 0px black;">
        <div id="main" class="row" style="font-style: oblique;font-family: serif;font-size: xx-large">
            <div class="col-lg-12 text-center">
                <h3 style="margin-top: 144px;font-size: 32px;">Your QUIZ results Are saved!</h3>
                <p>Do come back to finish it.</p>
            </div>
        </div>
        <c:if test="${result_flag == 'ON'}">
            <div class="row">
                <div style="display: block;text-align: center;margin-top: 15px;">
                    <button id="but" class="btn btn-info"><span>Click here for updated result</span></button>
                </div>
                <div id="resultTab" class="text-center col-lg-offset-4 col-lg-4" style="margin-top: 28px;"></div>
            </div>
        </c:if>
        <script type="text/javascript">
            $(document).ready(function() {
                $(document).on('click','#but',function() {
                    $.ajax({
                        url:'getResultController',
                        type:'GET',
                        dataType:'json',
                        success:function (data){
                            var results = data;//JSON.parse(data);
                            var html = "<table class='table table-bordered' style='background:aliceblue;'>"+
                            "<tr><td>Highest Marks:</td><td>"+results.highest_marks+"</td></tr>"+
                            "<tr><td>Your Marks:</td><td>"+results.marks+" Out Of "+results.total_marks+"</td></tr>"+
                            "<tr><td>Time Taken to complete</td><td>"+results.timeTaken+" Seconds</td></tr>"+
                            "</table>";
                            $('#resultTab').html(html);
                        },
                        error:function (error){
                            console.log(error.responseText);
                        } 
                    });
                    
                });
            })
        </script>
    </body>
</html>