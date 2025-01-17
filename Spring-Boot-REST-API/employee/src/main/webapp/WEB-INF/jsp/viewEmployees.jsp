<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>View Employees</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container">
    <h1 class="mt-5">Employee List</h1>
    <form action="/employees/search" method="get" class="form-inline mb-3">
        <label for="search" class="mr-2">Search by Email:</label>
        <input type="text" id="search" name="email" class="form-control mr-2">
        <input type="submit" value="Search" class="btn btn-primary">
    </form>
    <table class="table table-bordered">
        <thead class="thead-dark">
        <tr>
            <th>ID</th>
            <th>First Name</th>
            <th>Last Name</th>
            <th>Email</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="employee" items="${employees}">
            <tr>
                <td>${employee.id}</td>
                <td>${employee.firstName}</td>
                <td>${employee.lastName}</td>
                <td>${employee.email}</td>
                <td>
                    <form action="/employees/form" method="get" style="display:inline;">
                        <input type="hidden" name="id" value="${employee.id}">
                        <input type="submit" value="Update" class="btn btn-warning btn-sm">
                    </form>
                    <form action="/employees/delete" method="post" style="display:inline;" onsubmit="return confirmDelete();">
                        <input type="hidden" name="id" value="${employee.id}">
                        <input type="submit" value="Delete" class="btn btn-danger btn-sm">
                    </form>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
<script>
    function confirmDelete() {
        if (confirm('Are you sure you want to delete this employee?')) {
            alert('Employee deleted successfully!');
            return true;
        }
        return false;
    }
</script>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>