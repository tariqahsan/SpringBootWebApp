<!DOCTYPE HTML>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Pragma" content="no-cache"> 
    <meta http-equiv="Cache-Control" content="no-cache"> 
    <meta http-equiv="Expires" content="Sat, 01 Dec 2001 00:00:00 GMT">
    
    <title>Contact Manager | Home</title>
    
    <link href="static/css/bootstrap.min.css" rel="stylesheet">
     <link href="static/css/style.css" rel="stylesheet">
    
    <!--[if lt IE 9]>
		<script src="static/js/html5shiv.min.js"></script>
		<script src="static/js/respond.min.js"></script>
	<![endif]-->
</head>
<body>

	<div role="navigation">
		<div class="navbar navbar-inverse">
			<a href="/" class="navbar-brand">ADAMS Contacts</a>
			<div class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
					<li><a href="new-user">New Contact</a></li>
					<li><a href="all-users">All Contacts</a></li>
				</ul>
			</div>
		</div>
	</div>
	
	<c:choose>
		<c:when test="${mode == 'MODE_HOME'}">
			<div class="container" id="homeDiv">
				<div class="jumbotron text-center">
					<h1>Welcome to ADAMS</h1>
				</div>
			</div>
		</c:when>
		<c:when test="${mode == 'MODE_USERS'}">
			<div class="container text-center" id="usersDiv">
				<h3>All Contacts</h3>
				<hr>
				<div class="table-responsive">
					<table class="table table-striped table-bordered text-left">
						<thead>
							<tr>
								<th>Id</th>
								<th>First Name</th>
								<th>Middle Name</th>
								<th>Last Name</th>
								<th>Address1</th>
								<th>Address2</th>
								<th>City</th>
								<th>State</th>
								<th>Zip5</th>
								<th>Zip4</th>
								<th>Phone</th>
								<th>Email</th>
								<th></th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="user" items="${users}">
								<tr>
									<td>${user.id}</td>
									<td>${user.firstname}</td>
									<td>${user.middlename}</td>
									<td>${user.lastname}</td>
									<td>${user.address1}</td>
									<td>${user.address2}</td>
									<td>${user.city}</td>
									<td>${user.state}</td>
									<td>${user.zip5}</td>
									<td>${user.zip4}</td>
									<td>${user.phone}</td>
									<td>${user.email}</td>
									<td><a href="update-user?id=${user.id}"><span class="glyphicon glyphicon-pencil"></span></a></td>
									<td><a href="delete-user?id=${user.id}"><span class="glyphicon glyphicon-trash"></span></a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</c:when>
		<c:when test="${mode == 'MODE_NEW' || mode == 'MODE_UPDATE'}">
			<div class="container text-center">
				<h3>Manage Contact</h3>
				<hr>
				<form class="form-horizontal" method="POST" action="save-user">
					<input type="hidden" name="id" value="${user.id}"/>
					<div class="form-group">
						<label class="control-label col-md-3">First Name</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="firstname" value="${user.firstname}"/>
						</div>				
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Middle Name</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="middlename" value="${user.middlename}"/>
						</div>				
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Last Name</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="lastname" value="${user.lastname}"/>
						</div>				
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Address1</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="address1" value="${user.address1}"/>
						</div>				
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Address2</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="address2" value="${user.address2}"/>
						</div>				
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">City</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="city" value="${user.city}"/>
						</div>				
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">State</label>
						<div class="col-md-7">
							<input type="text" size="2" class="form-control" name="state" value="${user.state}"/>
						</div>				
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Zip5</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="zip5" value="${user.zip5}"/>
						</div>				
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Zip4</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="zip4" value="${user.zip4}"/>
						</div>				
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Phone</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="phone" value="${user.phone}"/>
						</div>				
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Email</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="email" value="${user.email}"/>
						</div>				
					</div>
					<!-- <div class="form-group">
						<label class="control-label col-md-3">Finished</label>
						<div class="col-md-7">
							<input type="radio" class="col-sm-1" name="finished" value="true"/>
							<div class="col-sm-1">Yes</div>
							<input type="radio" class="col-sm-1" name="finished" value="false" checked/>
							<div class="col-sm-1">No</div>
						</div>				
					</div>	 -->	
					<div class="form-group">
						<input type="submit" class="btn btn-primary" value="Save"/>
					</div>
				</form>
			</div>
		</c:when>		
	</c:choose>

	<script src="static/js/jquery-1.11.1.min.js"></script>    
    <script src="static/js/bootstrap.min.js"></script>
</body>
</html>