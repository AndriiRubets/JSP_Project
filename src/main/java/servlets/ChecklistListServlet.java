package servlets;

import Database.EntityDao;
import model.Checklist;
import model.ChecklistItem;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/checklist/list")
public class ChecklistListServlet extends HttpServlet {
    private EntityDao dao=new EntityDao();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("checklistList", dao.findAll(Checklist.class) );
        req.getRequestDispatcher("/checklist/list.jsp").forward(req,resp);
    }
}
