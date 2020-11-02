import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "money_converter_Servlet",urlPatterns = "/convert")
public class money_converter_Servlet extends HttpServlet {
    float rate;
    float usd;
    float vnd;
    PrintWriter writer;
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        rate = Float.parseFloat(request.getParameter("rate"));
        usd = Float.parseFloat(request.getParameter("usd"));
        vnd = rate * usd;
        writer = response.getWriter();
        writer.println("<html>\n" +
                "  <head>\n" +
                "    <title>Money Converter</title>\n" +
                "    <link rel=\"stylesheet\" href=\"https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css\" integrity=\"sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh\" crossorigin=\"anonymous\">\n" +
                "    <script src=\"https://code.jquery.com/jquery-3.4.1.slim.min.js\" integrity=\"sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n\" crossorigin=\"anonymous\"></script>\n" +
                "    <script src=\"https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js\" integrity=\"sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo\" crossorigin=\"anonymous\"></script>\n" +
                "    <script src=\"https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js\" integrity=\"sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6\" crossorigin=\"anonymous\"></script>\n" +
                "  </head>\n" +
                "\n" +
                "  <body style=\"margin: 10px\">\n" +
                "  <form style=\"width: 30%\" method=\"get\" action=\"/convert\">\n" +
                "    <div class=\"form-group\">\n" +
                "      <label for=\"rate\">Rate:</label>\n" +
                "      <input type=\"text\" class=\"form-control\" id=\"rate\" aria-describedby=\"VND amount\" name=\"VND\" value = \""+ rate +"\">\n" +
                "    </div>\n" +
                "    <div class=\"form-group\">\n" +
                "      <label for=\"usd\">USD</label>\n" +
                "      <input type=\"text\" class=\"form-control\" id=\"usd\" value = \""+ usd+"\">\n" +
                "    </div>\n" +
                "    <div class=\"form-group\">\n" +
                "      <label for=\"usd\">VND</label>\n" +
                "      <input type=\"text\" class=\"form-control\" id=\"VND\" value = \""+ vnd+"\">\n" +
                "    </div>\n" +
                "  </form>\n" +
                "  </body>\n" +
                "</html>");
    }
}
