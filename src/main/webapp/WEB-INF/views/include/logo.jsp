<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!--topHeader-->
 <%-- <div class="fullGrid center logoBarbg slideposi">
	<div class="wrapperIn positionR">
    	<div class="logoBarLeft"><a href="${pageContext.request.contextPath}/home"><img src="${pageContext.request.contextPath}/resources/newpos/images/madhvi_logo.jpg" alt="monginis"></a></div>  
         <c:choose>
               <c:when test = "${isSpDayShow ==true}">
                    <a class="special-day" href="${pageContext.request.contextPath}/showSpDayCake"> Advance Order </a>
              </c:when>
               <c:otherwise>
              </c:otherwise>
              </c:choose>
 <input type="hidden" id="achievedTarget" value="${sessionScope.achievedTarget}">
       <input type="hidden" id="target" value="${sessionScope.fraTarget}">
        <div class="logoBarRight">
       
        <a href="#" class="signout"><i class="fa fa-power-off" aria-hidden="true"></i></a>
      
        <div id="menuzord" class="menuzord red menuzord-responsive"> --%>
<!--            <div id="chart_div" style="width: 120px;height: 70px;  float: left;margin-right: 20px;"></div>
 -->          <%--  <ul class="menuzord-menu menuzord-right menuzord-indented scrollable">
           
               <c:choose>
                  <c:when test="${frDetails.frRate=='0'}"> <li><img class="mngimg" src="${pageContext.request.contextPath}/resources/images/star0.5.png" alt="monginis" style="height: 30px;"></li> </c:when>
                   <c:when test="${frDetails.frRate=='1'}">  <li><img class="mngimg" src="${pageContext.request.contextPath}/resources/images/star1.png" alt="monginis" style="height: 30px;"></li> </c:when> 
                    <c:when test="${frDetails.frRate=='2'}">  <li><img class="mngimg" src="${pageContext.request.contextPath}/resources/images/star1.5.png" alt="monginis" style="height: 30px;"></li> </c:when>
                     <c:when test="${frDetails.frRate=='3'}">  <li><img class="mngimg" src="${pageContext.request.contextPath}/resources/images/star2.png" alt="monginis" style="height: 30px;"></li> </c:when>
                      <c:when test="${frDetails.frRate=='4'}">  <li><img class="mngimg" src="${pageContext.request.contextPath}/resources/images/star2.5.png" alt="monginis" style="height: 30px;"></li> </c:when>
                       <c:when test="${frDetails.frRate=='5'}">  <li><img class="mngimg" src="${pageContext.request.contextPath}/resources/images/star3.png" alt="monginis" style="height: 30px;"></li> </c:when>
                        <c:when test="${frDetails.frRate=='6'}">  <li><img class="mngimg" src="${pageContext.request.contextPath}/resources/images/star3.5.png" alt="monginis" style="height: 30px;"></li> </c:when>
                         <c:when test="${frDetails.frRate=='7'}">  <li><img class="mngimg" src="${pageContext.request.contextPath}/resources/images/star4.png" alt="monginis"style="height: 30px;"></li> </c:when>
                          <c:when test="${frDetails.frRate=='8'}">  <li><img class="mngimg" src="${pageContext.request.contextPath}/resources/images/star4.5.png" alt="monginis" style="height: 30px;"></li> </c:when>
                         <c:when test="${frDetails.frRate=='9'}">  <li><img class="mngimg" src="${pageContext.request.contextPath}/resources/images/star5.png" alt="monginis" style="height: 30px;"></li> </c:when>
                <c:otherwise>
                    <img src="http://www.placehold.it/200x150/EFEFEF/AAAAAA&amp;text=no+image" alt="" />
                    
                </c:otherwise>    
              </c:choose>
               <li><a href="#"><div class="usericon">${frDetails.frName} </div>
                 <div class="userimg">
                <img src="${frDetails.frImage}"  height="70" width="70" this.src='${pageContext.request.contextPath}/resources/images/user.png';">
                	</div> </a>
                	<ul class="dropdown">
                       
						<li><a href="${pageContext.request.contextPath}/showeditprofile">Edit Profile</a></li>
						<li><a href="${pageContext.request.contextPath}/logout">Log out</a></li>
					</ul>
                </li>
            </ul>
        </div>
        </div>
    </div>
</div> --%>
<header>
	<div class="logo"><img src="${pageContext.request.contextPath}/resources/newpos/images/madhvi_logo.jpg" alt="madhvi_logo"> </div>
	<div class="drop_menu">
		<div class="logout_btn"><a href="${pageContext.request.contextPath}/logout"><i class="fa fa-sign-out" aria-hidden="true"></i> Logout </a></div>
	</div>
	<div class="clr"></div>
</header>
