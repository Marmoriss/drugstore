﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<fmt:requestEncoding value="utf-8" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="로그인" />
</jsp:include>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/index.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/member/memberLogin.css" />

<div class="body">
	 <div id="login">
        <div class="container">
            <div id="login-row" class="row justify-content-center align-items-center">
                <div id="login-column" class="col-md-6">
                    <div id="login-box" class="col-md-12">
                        <form:form id="login-form" class="form" action="${pageContext.request.contextPath}/member/memberLogin.do" method="post">
                            <h3 class="text-center text-info">Login</h3>
                            
                            <div class="form-group">
                                <label for="username" class="text-info">Id:</label><br>
                                <input type="text" name="memberId" class="form-control" placeholder="아이디" required>
                            </div>
                            <div class="form-group">
                                <label for="password" class="text-info">Password:</label><br>
                                <input type="password" name="password" class="form-control" placeholder="비밀번호" required>
                            </div>
                            <div id="register-link" class="text-right">
                            	<div id="remember-div">
	   	                        	 <!-- <input id="remember-me" name="remember-me" type="checkbox" >
    	                            <label for="remember-me" class="text-info"><span>로그인 유지</span></label> -->
                            	</div>
                            	<div>
	                                <a href="${pageContext.request.contextPath}/member/memberEnroll.do" class="text-info">회원가입</a>
    	                            <a href="${pageContext.request.contextPath}/member/findInfo.do" class="text-info ml-3">아이디/비번 찾기</a>
                            	</div>
                            </div>
                            <div class="form-group">
                                <input type="submit" name="submit" class="btn btn-info btn-md" value="로그인">
                                <a name="kakaoLogin" href="https://kauth.kakao.com/oauth/authorize?client_id=88be96f783f8adf9f14dc6555f3c228e&redirect_uri=http://localhost:9090/drugstore/member/kakao/callback.do&response_type=code">
                                	<img src="${pageContext.request.contextPath}/resources/images/kakao_login_medium.png" alt="" />
                                </a>
                            </div>
                        </form:form>
                    </div>
                </div>
            </div>
        </div>
        <div id="height-balance">
		<c:if test="${param.error != null}">
		<div class="login-err">
		  <i class="fa-solid fa-triangle-exclamation fa-3x fa-beat" id="icon" ></i>
		<p>
		  아이디 또는 비밀번호가 일치하지 않습니다.
		</p>
		</div>
		</c:if>
		</div>
    </div>
    
		
		


		
</div>

<script>
const err = document.querySelector(".login-err");
	if(${param.error != null}){
		  $(".login-err").fadeOut(8000);
	}
	
</script>




<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>