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
        <h3 class="text-center text-white pt-5">Login form</h3>
        <div class="container">
            <div id="login-row" class="row justify-content-center align-items-center">
                <div id="login-column" class="col-md-6">
                    <div id="login-box" class="col-md-12">
                    	
                        <form:form id="login-form" class="form" action="${pageContext.request.contextPath}/member/memberLogin.do" method="post">
                            <h3 class="text-center text-info">Login</h3>
                            <c:if test="${param.error != null}">
                            <div class="alert alert-danger alert-dismissible fade show" role="alert">
							 	아이디 또는 비밀번호가 일치하지 않습니다.
							  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
							    <span aria-hidden="true">&times;</span>
							  </button>
							</div>
                            </c:if>
                            <div class="form-group">
                                <label for="username" class="text-info">Id:</label><br>
                                <input type="text" name="memberId" class="form-control" placeholder="아이디" required>
                            </div>
                            <div class="form-group">
                                <label for="password" class="text-info">Password:</label><br>
                                <input type="password" name="password" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <input id="remember-me" name="remember-me" type="checkbox" >
                                <label for="remember-me" class="text-info"><span>아이디 저장</span></label>
                                <br>
                                <input type="submit" name="submit" class="btn btn-info btn-md" value="로그인">
                                <a name="kakaoLogin" href="https://kauth.kakao.com/oauth/authorize?client_id=88be96f783f8adf9f14dc6555f3c228e&redirect_uri=http://localhost:9090/drugstore/member/kakao/callback.do&response_type=code">
                                	<img src="${pageContext.request.contextPath}/resources/images/kakao_login_medium.png" alt="" />
                                	
                                </a>
                            </div>
                                
                            <div id="register-link" class="text-right">
                                <a href="${pageContext.request.contextPath}/member/memberEnroll.do" class="text-info">회원가입</a>
                            </div>

                        </form:form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
   
</div>


<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>