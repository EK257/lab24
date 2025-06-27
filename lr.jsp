<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>ЛР24</title>
</head>
<body>
<h2>Вычисление суммы ряда</h2>

<form method="post">
    Введите значение x (|x| <= 1): <input type="text" name="x" /><br />
    Введите верхний предел n: <input type="text" name="limit" /><br />
    <input type="submit" value="Вычислить" />
</form>

<%
    String xParam = request.getParameter("x");
    String limitParam = request.getParameter("limit");

    if (xParam != null && limitParam != null) {
        try {
           double x = Double.parseDouble(xParam);
           int limit = Integer.parseInt(limitParam);
	   if (Math.abs(x) <= 1) {
               double sum = 0;
               for(int i = 0; i <= limit; i++){
                   sum += (Math.pow(-1, i) * Math.pow(x, 2*i+1)) / (2*i+1);
               }
%>
    <p>Сумма ряда: <strong><%= sum %></strong></p>
<%
    } else {
%>
    <p>|x| должен быть не больше единицы</p>
<%
    }} catch (NumberFormatException e) {
%>
    <p>Значения x или n введены неправильно!</p>
<%
    }}
%>
</body>
</html>