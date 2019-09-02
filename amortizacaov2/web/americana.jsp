<%-- 
    Document   : americana
    Created on : 01/09/2019, 23:38:12
    Author     : DeboraGP
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
        <%@ include file="WEB-INF/jspf/header.jspf" %>
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
    double valor = Double.parseDouble(request.getParameter("valor"));
    int meses = Integer.parseInt(request.getParameter("meses"));
    double juros = Double.parseDouble(request.getParameter("juros")) / 100;
    DecimalFormat formatar = new DecimalFormat("0.##");
    double amortizacao = 0, aux1 = 0, aux2 = 0, aux3 = 0;
%>
<div>
    <table>
        <tr>
            <th>#</th>
            <th>Parcelas</th>
            <th>Amortização</th>
            <th>Juros</th>
            <th>Saldo devedor</th>
        </tr>
        <tr>
            <% for (int i = 0; i < meses; i++) {
                    double parcela = valor * juros;
                    double saldoDevedor = valor;
                    if (i == (meses - 1)) {
                        parcela = parcela + valor;
                        amortizacao = valor;
                        saldoDevedor = saldoDevedor - valor;
                    }
            %>
        <tr>
            <td><%= (i + 1)%>
            </td>
            <td><%= formatar.format(parcela)%>
            </td>
            <td><%= formatar.format(amortizacao)%>
            </td>
            <td><%= formatar.format(valor * juros)%>
            </td>
            <td><%= formatar.format(saldoDevedor)%>
            </td>
        </tr>
        <% aux1 = aux1 + parcela;
            aux2 = aux2 + amortizacao;
            aux3 = aux3 + (valor * juros);
        }%>
        <tr>
            <td><strong>Total</strong></td>
            <td><%= aux1%>
            </td>
            <td><%= aux2%>
            </td>
            <td><%= aux3%>
            </td>
            <th>-</th>
        </tr>
        <%}%>
    </table>
      <%@ include file="WEB-INF/jspf/footer.jspf"%>

</body>
</html>