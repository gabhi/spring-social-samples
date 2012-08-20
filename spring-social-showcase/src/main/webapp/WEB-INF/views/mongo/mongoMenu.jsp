


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









