<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://www.springframework.org/spring-social/social/tags" prefix="social" %>
    <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

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
 ${pageContext['request'].userPrincipal}

<br />
Displaying Auth: <sec:authentication property="principal"/>



<c:choose>
    <c:when test="${empty pageContext['request'].userPrincipal.principal}">
        <a href="<c:url value="/signin" />">Log in</a>
    </c:when>
    <c:otherwise>
        <a href="<c:url value="/signout" />">Sign Out</a>
    </c:otherwise>
</c:choose>
