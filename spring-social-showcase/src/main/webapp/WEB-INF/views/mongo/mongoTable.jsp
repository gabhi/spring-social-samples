<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf" %>
<%@ page session="false" %>




<ul class="nav nav-pills">
  <li  class="active"><a href="<c:url value="/mongo/database/${currentDbName}/${currentCollection}"/>"> Raw </a></li>

  <li><a href="<c:url value="/mongo/database/${currentDbName}/${currentCollection}/raw"/>"> Raw </a></li>
  <li><a href="<c:url value="/mongo/database/${currentDbName}/${currentCollection}/stats"/>"> Stats</a></li>
</ul>

Collections from the <a href="<c:url value="/mongo/database/${currentDbName}"/>">${currentDbName}</a><br />
${dbCollectionrows}<br />
Data type: ${dataType}

<c:forEach items="${dbCollectionrows}" var="row1">

  <c:forEach items="${row1}" var="r">
    <li>${r}</li>
  </c:forEach>

</c:forEach>










