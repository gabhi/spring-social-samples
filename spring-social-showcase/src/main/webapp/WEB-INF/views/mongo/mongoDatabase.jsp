<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf" %>
<%@ page session="false" %>


Collections from the <a href="<c:url value="/mongo/database/${currentDbName}"/>">${currentDbName}</a><br />
<ol>


  <c:forEach items="${collectionNames}" var="collectionName">
    <li><a href="<c:url value="/mongo/database/${currentDbName}/${collectionName}"/>">${collectionName}</a></li>

  </c:forEach>

</ol>




