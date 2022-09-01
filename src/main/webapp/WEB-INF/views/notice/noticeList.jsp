<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="고객센터" name="title"/>
</jsp:include>
<section class="left-menu">

  <div class="border-top"></div>  
  <h4>고객센터</h4>  
  <div class="border-bot"></div>
  <ul class=space_list>
    <li>
      <a href="#">공지사항</a>
    </li>
    <li>
      <a href="#">1:1 문의하기</a>
    </li>
    <li>
      <a href="#">FAQ</a>
    </li>
  </ul>
</section>

<div class="right-content">
  <!-- 관리자만가능 -->
    <input type="button" value="글작성" id="btn-add" class="btn btn-outline-success" 
      onclick="location.href='${pageContext.request.contextPath}/board/boardForm.do';"/>
 
  <table id="tbl-notice">
    <tr>
      <th>No</th>
      <th>제목</th>
      <th>작성일</th>
    </tr>

  </table>
 <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
 