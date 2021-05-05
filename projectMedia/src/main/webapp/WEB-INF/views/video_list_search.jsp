<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<div id="video_contents">
		<div id="video_recently">
			<div class="video_all" style="margin-right: 300px;">
				<div class="video_title">
					<br>
					<hr></hr>
					<h2>선택한 동영상 : ${nae}</h2>
				</div>
				<ul class="video_cir" style= "list-style: none;">
					<c:forEach var="vo" items="${viewAll}">
						<li>
							<div class="video_img">
								<a href="Videoplay.jsp?video_code=${vo.video_code}"><img
									src="${vo.video_img}"></a>
							</div>
							<div class="video_name">
								<a href="Videoplay.jsp?video_code=${vo.video_code}">${vo.video_name}</a><br>
								좋아요 : ${vo.video_good} 조회수 : ${vo.video_views}
							</div>
						</li>
					</c:forEach>
				</ul>
			</div>
			<div style="display: block; text-align: center; color: black;">
				<c:if test="${paging.startPage != 1 }">
					<a
						href="Videopaging?video_category=${nae}&nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
				</c:if>
				<c:forEach begin="${paging.startPage }" end="${paging.endPage }"
					var="p">
					<c:choose>
						<c:when test="${p == paging.nowPage }">
							<b>${p }</b>
						</c:when>
						<c:when test="${p != paging.nowPage }">
							<a id="paging"
								href="Videopaging?video_category=${nae}&nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
						</c:when>
					</c:choose>
				</c:forEach>
				<c:if test="${paging.endPage != paging.lastPage}">
					<a 
						href="Videopaging?video_category=${nae}&nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
				</c:if>
			</div>