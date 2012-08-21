<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://www.springframework.org/spring-social/social/tags" prefix="social" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>







<div class="span3">
  <div class="well sidebar-nav">
    <ul class="nav nav-list">

      Databases: <br />

      <c:forEach items="${mongoDatabaseNames}" var="loopDbName">
        <li 
<c:if test = "${dbName == loopDbName}">     
      class="active"
    </c:if>
        ><a href="<c:url value="/mongo/database/${loopDbName}"/>">${loopDbName}</a></li>

      </c:forEach>




    </ul>
  </div><!--/.well -->

  <div class="well sidebar-nav">
    <ul class="nav nav-list">


      Collections in the <b><a href="<c:url value="/mongo/database/${dbName}"/>">${dbName}</a></b><br />
      <c:forEach items="${collectionNames}" var="collectionName">
        <li
<c:if test = "${collectionName == currentCollection}">     
      class="active"
    </c:if>
        ><a href="<c:url value="/mongo/database/${currentDbName}/${collectionName}"/>">${collectionName}</a></li>

      </c:forEach>

    </ul>
  </div><!--/.well -->
</div><!--/span-->