<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf" %>
<%@ page session="false" %>


Please Select one of the following databases: <br />
<ol>
  <c:forEach items="${mongoDatabaseNames}" var="dbName">

    <li><c:out value="${dbName}" /> </li>
  </c:forEach>
</ol>

