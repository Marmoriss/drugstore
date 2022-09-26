<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${param.title}</title>

<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>

<!-- bootstrap js -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

<!-- bootstrap css -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">

<!-- 사용자 작성 css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css"/>

<!-- 폰트어썸 -->
<script src="https://kit.fontawesome.com/34c760bbb4.js" crossorigin="anonymous"></script>

<!-- include libraries(jQuery, bootstrap) 썸머노트 -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
<!-- include summernote css/js-->
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js"></script>
<!-- include summernote-ko-KR -->
<script src="/resources/js/summernote-ko-KR.js"></script>

<!-- alert 띄우기 -->
<c:if test="${not empty msg}">
<script>
   alert("${msg}");
</script>
</c:if>

<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.6.1/sockjs.min.js" integrity="sha512-1QvjE7BtotQjkq8PxLeF6P46gEpBRXuskzIVgjFpekzFVF4yjRgrQvTG1MTOJ3yQgvTteKAcO7DSZI92+u/yZw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js" integrity="sha512-iKDtgDyTHjAitUDdLljGhenhPwrbBfqTKWO1mkhSFH3A7blITC9MhYon6SjnMhp4o0rADGw9yAC6EW4t5a4K3g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<sec:authorize access="isAuthenticated()">
   <script>
   const memberId = "<sec:authentication property='principal.username'/>";
   </script>
   <script src="${pageContext.request.contextPath}/resources/js/ws.js"></script>
</sec:authorize>
</head>
<body>

<header>
   <div id="header-container">
      <!-- 띠 배너 -->
      <div class="header-line">
         <a href="#">
            <p class="header-line-text">이벤트 페이지 등 넣고싶은 페이지 넣으세요~!</p>
         </a>
      </div>
      <!-- 상단 메뉴 -->
      <div class="wrap_inner relative header-nav-inner">
         <div class="nav header-nav-list-wrap">
            <ul class="header-nav-list">
               <li class="header-nav-item"><a href="${pageContext.request.contextPath}/servey/servey.do" class="header-nav-text">건강설문</a></li>
               <li class="header-nav-item"><a href="${pageContext.request.contextPath}/subscription/product.do" class="header-nav-text">정기구독</a></li>
               <li class="header-nav-item"><a class="header-nav-text" href="${pageContext.request.contextPath}/notice/noticeList.do">고객센터</a></li>
               
               <sec:authorize access="isAnonymous()">
               <li class="header-nav-item"><a href="${pageContext.request.contextPath}/member/memberLogin.do" class="header-nav-text">로그인</a></li>
               </sec:authorize>               
               <sec:authorize access="isAuthenticated()">
                     <%-- <sec:authentication property="principal.username"/> --%>
                     <%-- <sec:authentication property="authorities"/> --%>
                  <li class="header-nav-item" name="logoutLink"><a href="#" class="header-nav-text" >로그아웃</a></li>
                  
                  <form action="${pageContext.request.contextPath}/member/memberLogout.do" method="POST" id="logoutFrm">
                     <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                  </form>
                  <script>
                     window.onload = function(){
                        document.querySelector("[name=logoutLink]").addEventListener('click',(e)=>{
                        const frm = document.querySelector("#logoutFrm");
                        console.log(frm);
                        frm.submit();
                     })      
                     }
                  </script>               
               </sec:authorize>
            </ul>
         </div>
      </div>
      <!-- 로고 -->
      <div class="header-logo">
         <a href="${pageContext.request.contextPath}" class="header-logo-link">
            <img src="${pageContext.request.contextPath}/resources/images/logo.png" alt="logo" class="header-logo-img"/>
         </a>
      </div>
      <!-- 카테고리 -->
      <div class="logo-wrap">
         <div class="wrap_inner relative header-bottom">
            <div class="showCategoryNavigation header-menu-wrap">
               <ul class="category-wrap header-menu" >
                  <li class="categoryList header-menu-open">
                     <a href="javascript:;" class="categoryAllBtn">
                        <i class="fa-solid fa-bars"></i>
                     </a>
                     <a href="${pageContext.request.contextPath}/product/productList.do?categoryId=350001" class="header-menu-open-title">전체 카테고리</a>
                  </li>
                  <!-- 추후 반복문으로 카테고리 헤더 불러오기 -->
                  <li class="categoryList1 header-menu-item">
                     <a href="#" class="header-menu-title">이벤트</a>
                  </li>
                  <li class="categoryList1 header-menu-item">
                     <a href="#" class="header-menu-title">베스트</a>
                  </li>
                  <sec:authorize access="isAuthenticated() && !hasRole('ADMIN')"> >
                  <li class="categoryList1 header-menu-item">
                     <a href="${pageContext.request.contextPath}/chat/chat.do" class="header-menu-title">
                        <img id="chatImg" src="${pageContext.request.contextPath}/resources/images/792.gif" alt="chat"/></a>
                  </sec:authorize>
                  </li>
               </ul>
            </div>
            <!-- 호버시 보일 메뉴 작성 -->
            
            <!-- 검색창, 장바구니, 마이페이지 -->
            <div class="header-bottom-right relative">
               <form action="" class="header-search" name="topSearchFrm" id="topSearchFrm">
                  <input type="text" name="search-text" class="header-search-input" placeholder="[NEW] 비타톡톡 100정" />
                  <button type="submit" class="header-search-submit"><i class="fa-solid fa-magnifying-glass"></i></button>
               </form>
               <div class="header-cart">
                  <a href="${pageContext.request.contextPath}/cart/cartList.do" class="header-cart-link hand"><i class="fa-solid fa-cart-shopping"></i></a>
                  <p class="header-cart-count hand">0</p>
                  <!-- 호버시 장바구니 내역 보이게 작성 -->
               </div>
               <a href="${pageContext.request.contextPath}/member/memberMyPage.do" class="header-mypage"><i class="fa-solid fa-user"></i></a>
            </div>
         </div>
      </div>
   </div>
</header>
 