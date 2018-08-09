<%@page import="java.text.DateFormat"%>
<%@page import="com.iocl.quiz.TimeUtil"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <%@include file="../UItemplate/header2.jsp" %>
    <body style="background-image: url(resources/images/instructs.jpg);">
        <div class="container">
            
            <c:if test="${ROLE == 'USER'}">
            <div class="row text-center" style="padding: 25px;">
                <h2>Instructions for Solving Quiz</h2>
            </div>
            <div class="row" style="font-weight: 800;font-family: serif;margin-bottom: 34px;text-shadow: 9px 10px 45px black;">
                <c:forEach items="${quizInstructions}" var="quizInstruction" varStatus="count">
                    <span class="col-lg-12" style="font-size: 20px;padding: 3px;">
                        ${quizInstruction.insID}. ${quizInstruction.insDesc}
                    </span>
                </c:forEach>
            </div>
            <%! boolean valid = false; %>
            <%! boolean valid2 = true; %>
            <% 
            HttpSession ses = request.getSession();
//            Date start_time = new SimpleDateFormat("dd//mm/yyyy").parse((String)ses.getAttribute("start_time"));
//            Date now_time = new SimpleDateFormat("dd//mm/yyyy").parse((String)ses.getAttribute("now_date"));
            
            Date start_time = TimeUtil.convertToDate((String)ses.getAttribute("start_time"));
            System.out.println("date 1 done!"+start_time);
            DateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss");
            Date now_time = dateFormat.parse((String)ses.getAttribute("now_date"));
            
            
            if(start_time.before(now_time) || start_time.equals(now_time)){
                valid = true;
                valid2 = false;
            }else{
                valid = false;
                valid2 = true;
            }
            %>
            <c:if test="<%=valid%>">
                <div class="row text-center">
                    <a href="/CustomQuiz/exam" class="button button-raised button-primary"><i class="fa fa-thumbs-up"></i> Take Test</a>
                </div>
            </c:if>
            
            <c:if test="<%=valid2%>">
                <div class="row text-center">
                    <p style="font-size: 20px">:TEST COUNTDOWN:</p>
                    <span id="timeIs" data-seconds="${time_Remaining}" style="font-size: 32px"></span>
                </div>
            </c:if>
            </c:if>
            <c:if test="${ROLE == 'ADMIN'}">
                <div class="text-center row" style="margin-top: 132px;padding: 19px;">
                    <a href="ResultController?url=Masters" class="btn1 button button-raised button-highlight button-pill hvr-icon-forward hvr-shadow animated fadeInUp" style="font-size: 24px;">Master
                        <i style="position: relative;left: 19px;" class="fa fa-angle-double-right hvr-icon"></i>
                    </a>
                </div>
                <div class="text-center row" style="padding: 19px;">
                    <a href="ResultController?url=upload" class="btn2 button button-raised button-primary button-pill hvr-icon-forward hvr-shadow animated fadeInUp" style="font-size: 24px;">Upload
                        <i style="position: relative;left: 19px;" class="fa fa-angle-double-right hvr-icon"></i>
                    </a>
                </div>
                <div class="text-center row" style="padding: 19px;">
                    <a href="ResultController?url=empList" class="btn3 button button-raised button-caution button-pill hvr-icon-forward hvr-shadow animated fadeInUp" style="font-size: 24px;">Employee
                        <i style="position: relative;left: 19px;" class="fa fa-angle-double-right hvr-icon"></i>
                    </a>
                </div>
                <div class="text-center row" style="padding: 19px;">
                    <a href="ResultController?url=result" class="btn4 button button-raised button-action button-pill hvr-icon-forward hvr-shadow animated fadeInUp" style="font-size: 24px;">Result
                        <i style="position: relative;left: 19px;" class="fa fa-angle-double-right hvr-icon"></i>
                    </a>
                </div>
            </c:if>
            <c:if test="${ROLE == ''}">
                <h2>Contact IS Team</h2>
            </c:if>
        </div>
        <script src="resources/js/instructionJS.js" type="text/javascript"></script>
    </body>
</html>