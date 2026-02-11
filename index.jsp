<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Вычисление суммы ряда</title>
</head>
<body>


<%
    String xParam = request.getParameter("x");
    String nParam = request.getParameter("N");

    if (xParam != null && nParam != null) {
       
        try {
            double x = Double.parseDouble(xParam);
            int N = Integer.parseInt(nParam);

            double sum = 0;
            for (int n = 0; n <= N; n++) {

                
                int fact = 1;
                for (int i = 1; i <= 2 * n; i++) {
                    fact *= i;
                }

                double term = Math.pow(-1, n) * Math.pow(x, 2 * n) / fact;
                sum += term;
            }
%>
            <p>Результат: <%= sum %></p>
<%
        } catch (NumberFormatException e) {
%>
            <p style="color:red;">Ошибка: введите корректные числовые значения.</p>
<%
        }
    } else {
%>
        <p>Введите значения для вычисления суммы ряда:</p>
<%
    }
%>


<form>
    Введите x: <input type="text" name="x" required><br><br>
    Введите верхний предел N: <input type="text" name="N" required><br><br>
    <input type="submit" value="Вычислить">
</form>
</body>
</html>
