import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "SimpleLoginServlet",urlPatterns = "/login")
public class SimpleLoginServlet extends HttpServlet {
    String userName;
    String password;
    PrintWriter writer;
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        userName = request.getParameter("username");
        password = request.getParameter("password");
        writer = response.getWriter();
        writer.println("<html>");

        if (userName.equals("admin") && password.equals("admin")) {
            writer.println("<h1>Welcome " + userName + " to the website</h1>");
        }
            else {
                writer.println("<h2>Wrong username and password</h2>");
        }

        writer.println("</html>");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        userName = request.getParameter("username");
//        password = request.getParameter("password");
        writer = response.getWriter();
        writer.println("<html lang=\"en\">\n" +
                "<head>\n" +
                "    <meta charset=\"UTF-8\">\n" +
                "    <title>Story page</title>\n" +
                "</head>\n" +
                "<link rel=\"stylesheet\" type=\"text/css\" href=\"story_page.css\">\n" +
                "<body>\n" +
                "<div>\n" +
                "    <h3 style=\"color: coral; font-style: italic\">This is a test story page</h3>\n" +
                "</div>\n" +
                "<div class=\"mainMenu\">\n" +
                "    <button class=\"button\" type=\"button\">Main Menu</button>\n" +
                "    <input type=\"text\" style=\"display: inline; width: 300px;height: 40px\">\n" +
                "    <button class=\"button\" type=\"button\">Search</button>\n" +
                "</div>\n" +
                "<div class=\"leftMenu\">\n" +
                "    <div class=\"subLeftMenu\">\n" +
                "        <a href=\"https://www.history.com/news\"><img src=\"chernobyl.jpg\" style=\"height: 100%; width: 100%\">\n" +
                "            <h4 class=\"subMenuText\">Historical story</h4></a>\n" +
                "\n" +
                "    </div>\n" +
                "    <div class=\"subLeftMenu\">\n" +
                "        <img src=\"sherlock.png\" style=\"height: 100%; width: 100%\">\n" +
                "        <h4 class=\"subMenuText\">Detective story</h4>\n" +
                "    </div>\n" +
                "    <div class=\"subLeftMenu\">\n" +
                "        <img src=\"dc_comis.jpg\" style=\"height: 100%; width: 100%\">\n" +
                "        <h4 class=\"subMenuText\">Comics</h4>\n" +
                "    </div>\n" +
                "</div>\n" +
                "<div class=\"rightMenu\">\n" +
                "    <p class=\"subMenuText\">Top 10 comics</p>\n" +
                "    <ul>\n" +
                "        <li><a href=\"https://en.wikipedia.org/wiki/Chernobyl_disaster\">The Chernobyl</a></li>\n" +
                "        <li><a href=\"https://vi.wikipedia.org/wiki/Sherlock_Holmes\">Sherlock Holmes</a></li>\n" +
                "        <li>Batman begin</li>\n" +
                "        <li>Justice League</li>\n" +
                "        <li>They Boys</li>\n" +
                "        <li>West World</li>\n" +
                "    </ul>\n" +
                "</div>\n" +
                "</body>\n" +
                "</html>");
    }
}
