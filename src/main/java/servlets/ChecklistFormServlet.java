package servlets;

import Database.EntityDao;
import model.Checklist;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/checklist/add")
public class ChecklistFormServlet extends HttpServlet {
    private EntityDao dao = new EntityDao();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/checklist/form.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String archived = req.getParameter("archived");

        Checklist checklist = new Checklist();
        checklist.setName(req.getParameter("name"));
        boolean checked =((archived != null)&& archived.equalsIgnoreCase("on"));

        dao.saveOrUpdate(checklist);
        resp.sendRedirect("/checklist/list");
    }
}
