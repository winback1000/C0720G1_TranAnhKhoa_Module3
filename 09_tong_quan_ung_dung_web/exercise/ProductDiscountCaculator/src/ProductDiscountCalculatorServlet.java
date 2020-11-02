import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "ProductDiscountCalculatorServlet", urlPatterns = "/count")
public class ProductDiscountCalculatorServlet extends HttpServlet {
    String description;
    double price;
    double discountPercent;
    PrintWriter writer;
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        writer = response.getWriter();
        try {
        description = request.getParameter("description");
        price = Float.parseFloat(request.getParameter("price"));
        discountPercent = Float.parseFloat(request.getParameter("discountPercent"));
        writer.println(returnResult(description,price,discountPercent));
        }
        catch (Exception e) {
            writer.println("<html>\n" +
                    "  <head>\n" +
                    "    <title>Product Discount Calculator</title>\n" +
                    "    <link rel=\"stylesheet\" href=\"https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css\" integrity=\"sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh\" crossorigin=\"anonymous\">\n" +
                    "    <script src=\"https://code.jquery.com/jquery-3.4.1.slim.min.js\" integrity=\"sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n\" crossorigin=\"anonymous\"></script>\n" +
                    "    <script src=\"https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js\" integrity=\"sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo\" crossorigin=\"anonymous\"></script>\n" +
                    "    <script src=\"https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js\" integrity=\"sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6\" crossorigin=\"anonymous\"></script>\n" +
                    "  </head>\n" +
                    "\n" +
                    "  <body>\n" +
                    "  <h1 color=\"red\">Incorrect input, please try again!!!</h1>\n" +
                    "  <form method=\"post\" action =\"/count\">\n" +
                    "    <table class=\"table table-striped table-inverse table-responsive\" style=\"table-border-color-dark: blue\">\n" +
                    "      <thead class=\"thead-inverse\">\n" +
                    "      <tr>\n" +
                    "        <th>Product Description</th>\n" +
                    "        <th>List Price</th>\n" +
                    "        <th>Discount Percent</th>\n" +
                    "        <th>Discount Amount</th>\n" +
                    "        <th>Discount Price</th>\n" +
                    "      </tr>\n" +
                    "      </thead>\n" +
                    "      <tbody>\n" +
                    "      <tr>\n" +
                    "        <td scope=\"row\"><input type=\"text\" name=\"description\"></td>\n" +
                    "        <td><input type=\"text\" name=\"price\"></td>\n" +
                    "        <td><input type=\"text\" name=\"discountPercent\"></td>\n" +
                    "        <td><input type=\"text\" name=\"discountAmount\" readonly value=\"\"></td>\n" +
                    "        <td><input type=\"text\" name=\"discountPrice\" readonly value=\"\"></td>\n" +
                    "      </tr>\n" +
                    "      </tbody>\n" +
                    "    </table>\n" +
                    "    <button type=\"submit\" name=\"count\" id=\"count\" class=\"btn btn-primary btn-lg-col-1 btn-block\" style=\"width: 100px; float: left\"><h5>Count</h5></button>\n" +
                    "  </form>\n" +
                    "  </body>\n" +
                    "</html>");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
    protected double countDiscountAmount(double price, double percent) {
        return price*percent*0.01;
    }
    protected double countDiscountPrice(double price, double percent) {
        return price - price*percent*0.01;
    }
    protected String returnResult(String description, double price, double discountPercent) {
        return "<html>\n" +
                "  <head>\n" +
                "    <title>Product Discount Calculator</title>\n" +
                "    <link rel=\"stylesheet\" href=\"https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css\" integrity=\"sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh\" crossorigin=\"anonymous\">\n" +
                "    <script src=\"https://code.jquery.com/jquery-3.4.1.slim.min.js\" integrity=\"sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n\" crossorigin=\"anonymous\"></script>\n" +
                "    <script src=\"https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js\" integrity=\"sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo\" crossorigin=\"anonymous\"></script>\n" +
                "    <script src=\"https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js\" integrity=\"sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6\" crossorigin=\"anonymous\"></script>\n" +
                "  </head>\n" +
                "\n" +
                "  <body>\n" +
                "  <form method=\"post\" action =\"/MainPage\">\n" +
                "    <table class=\"table table-striped table-inverse table-responsive\" style=\"table-border-color-dark: blue\">\n" +
                "      <thead class=\"thead-inverse\">\n" +
                "      <tr>\n" +
                "        <th>Product Description</th>\n" +
                "        <th>List Price</th>\n" +
                "        <th>Discount Percent</th>\n" +
                "        <th>Discount Amount</th>\n" +
                "        <th>Discount Price</th>\n" +
                "      </tr>\n" +
                "      </thead>\n" +
                "      <tbody>\n" +
                "      <tr>\n" +
                "        <td scope=\"row\"><input type=\"text\" name=\"description\" value=\""+description+"\"></td>\n" +
                "        <td><input type=\"text\" name=\"price\" value = \""+price+"\"></td>\n" +
                "        <td><input type=\"text\" name=\"discountPercent\" value = \""+discountPercent+"\"></td>\n" +
                "        <td><input type=\"text\" name=\"discountAmount\" readonly value=\""+countDiscountAmount(price,discountPercent)+"\"></td>\n" +
                "        <td><input type=\"text\" name=\"discountPrice\" readonly value=\""+countDiscountPrice(price,discountPercent)+"\"></td>\n" +
                "      </tr>\n" +
                "      </tbody>\n" +
                "    </table>\n" +
                "    <button type=\"submit\" name=\"count\" id=\"count\" class=\"btn btn-primary btn-lg-col-1 btn-block\" style=\"width: 100px; float: left\"><h5>Main Page</h5></button>\n" +
                "  </form>\n" +
                "  </body>\n" +
                "</html>";
    }
}
