<%--
  Created by IntelliJ IDEA.
  User: bagl0
  Date: 06.02.2024
  Time: 22:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="models.Tasks" %>
<%@ page import="db.DBManager" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
            integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
            integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
            crossorigin="anonymous"></script>
</head>
<body>
<div class="container">
    <%@include file="navbar.jsp" %>
    <br><br>
    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addModal">
        Добавить задание+
    </button>
    <br><br>

    <table class="table table-striped">
        <thead>
        <tr>
            <th scope="col">ID</th>
            <th scope="col">Наименование</th>
            <th scope="col">Крайний срок</th>
            <th scope="col">Выполнено</th>
            <th scope="col" width="10%">Детали</th>
        </tr>
        </thead>
        <tbody>
        <%
            ArrayList<Tasks> taskArrayList = DBManager.getAllTasks();
            for (Tasks task : taskArrayList) {
        %>

        <tr>
            <td><%=task.getId()%>
            </td>
            <td><%=task.getName()%>
            </td>
            <td><%=task.getDeadlineDate()%>
            </td>
            <td><%=task.isStatus()%>
            </td>
            <td>
                <a href="/details?id=<%=task.getId()%>" class="btn btn-dark">DETAILS</a>
            </td>
        </tr>

        <%
            }
        %>
        </tbody>
    </table>
</div>

<!-- Modal -->
<div class="modal fade" id="addModal" tabindex="-1" aria-labelledby="addModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="addModalLabel">Создать задачу</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form action="/addTask" method="post">
                <div class="modal-body">
                    <div class="mb-3">
                        <label for="FormName" class="form-label">Наименование:</label>
                        <input name="name" type="text" class="form-control" id="FormName">
                    </div>
                    <div class="mb-3">
                        <label for="exampleFormControlTextarea1" class="form-label">Описание</label>
                        <textarea name="description" class="form-control" id="exampleFormControlTextarea1"
                                  rows="3"></textarea>
                    </div>
                    <div class="mb-3">
                        <label for="exampleFormControlInput1" class="form-label">Крайний срок:</label>
                        <input name="deadlineDate" type="date" class="form-control" id="exampleFormControlInput1">
                    </div>
                    <select class="form-select mb-3" name="status" aria-label="Default select example">
                        <option value="true">Да</option>
                        <option value="false">Нет</option>
                    </select>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Закрыть</button>
                    <button type="submit" class="btn btn-primary">Добавить</button>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>
