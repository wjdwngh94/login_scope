<%@page import="java.util.*"%>
<%@page import="my.miniboard.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!-- list.jsp : 목록 페이지 -->
<%
	//DAO 생성 후 DB 명단을 전부다 가져오라고 지시한다.
	MiniDAO dao = new MiniDAO();

	//resultSet로 저장하면 데이터가 몇개인지 알수가 없다.
	ArrayList<MiniDTO> list = dao.list();
	//게시글이 들어있는 ArrayList

	//list에 들어가 있는 데이터 화면에 출력
%>

<%@ include file="/top.jsp"%>

<!-- / 처리만 하면 절대경로 처리 된다. -->
<div align="center">

	<!-- 목록 -->
	<%
		if (list == null || list.size() == 0) {
			//list가 없는경우와 비어있는 경우
	%>
	<h1>게시글이 없습니다.</h1>
	<%
		} else {
	%>
	<table border="1" width="600">
		<tr>
			<th>번호</th>
			<th>작성자</th>
			<th width="40%">내용</th>
			<th>등록일</th>
		</tr>
		<!-- 내용 : ArrayList<MiniDTO> list안의 내용 추출 -->
		<%
			for (MiniDTO dto : list) //확장 for문
				/*for(int i=0; i<list.size(); ++i){
					MiniDTO dto = list.get(i);
					//이후 출력
				}*/{
		%>
		<tr>
			<th><%=dto.getNo()%></th>
			<th><%=dto.getWriter()%></th>
			<th><%=dto.getContent()%></th>
			<th><%=dto.getRegdate()%></th>
		</tr>
		<%
			}
		%>
	</table>
	<%
		}
	%>
</div>
<h5 align="right">
	총<%=list.size()%>개의 데이터가 있습니다.
	</h3>
	<%@ include file="/bottom.jsp"%>