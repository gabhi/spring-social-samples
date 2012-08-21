<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf" %>
<%@ page session="false" %>
<%@ taglib prefix="json" uri="http://www.atg.com/taglibs/json" %>


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
  
<c:forEach items="${dbCollectionrows}" var="row" varStatus="gC">

 <c:choose>
                <c:when test="${empty row._id}">
                                 <li><a href="#" onclick="showHide('table_${gC.index}');">${gC.index}</a></li>
  <div id="table_${gC.index}" style="display:none">

 <table class="table table-striped table-bordered">
      <c:forEach items="${row}" var="rowelement">
        <tr>
          <td>${rowelement.key}  </td>
          <td>
           

            ${rowelement.value}</td>
        </tr>
      </c:forEach>
    </table>
  </div>
                 </c:when>
                <c:otherwise>
                 <li><a href="#" onclick="showHide('row_${row._id}');">${row._id}</a></li>
  <div id="row_${row._id}" style="display:none">
    <table class="table table-striped table-bordered">
      <c:forEach items="${row}" var="rowelement">
        <tr>
          <td>${rowelement.key}  </td>
          <td>
           

            ${rowelement.value}</td>
        </tr>
      </c:forEach>
    </table>
  </div>

                </c:otherwise>
              </c:choose>


  
</c:forEach>


<script type="text/javascript"> 
  function showHide(elementid){
    if (document.getElementById(elementid).style.display == 'none'){
      document.getElementById(elementid).style.display = '';
    } else {
      document.getElementById(elementid).style.display = 'none';
    }
  }
 
</script>









