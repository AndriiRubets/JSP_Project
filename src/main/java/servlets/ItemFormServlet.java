package servlets;

import Database.EntityDao;
import model.Checklist;
import model.ChecklistItem;
import model.Status;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Optional;

@WebServlet("/item/add")
public class ItemFormServlet extends HttpServlet {
    private EntityDao dao = new EntityDao();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/item/form.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String finished = req.getParameter("archived");
        String checklistId = req.getParameter("checklistId");
        boolean completed =((finished != null)&& finished.equalsIgnoreCase("on"));
        Status subject = Status.valueOf(req.getParameter("status").toUpperCase());

        Optional<Checklist> checklistOptional = dao.findById(Checklist.class, Long.parseLong(checklistId));

        if (checklistOptional.isPresent()) {
            Checklist checklist=checklistOptional.get();
            ChecklistItem item = new ChecklistItem();
            item.setName(req.getParameter("name"));
            item.setCompleted(completed);
            item.setDescription("description");
            item.setStatus(subject);
            item.setChecklist(checklist);

            dao.saveOrUpdate(item);
            checklist.getChecklistItems().add(item);
            dao.saveOrUpdate(checklist);
        }

        resp.sendRedirect("/item/list");
    }
}
