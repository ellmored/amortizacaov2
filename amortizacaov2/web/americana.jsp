<%-- 
    Document   : americana
    Created on : 01/09/2019, 23:38:12
    Author     : cassi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@ include file="WEB-INF/jspf/header.jspf" %>
        <form action =" calculo"  method =" POST">


            <h3 style= "font-family: sans-serif; color: dimgray; font-size: 20px; "> Total do emprestimo (reais) </h3>
                              <input type =" text" size =" 15" name = " total"> 
                              <h3 style= "font-family: sans-serif; color: dimgray; font-size: 20px; ">  Quantidade de parcelas(meses) </h3>
                              <input type=" text" size =" 3" name =" tempo"> 
                        <h3 style= "font-family: sans-serif; color: dimgray; font-size: 20px; "> Escolha a tabela </h3>

                           <div class="tab">
                                <button class="tablinks" onclick="openCity(event, 'SAC')">SAC</button>
                                <button class="tablinks" onclick="openCity(event, 'PRICE')">PRICE</button>
                                <button class="tablinks" onclick="openCity(event, 'TABELA AMERICANA')">TABELA AMERICANA</button>
                           </div>


            </form>
        <%@ include file="WEB-INF/jspf/footer.jspf"%>
    </body>
</html>
