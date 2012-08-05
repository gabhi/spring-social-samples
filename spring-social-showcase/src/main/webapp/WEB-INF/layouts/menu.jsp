<?xml version="1.0" encoding="UTF-8" ?>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ page session="false" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>Bootstrap, from Twitter</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">

        <!-- Le styles -->
        <link href="${pageContext.request.contextPath}/resources/assets/css/bootstrap.css" rel="stylesheet">

        <link href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.css" rel="stylesheet">
        <style type="text/css">
            body {
                padding-top: 60px;
                padding-bottom: 40px;
            }
            .sidebar-nav {
                padding: 9px 0;
            }
        </style>
        <link href="./resources/bootstrap/css/bootstrap.css" rel="stylesheet">

        <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
        <!--[if lt IE 9]>
          <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->

    </head>

    <body>

        <div class="navbar navbar-fixed-top">
            <div class="navbar-inner">
                <div class="container-fluid">
                    <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </a>
                    <a class="brand" href="#">Social Log in</a>
                    <div class="btn-group pull-right">
                        <a class="btn dropdown-toggle" data-toggle="dropdown" href="#">
                            <i class="icon-user"></i> ${pageContext['request'].userPrincipal.principal.username}
                            <span class="caret"></span>
                        </a>
                        <ul class="dropdown-menu">
                            <c:choose>
                                <c:when test="${empty pageContext['request'].userPrincipal.principal}">
                                    <li><a href="<c:url value="/signin" />">Sign In</a></li>  
                                </c:when>
                                <c:otherwise>
                                    <li><a href="<c:url value="/connect" />">Profile</a></li>
                                    <li class="divider"></li>
                                    <li><a href="<c:url value="/signout" />">Sign Out</a></li>    </c:otherwise>
                            </c:choose>

                        </ul>
                    </div>
                    <div class="nav-collapse">
                        <ul class="nav">
                            <li class="active"><a href="#">Home</a></li>
                            <li><a href="#about">About</a></li>
                            <li><a href="#contact">Contact</a></li>
                        </ul>
                    </div><!--/.nav-collapse -->
                </div>
            </div>
        </div>

        <div class="container-fluid">
            <div class="row-fluid">
                <div class="span3">
                    <div class="well sidebar-nav">
                        <ul class="nav nav-list">
                            <tiles:insertTemplate template="menu.jsp" />


                        </ul>
                    </div><!--/.well -->
                </div><!--/span-->
                <div class="span9">
                    <div class="hero-unit">





                        <tiles:insertAttribute name="content" />

                    </div>

                </div><!--/span-->
            </div><!--/row-->

            <hr>

            <footer>
                <p>&copy; <a href="http://gabhi.com">Abhijit Gaikwad</a></p>
            </footer>

        </div><!--/.fluid-container-->

        <!-- Le javascript
        ================================================== -->
        <!-- Placed at the end of the document so the pages load faster -->
        <script type="text/javascript">
     

            $('.nav li').click(function(e) {
                $('.navbar li').removeClass('active');
                var $this = $(this);
                if (!$this.hasClass('active')) {
                    $this.addClass('active');
                }
                e.preventDefault();
            });

        </script>
        <script src="${pageContext.request.contextPath}/resources/assets/js/jquery.js"></script>
        <script src="${pageContext.request.contextPath}/resources/assets/js/bootstrap-transition.js"></script>
        <script src="${pageContext.request.contextPath}/resources/assets/js/bootstrap-alert.js"></script>
        <script src="${pageContext.request.contextPath}/resources/assets/js/bootstrap-modal.js"></script>
        <script src="${pageContext.request.contextPath}/resources/assets/js/bootstrap-dropdown.js"></script>
        <script src="${pageContext.request.contextPath}/resources/assets/js/bootstrap-scrollspy.js"></script>
        <script src="${pageContext.request.contextPath}/resources/assets/js/bootstrap-tab.js"></script>
        <script src="${pageContext.request.contextPath}/resources/assets/js/bootstrap-tooltip.js"></script>
        <script src="${pageContext.request.contextPath}/resources/assets/js/bootstrap-popover.js"></script>
        <script src="${pageContext.request.contextPath}/resources/assets/js/bootstrap-button.js"></script>
        <script src="${pageContext.request.contextPath}/resources/assets/js/bootstrap-collapse.js"></script>
        <script src="${pageContext.request.contextPath}/resources/assets/js/bootstrap-carousel.js"></script>
        <script src="${pageContext.request.contextPath}/resources/assets/js/bootstrap-typeahead.js"></script>

    </body>
</html>
