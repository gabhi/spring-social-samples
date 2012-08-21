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


Collection: <a href="<c:url value="/mongo/database/${currentDbName}"/>">${currentCollection}</a><br />




<form>
  <legend>Collections from the <a href="<c:url value="/mongo/database/${currentDbName}"/>">${currentDbName}</a></legend>

  <c:forEach items="${dbCollectionrows}" var="row" varStatus="gC">
    <label class="checkbox">
      <input type="checkbox">
      <c:choose>

        <c:when test="${empty row._id}">
          <a href="#" onclick="showHide('table_${gC.index}');">${gC.index}</a>

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
          <a href="#" onclick="showHide('row_${row._id}');">${row._id}</a>
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

      </input></label>

  </c:forEach>


  <button type="submit" class="btn">Drop</button>
</form>









<script type="text/javascript"> 
  function showHide(elementid){
    if (document.getElementById(elementid).style.display == 'none'){
      document.getElementById(elementid).style.display = '';
    } else {
      document.getElementById(elementid).style.display = 'none';
    }
  }
 
</script>









