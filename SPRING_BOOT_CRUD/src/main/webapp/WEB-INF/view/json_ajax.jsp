<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="ajaxList" value="${ajaxList}"></c:set>
<c:set var="lenList" value="${f:length(ajaxList)}"></c:set>

[
	<c:forEach var="i" items="${ajaxList}"  varStatus="j">
	{
		"id":${j.count},
		"firstName":"${i.firstName}",
		"lastName":"${i.lastName}"
	}
	<c:if test="${j.count ne lenList}">,</c:if>
	
	</c:forEach>
	
]
