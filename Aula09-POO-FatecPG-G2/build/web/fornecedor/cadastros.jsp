<%-- 
    Document   : cadastros
    Created on : 18/05/2020, 11:27:32
    Author     : angelo
--%>

<%@page import="classes.Banco"%>
<%@page import="classes.Fornecedor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <h3>Cadastrar Clientes</h3>
        
        <table border="1"> 
            <tr>
                <th>Nome</th>
                <th>E-mail</th>
                <th>Cnpj</th>
                <th>Razão Social</th>
                <th>Telefone</th>
                <th>Comandos</th>
            <tr>
                
            <%for (Fornecedor forn: Banco.getFornecedor()) {%>
            </tr>
            <td><%= forn.getNome()%></td>
            <td><%= forn.getEmail()%></td>
            <td><%= forn.getCnpj()%></td>
            <td><%= forn.getRazaoSocial()%></td>
            <td><%= forn.getTelefone()%></td>
            <td>
                <%int i = Banco.getCli().indexOf(forn);%>
                <a href="editar_fornecedor.jsp?i=<%=i%>">Alterar</a>
                <a href="deletar_fornecedor.jsp?i=<%=i%>">Deletar</a>
            </td>
            </tr>
            <%}%>
        </table>
    </body>
</html>