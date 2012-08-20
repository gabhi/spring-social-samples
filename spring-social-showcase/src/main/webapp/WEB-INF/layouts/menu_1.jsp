<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://www.springframework.org/spring-social/social/tags" prefix="social" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<p> 
  Please Select one of the following databases: <br />
<ol>
  <c:forEach items="${mongoDatabaseNames}" var="dbName">
    <li><a href="<c:url value="/mongo/database/${dbName}"/>">${dbName}</a></li>

  </c:forEach>
</ol>

<h4><a href="<c:url value="/connect"/>">Connections</a></h4>

<h4><a href="<c:url value="/twitter"/>">Twitter</a></h4>
<social:connected provider="twitter">
  <ul class="menu">
    <li><a href="<c:url value="/twitter"/>">User Profile</a></li>
    <li><a href="<c:url value="/twitter/timeline"/>">Timeline</a></li>
    <li><a href="<c:url value="/twitter/friends"/>">Friends</a></li>
    <li><a href="<c:url value="/twitter/followers"/>">Followers</a></li>
    <li><a href="<c:url value="/twitter/messages"/>">Messages</a></li>
    <li><a href="<c:url value="/twitter/trends/daily"/>">Daily Trends</a></li>
  </ul>
</social:connected>

<h4><a href="<c:url value="/facebook"/>">Facebook</a></h4>
<social:connected provider="facebook">
  <ul class="menu">
    <li><a href="<c:url value="/facebook"/>">User Profile</a></li>
    <li><a href="<c:url value="/facebook/feed"/>">Feed</a></li>
    <li><a href="<c:url value="/facebook/friends"/>">Friends</a></li>
    <li><a href="<c:url value="/facebook/albums"/>">Albums</a></li>
  </ul>
</social:connected>

<h4><a href="<c:url value="/linkedin"/>">LinkedIn</a></h4>
<social:connected provider="linkedin">
  <ul class="menu">
    <li><a href="<c:url value="/linkedin"/>">User Profile</a></li>
  </ul>
</social:connected>



<sec:authorize access="isAuthenticated()">
  <a href="<c:url value="/signout" />">Sign Out</a>
</sec:authorize>
<sec:authorize access="isAnonymous()">
  <a href="<c:url value="/signin" />">Log in</a>
</sec:authorize>


