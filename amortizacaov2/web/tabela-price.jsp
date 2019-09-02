<%-- 
    Document   : tabela-price
    Created on : 01/09/2019, 17:50:40
    Author     : cassi
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            table,th, td{
                border: 2px solid black;
                Border-Collapse: collapse
                
            }
            div{
                border: 2px solid black;
                width: 25%;
                margin-bottom: 40px;
                margin-top: 50px;
            }
           
           
        </style>
    </head>
    <body>
        <%@ include file="WEB-INF/jspf/header.jspf"%>
         
        
        <form>
            <div>
            <label>Valor financiado </label></br>
            <input type="number" name="valor"></br>
            
            <label id="mes">Meses</label></br>
            <input type="number" name="meses"></br>
            
            <label>Taxa de juros</label> </br>
            <input type="text" name="juros"/></br>
            
            <input type="submit" name="enviar" value="Calcular"/></br>
            </div>
            </form>
            <% if (request.getParameter("valor") != null
                   & request.getParameter("meses") != null
                   & request.getParameter("juros") != null) {
                
                    double valorPresente = Double.parseDouble(request.getParameter("valor"));
                    int meses = Integer.parseInt(request.getParameter("meses"));
                    double taxa = Double.parseDouble(request.getParameter("juros")) / 100;
                    DecimalFormat formatar = new DecimalFormat("0.##");
                    double juros = 0, somaJuros = 0, somaValor = 0, saldoDevedor = 0, parcela = 0, amortizacao = 0;
                    saldoDevedor = valorPresente;
%>
            
            <table>
                
                <tr>
                    <th>Mês</th>
                    <th>Saldo devedor</th>
                    <th>Parcela</th>
                    <th>Juros</th>
                    <th>Amortização</th>
                        
                </tr>
                 <% for (int i = 0; i <= meses; i++) { %>
            <tr>
                <th><%= i %></th>
                <td><%= formatar.format(saldoDevedor)%></td>
                <% if(i <= 0){ %>
                    <td>-</td>
                    <td>-</td>
                    <td>-</td>
                <% }else{ %>
                    <td><%= formatar.format(parcela)%></td>
                    <td><%= formatar.format(juros)%></td>
                    <td><%= formatar.format(amortizacao)%>
                    </td>
                <% } %>
            </tr>
            <%
                    parcela = valorPresente * taxa / (1 - (1 / (Math.pow((1 + taxa), meses))));
                    juros = saldoDevedor * taxa;
                    amortizacao = parcela - juros;
                    saldoDevedor = saldoDevedor - amortizacao;
                    somaJuros += juros;
                }%>
            <tr>
                <td>Total Pago:
                </td>
                <td><%=formatar.format(valorPresente + somaJuros)%></td>
            </tr>
            <% }%>
        
                
                
            </table>
            
      <%@ include file="WEB-INF/jspf/footer.jspf"%>
           
    </body>
</html>
