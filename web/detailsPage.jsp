<%@ page import="models.Tasks" %><%--
  Created by IntelliJ IDEA.
  User: bagl0
  Date: 06.02.2024
  Time: 23:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="...">

    <!-- Bootstrap JS и зависимости (popper.js и Bootstrap.bundle.min.js) -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="..."
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="..."
            crossorigin="anonymous"></script>
</head>
<body>
<div class="container">
    <%@include file="navbar.jsp" %>
    <br><br>
        <%
        Tasks task = (Tasks) request.getAttribute("OneTask");
    %>
    <form action="/updateTask" method="post">
        <input type="hidden" name="id" value="<%=task.getId()%>">
        <div class="mb-3">
            <label for="FormName" class="form-label">Наименование:</label>
            <input value="<%=task.getName()%>" name="name" type="text" class="form-control" id="FormName">
        </div>
        <div class="mb-3">
            <label for="exampleFormControlTextarea1" class="form-label">Описание</label>
            <textarea name="description" class="form-control" id="exampleFormControlTextarea1"
                      rows="3"><%=task.getDescription()%></textarea>
        </div>
        <div class="mb-3">
            <label for="exampleFormControlInput1" class="form-label">Крайний срок:</label>
            <input value="<%=task.getDeadlineDate()%>" name="deadlineDate" type="date" class="form-control"
                   id="exampleFormControlInput1">
        </div>
        <select class="form-select mb-3" name="status" aria-label="Default select example">
            <option value="true" <%=task.isStatus() == "Да" ? "selected" : ""%>>Да</option>
            <option value="false" <%=task.isStatus() == "Нет" ? "selected" : ""%>>Нет</option>
        </select>
        <br><br>
        <div style="display: flex">
            <div>
                <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#exampleModal">
                    Удалить
                </button>
            </div>
            <div style="margin-left: 10px">
                <button type="submit" class="btn btn-success">
                    Сохранить
                </button>
            </div>
        </div>
    </form>

    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Вы уверены?</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <form action="/deleteTask" method="post">
                    <input type="hidden" name="id" value="<%=task.getId()%>">
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Закрыть</button>
                        <button type="submit" class="btn btn-danger">Удалить</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

</body>
</html>
