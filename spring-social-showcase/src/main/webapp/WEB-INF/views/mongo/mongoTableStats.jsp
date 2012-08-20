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


<table border="1">
  <tr>
    <td>dbCount</td>
    <td>${dbCount}</td>
  </tr>
  <tr>
    <td>dbIndexInfo</td>
    <td>${dbIndexInfo}



    </td>
  </tr><tr>
    <td>dbStats</td>
    <td>
      <table> 
        <c:forEach items="${dbStats}" var="stats">
          <tr>
            <td>${stats.key}</td>
            <td>${stats.value}</td>
          </tr>
        </c:forEach>
      </table>
    </td>
  </tr><tr>
    <td>dbFullName</td>
    <td>${dbFullName}</td>
  </tr><tr>
    <td>dbOptions</td>
    <td>${dbOptions}</td>
  </tr><tr>
    <td>dbWriteConcern</td>
    <td>${dbWriteConcern}</td>
  </tr>
</table>










