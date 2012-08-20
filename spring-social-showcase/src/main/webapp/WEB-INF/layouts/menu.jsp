<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://www.springframework.org/spring-social/social/tags" prefix="social" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<p> 
  Databases: <br />
<ol>
  <c:forEach items="${mongoDatabaseNames}" var="dbName">
    <li><a href="<c:url value="/mongo/database/${dbName}"/>">${dbName}</a></li>

  </c:forEach>
</ol>

