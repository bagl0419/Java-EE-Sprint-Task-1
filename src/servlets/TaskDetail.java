package servlets;

import db.DBManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.Tasks;

import java.io.IOException;

@WebServlet(value = "/details")
public class TaskDetail extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Long id = Long.valueOf(req.getParameter("id"));
        Tasks task = DBManager.getTaskById(id);
        req.setAttribute("OneTask", task);
        req.getRequestDispatcher("detailsPage.jsp").forward(req,resp);
    }
}
