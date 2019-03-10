<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<c:import url="header.jsp" >
	<c:param name="title" value="Picture Squirrel Home"></c:param>
</c:import>

<sql:setDataSource var="ds" dataSource="jdbc/webshop" />

<sql:query dataSource="${ds}" sql="select * from images limit 10" var="results" />

<table class="images">

<c:set var="tablewidth" value="2"/>
  
<c:forEach var="image" items="${results.rows}" varStatus="row">

	<c:if test="${row.index % tablewidth==0}">
		<tr>
	</c:if>

		<c:set scope="page" var="imgname" value="${image.stem}.${image.image_extension}"></c:set>

		<td><img width="120" src="${pageContext.request.contextPath}/pics/${imgname}" /></td>
	
	<c:if test="${row.index+1 % tablewidth==0}">
		</tr>
	</c:if>
 
</c:forEach>

</table>
 

<c:import url="footer.jsp" />






























