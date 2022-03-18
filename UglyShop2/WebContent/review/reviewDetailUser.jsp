<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../includes/headerUser.jsp" />
<style>
  h4 {
    margin-bottom: 20px;
  }
  .review {
    background-color: rgb(243, 243, 243);
    padding: 10px 20px;
  }
  .info {
    display: flex;
  }
  .info > p {
    justify-content: right;
    margin-right: 25px;
  }
  .reply {
    /* background-color: bisque; */
    margin-top: 30px;
    padding: 10px 20px;
  }
  .replyEdit {
    /* background-color: rgb(154, 205, 255); */
  }
  .content {
    margin-top: 30px;
  }
  .viewList {
    margin: 20px 0 0 20px;
  }
</style>
<!-- <div class="row mt-5"> -->
<div class="col-md-8 mx-auto">
  <div class="font-weight-bold mt-3 shadow p-3 mb-4 bg-light rounded">리뷰 상세보기 페이지</div>
  <div class="review rounded">
    <h4><c:out value="${review.reviewTitle}" /></h4>

    <div class="info">
      <p>글번호: <c:out value="${review.reviewID}" /></p>
      <p>상품번호: <c:out value="${review.prodID}" /></p>
      <p>작성자: <c:out value="${review.userID}" /></p>
    </div>
    <p class="date">작성일: <c:out value="${review.reviewDate}" /></p>
    <p class="content"><c:out value="${review.reviewContent}" /></p>
    <c:if test="${userID eq review.userID }">
      <!-- board 참고해서 button위치 옮겨놓기 -->
      <c:if test="${review.reviewID ne null }">
        <div class="edit" style="text-align: center; align-content: center">
          <button type="button" class="btn btn-success" onclick="location.href = '<%=request.getContextPath()%>/reviewController2?cmd=edit&reviewID=<c:out value='${review.reviewID}'/>' ">수정</button>
          <!-- button대신 a태그로 onlick(팝업창)과 cmd이동 둘다 가능  -->
          <a
            class="btn btn-danger"
            type="button"
            onclick="if((!confirm('정말로 삭제할까요?'))) return false"
            href="<%= request.getContextPath() %>/reviewController2?cmd=delete&reviewID=<c:out value='${review.reviewID}'/>"
            >삭제</a
          >
          <!-- a태그로도 가능 -->
        </div>
      </c:if>
    </c:if>
  </div>
  <!-- reply.farmID에 값이 있을때만 출력(ne가 !=와 같음) -->
  <c:if test="${reply.farmID ne null }">
    <div class="reply rounded">
      <div class="info">
        <p>덧글번호: <c:out value="${reply.replyID}" /></p>
        <p>상품번호: <c:out value="${reply.prodID}" /></p>
        <p>판매자ID: <c:out value="${reply.farmID}" /></p>
      </div>
      <p class="content"><c:out value="${reply.replyContent}" /></p>
    </div>
  </c:if>
  <div class="back">
    <button onclick="location.href = '<%=request.getContextPath()%>/reviewController2?cmd=list' " type="button" class="viewList btn btn-primary">전체리뷰 보기</button>
    <!-- 뒤로가기.리스트로 이동  -->
  </div>
</div>

<jsp:include page="../includes/footer.jsp" />
<script>
  $('.nav-link').removeClass('active'); // 모든 메뉴의 액티브클래스를 삭제
  $('#m-reviewFar').addClass('active'); // 네브바에서 메뉴중 m-home에 active 클래스를 주는 스크립트
</script>
