package murach.email;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import murach.business.User;
import murach.data.UserDB;

@WebServlet(name = "EmailList", urlPatterns = {"/emailList]"})
public class EmailListServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String url = "/index.html";
        // get current action
        String action = request.getParameter("action");
        if (action == null) {
            action = "join";  // default action
        }
        // perform action and set URL to appropriate page
        if (action.equals("join")) {
            url = "/index.html";    // the "join" page
        } else if (action.equals("add")) {
            // get parameters from the request
            String firstName = request.getParameter("firstName");
            String lastName = request.getParameter("lastName");
            String email = request.getParameter("email");
            // store data in User object and save User object in database
            User user = new User(firstName, lastName, email);
            if (UserDB.emailExists(email)) {
                request.setAttribute("message", "This email address already exists.");
                request.setAttribute("user", user);
                url = "/thanks.jsp"; // redirect to the thanks page with a duplicate message
            } else {
                UserDB.insert(user);
                // set User object in request object and set URL
                request.setAttribute("user", user);
                request.setAttribute("message", "Thanks for joining our email list!");
                url = "/thanks.jsp";   // the "thanks" page
            }
        }

        // forward request and response objects to specified URL
        getServletContext()
                .getRequestDispatcher(url)
                .forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        String url = "/index.html";

        if (action.equals("show")) {
            List<User> users = UserDB.getAll();
            request.setAttribute("users", users);
            url = "/user-list.jsp";
        }

        getServletContext()
                .getRequestDispatcher(url)
                .forward(request, response);
    }
}
