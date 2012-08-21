<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf" %>
<%@ page session="false" %>




<form>
  <legend>Collections from the <a href="<c:url value="/mongo/database/${currentDbName}"/>">${currentDbName}</a></legend>

  <c:forEach items="${collectionNames}" var="collectionName">




    <label class="checkbox">
      <input type="checkbox"> <a href="<c:url value="/mongo/database/${currentDbName}/${collectionName}"/>">${collectionName}</a>
    </label>


  </c:forEach>


  <button type="submit" class="btn">Drop</button>
</form>







