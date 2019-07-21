package servlets;

import Database.EntityDao;
import model.Checklist;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/checklist/remove")
public class ChecklistRemoveServlet extends HttpServlet {
    private EntityDao dao=new EntityDao();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Long identifierToRemove=Long.parseLong(req.getParameter("checklistId"));

        dao.removeById(Checklist.class,identifierToRemove);

        resp.sendRedirect("/checklist/list");
    }
}
