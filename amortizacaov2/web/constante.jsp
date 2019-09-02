<%-- 
    Document   : constante
    Created on : 01/09/2019, 17:31:58
    Author     : cassi
--%>

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
             <label>Valor financiado(R$)</label></br>
            <input type="text" size="10" name="valorFinaciado"><br>
            <label>Perpiodo (em meses)</label></br>
            <input type="text" size="10" name="periodoFinanciado"><br>
            <label>Taxa de Juros (%)</label></br>
            <input type="text" size="10" name="taxaJuros"><br>
            Calcular
            <input type="submit" value="calcular">
             </div>
            </form>
            
            <table>
            <% if(request.getParameter("valorFinaciado") != null){
                try{
                   
                    double valorFinaciado = Double.parseDouble(request.getParameter("valorFinaciado"));
                    double periodoFinanciado = Double.parseDouble(request.getParameter("periodoFinanciado"));
                    double taxaJuros = Double.parseDouble(request.getParameter("taxaJuros"));
                    double valorParcela = 0;
                     //calculo de juros
                    double juros = valorFinaciado * (taxaJuros/100);
                    
                    //calculo amortização
                    double amortiz = valorFinaciado / periodoFinanciado;
                    
                    //calculo do saldo devedor
                    double saldoAnterior = valorFinaciado;
                        out.println("<h2>Tabela SAC - Sistema de Amortização Constante</h2><br>");
                        out.println("<tr>");
                        out.println("<th>Período</th>");
                        out.println("<th>Valor da Prestação</th>");
                        out.println("<th>Valor da Amortização</th>");
                        out.println("<th>Valor do Juros</th>");
                        out.println("<th>Saldo Devedor</th>");
                        out.println("</tr>");
                        out.println("<tr>");
                        out.println("<td>0</td>");
                        out.println("<td>-</td>");
                        out.println("<td>-</td>");
                        out.println("<td>-</td>");
                        out.println("<td>" + valorFinaciado + "</td>");
                        out.println("</tr>");
                    for(int i = 0; i < periodoFinanciado; i++){
                        juros = saldoAnterior * (taxaJuros/100);
                        saldoAnterior = saldoAnterior - amortiz;
                        //calculo do valor da parcela
                        valorParcela = amortiz + juros;
                       
                        out.println("<tr>");
                        out.println("<td>" +(i+1)+"</td>");
                        out.println("<td>" +valorParcela+"</td>");
                        out.println("<td>" +amortiz+"</td>");
                        out.println("<td>" +juros+"</td>");
                        out.println("<td>" +saldoAnterior+"</td>");
                        out.println("</tr>");
                    }
                }catch(Exception ex){
                    out.println("Não é valido");
                }
            }
            %>
        </table><br>
        <%@ include file="WEB-INF/jspf/footer.jspf"%>
    </body>
</html>
