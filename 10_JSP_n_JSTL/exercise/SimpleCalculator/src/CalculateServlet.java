import models.Calculator;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "CalculateServlet", urlPatterns = "/Calculate")
public class CalculateServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Calculator calculator = new Calculator();
        PrintWriter writer = response.getWriter();
        String result = "";
        String operand = request.getParameter("operand");
        float num1 = 0;
        float num2 = 0;
        try {
            num1 = Float.parseFloat(request.getParameter("firstParameter"));
            num2 = Float.parseFloat(request.getParameter("secondParameter"));
            switch (operand) {
                case ("+"):
                    result = result+ calculator.plus(num1, num2);
                    break;
                case ("-"):
                    result = result+ calculator.minus(num1, num2);
                    break;
                case ("*"):
                    result = result+ calculator.multiple(num1, num2);
                    break;
                case ("/"):
                    result = result+ calculator.division(num1, num2);
                    break;
            }
        } catch (ArithmeticException a) {
            result = "The second parameter can not be 0 in division case";
        } catch (Exception e) {
            result = "Invalid input";
        }
        writer.println("<html>\n" +
                "<head>\n" +
                "    <title>Result</title>\n" +
                "</head>\n" +
                "<body>\n" +
                "<h1>Result</h1>\n" +
                "\n" +
                "<h3>"+
                num1 + " " + operand +" "+ num2 + " = " +result +
                "</h3>\n" +
                "</body>\n" +
                "</html>");
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
