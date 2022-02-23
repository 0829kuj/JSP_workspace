<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="/includes/headerFar.jsp" />
<style>
  .review {
    background-color: cadetblue;
  }
  .review > p {
    display: flex;
  }
</style>
<h2>review detail 페이지 농민ver</h2>
<br /><br />
<!-- <div class="row mt-5"> -->
<div class="col-md-8 mx-auto">
  <div class="review">
    <h4>제목: <c:out value="${review.reviewTitle}" /></h4>
    <p>리뷰글번호: <c:out value="${review.reviewID}" /></p>
    <p>작성자: <c:out value="${review.userID}" /></p>
    <p>작성일자: <c:out value="${review.reviewDate}" /></p>
    <p>상품번호: <c:out value="${review.prodID}" /></p>
    <p><c:out value="${review.reviewContent}" /></p>
  </div>
  <hr />
  <!-- reply.farmID에 값이 있을때만 출력(ne가 !=와 같음) -->
  <c:if test="${reply.farmID ne null }">
    <div style="background-color: bisque">
      <p>덧글번호: <c:out value="${reply.replyID}" /></p>
      <p>판매자ID: <c:out value="${reply.farmID}" /></p>
      <p>상품번호: <c:out value="${reply.prodID}" /></p>
      <p><c:out value="${reply.replyContent}" /></p>
      <p>리뷰글번호: <c:out value="${reply.reviewID}" /></p>
    </div>
  </c:if>
  <hr />
  <div style="background-color: rgb(154, 205, 255)">
    <!--  -->
    <c:if test="${reply.replyID eq null }">
      <p>reply.replyID에 값이 없을때 나와야하는 덧글작성창</p>
      <form name="replyEdit" action="<%= request.getContextPath() %>/replyController" method="get">
        <input type="hidden" name="cmd" value="edit" />
        <h4>덧글달기</h4>
        <textarea name="replyContent" id="commnet" cols="100" rows="10" required></textarea><br />
        <input type="hidden" class="form-control" name="reviewID" value='<c:out value="${review.reviewID}"/>' />
        <input type="hidden" class="form-control" name="farmID" value="<%=session.getAttribute("farmID") %>" />
        <button type="submit" id="replyEdit" class="btn btn-success btn-action">작성완료</button>
      </form>
    </c:if>
    <hr />
    <!-- 세션에 저장된 farmID와 reply.farmID가 똑같을때만 출력 -->
    <p>ContextPath주소: <%= request.getContextPath() %></p>
    <p>현재 접속한 농민의 아이디: <%=session.getAttribute("farmID") %></p>
    <p>지금농민: ${farmID}</p>
    <c:if test="${farmID eq reply.farmID }">
      <p>reply.farmID와 세션의 farmID가 동일할때 출력되는 메세지입니다.</p>
      <c:if test="${reply.replyID ne null }">
        <form name="replyDel" action="<%= request.getContextPath() %>/replyController" method="post">
          <input type="hidden" name="cmd" value="delete" />
          <input type="hidden" name="replyID" value='<c:out value="${reply.replyID}" />' />
          <button type="submit" onclick="if(!confirm('정말로 삭제하시겠습니까?')) return false" class="btn btn-danger btn-action">삭제</button>
        </form>
      </c:if>
      <hr />
      <!-- required: submit하기 전 무조건 빈칸을 채우도록하는 속성 -->
    </c:if>
  </div>
</div>
<!-- </div> -->
<jsp:include page="/includes/footerFar.jsp" />
<script>
  $('.nav-link').removeClass('active'); // 모든 메뉴의 액티브클래스를 삭제
  $('#m-reviewFar').addClass('active'); // 네브바에서 메뉴중 m-home에 active 클래스를 주는 스크립트
</script>
