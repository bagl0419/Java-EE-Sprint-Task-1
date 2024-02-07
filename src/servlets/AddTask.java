package servlets;

import db.DBManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.Tasks;
import java.util.UUID;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(value = "/addTask")
public class AddTask extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ArrayList<Tasks> taskArrayList = DBManager.getAllTasks();
        Long id = taskArrayList.size() + 1L;
        String name = req.getParameter("name");
        String description = req.getParameter("description");
        String deadlineDate = req.getParameter("deadlineDate");
        boolean status = Boolean.parseBoolean(req.getParameter("status"));

        Tasks task = new Tasks(id, name, description, deadlineDate, status);
        DBManager.addTask(task);
        resp.sendRedirect("/tasks");
    }
}
