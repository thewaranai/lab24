<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Lab 24</title>
</head>
<body>
    <h1>Вычисление суммы ряда</h1>
    <form method="post">
        X: <input type="text" name="x"><br>
        N: <input type="text" name="n"><br>
        <input type="submit" value="Вычислить">
    </form>

    <%
    String xStr = request.getParameter("x");
    String nStr = request.getParameter("n");
    
    if (xStr != null && nStr != null && !xStr.isEmpty() && !nStr.isEmpty()) {
        try {
            double x = Double.parseDouble(xStr);
            int n = Integer.parseInt(nStr);
            double sum = 0;
            
            for (int i = 0; i < n; i++) {
                sum += Math.pow(-1, i) * Math.pow(x, i) / factorial(i);
            }
            
            out.println("<p>Результат: " + sum + "</p>");
        } catch (NumberFormatException e) {
            out.println("<p style='color:red'>Ошибка: введите корректные числа!</p>");
        }
    }
    %>

    <%!
    private long factorial(int num) {
        if (num <= 1) return 1;
        return num * factorial(num - 1);
    }
    %>
</body>
</html>
