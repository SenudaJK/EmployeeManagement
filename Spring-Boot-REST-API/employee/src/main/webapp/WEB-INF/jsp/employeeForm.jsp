<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Employee Form</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container">
    <h1 class="mt-5">Employee Form</h1>
    <form action="/employees/submit" method="post" onsubmit="return validateForm();">
        <input type="hidden" name="id" value="${employee.id}">

        <div class="form-group">
            <label for="firstName">First Name:</label>
            <input type="text" id="firstName" name="firstName" value="${employee.firstName}" class="form-control" required minlength="2" maxlength="50">
        </div>

        <div class="form-group">
            <label for="lastName">Last Name:</label>
            <input type="text" id="lastName" name="lastName" value="${employee.lastName}" class="form-control" required minlength="2" maxlength="50">
        </div>

        <div class="form-group">
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" value="${employee.email}" class="form-control" required>
        </div>

        <input type="submit" value="Submit" class="btn btn-primary">
    </form>

    <a href="/employees/view" class="btn btn-secondary mt-3">View Employees</a>
</div>
<script>
    function validateForm() {
        // Additional custom validations can be added here
        alert('Employee submitted successfully!');
        return true;
    }
</script>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>