<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">

        <title>Users</title>
    </head>
    <body>
        <h1>User Management System</h1>

        <table class="table table-hover">
            <thead>
                <tr>
                    <th>Email</th>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Active</th>
                    <th>Role #</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="user" items="${userArray}">
                    <tr>
                        <td>${user.email}</td>
                        <td>${user.firstName}</td>
                        <td>${user.lastName}</td>
                        <td>${user.active ? "Yes" : "No"}</td>
                        <td>${user.role.getRoleID()}</td>
                        <td>
                            <form action = "users" method="post">
                                <input type="hidden" name="action" value="edit">
                                <a href="" class="btn btn-primary">Edit</a>
                        </td>
                        </form>
                        <td>
                            <form action = "users" method="post">
                                <input type="hidden" name="action" value="delete">
                                <button type="" class="btn btn-primary">Delete</button>
                        </td>
                        </form>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <br>
        <!-- Both the edit and add table do absolutely nothing, I could not figure out how to 
        implement the way to send it to the servlet to process the request. I understood the general
        idea but for the life of me could not figure it out.-->
        <h1>Edit User</h1>
        <form action="user" method="POST">
            <input type="hidden" name="action" value="edit">
            <table>
                <tr><td><label for="editEmail">Email: </label></td><td><input type="text" class="form-control"name="editEmail"></td></tr>
                <tr><td><label for="editFirst">First Name: </label></td><td><input type="text" class="form-control"name="editFirst"></td></tr>
                <tr><td><label for="editLast">Last Name: </label></td><td><input type="text" class="form-control"name="editLast"></td></tr>
                <tr><td><label for="editPassword">Password: </label></td><td><input type="text" class="form-control"name="editPassword" ></td></tr>
                <tr><td><label for="editRole"></label></td>
                    <td>
                        <select name="editRole">
                            <option>Edit Role</option>
                            <c:forEach var="role" items="${roleArray}">
                                <option>${role.name}</option>
                            </c:forEach>
                        </select>
                    </td>
                </tr>
            </table>
        </form>
        <br>
        <br>
        <h1>Add User</h1>
        <form action="user" method="POST">
            <input type="hidden" name="action" value="add">
            <table>
                <tr><td><label for="addEmail">Email: </label></td><td><input type="text" class="form-control"name="addEmail"></td></tr>
                <tr><td><label for="addFirst">First Name: </label></td><td><input type="text" class="form-control"name="addFirst"></td></tr>
                <tr><td><label for="addLast">Last Name: </label></td><td><input type="text" class="form-control"name="addLast"></td></tr>
                <tr><td><label for="addPassword">Password: </label></td><td><input type="text" class="form-control"name="addPassword" ></td></tr>
                <tr><td><label for="addRole"></label></td>
                    <td>
                        <select name="addRole">
                            <option>Choose Role</option>
                            <c:forEach var="role" items="${roleArray}">
                                <option>${role.name}</option>
                            </c:forEach>
                        </select>
                    </td>
                </tr>
            </table>
        </form>
        <br>
        <br>
    </body>
</html>