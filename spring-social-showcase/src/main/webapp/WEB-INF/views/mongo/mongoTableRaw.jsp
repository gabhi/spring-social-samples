<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf" %>
<%@ page session="false" %>


<ul class="nav nav-tabs">
  <li  
    <c:if test = "${dataType == 'raw'}">     
      class="active"
    </c:if> >
    <a href="<c:url value="/mongo/database/${currentDbName}/${currentCollection}"/>"> Raw </a></li>

  <li
    <c:if test = "${dataType == 'tabular'}">     
      class="active"
    </c:if>
    ><a href="<c:url value="/mongo/database/${currentDbName}/${currentCollection}/tabular"/>"> Tabular </a></li>
  <li
    <c:if test = "${dataType == 'stats'}">     
      class="active"
    </c:if>
    ><a href="<c:url value="/mongo/database/${currentDbName}/${currentCollection}/stats"/>"> Stats</a></li>
</ul>


              <tiles:insertTemplate template="/WEB-INF/views/mongo/mongoMenu.jsp" flush="true" />


Collections from the <a href="<c:url value="/mongo/database/${currentDbName}"/>">${currentDbName}</a><br />
${dbCollectionrows}<br />
Data type: ${dataType}

<c:forEach items="${dbCollectionrows}" var="row">
    <li><a href="<c:url value="/mongo/database/${currentDbName}/${collectionName}/id/${row._id}"/>">${row._id}</a></li>

 
</c:forEach>










