<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf" %>
<%@ page session="false" %>



 
<a href="#myModal" role="button" class="btn" data-toggle="modal">${fn:toUpperCase(currentDbName)} Stats</a>

 <div class="modal hide fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">X</button>
    <h3 id="myModalLabel">Modal header</h3>
  </div>
  <div class="modal-body">
    <p>One fine body</p>
  </div>
  <div class="modal-footer">
    <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
    <button class="btn btn-primary">Save changes</button>
  </div>
</div>
 



<form>
  <legend>Collections from the <a href="<c:url value="/mongo/database/${currentDbName}"/>">${currentDbName}</a></legend>

  <c:forEach items="${collectionNames}" var="collectionName">




    <label class="checkbox">
      <input type="checkbox"> <a href="<c:url value="/mongo/database/${currentDbName}/${collectionName}"/>">${fn:toUpperCase(collectionName)}</a>
    </label>


  </c:forEach>


  <button type="submit" class="btn">Drop</button>
</form>







