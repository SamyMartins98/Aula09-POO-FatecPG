<%-- 
    Document   : cadastros
    Created on : 18/05/2020, 11:22:46
    Author     : angelo
--%>

<%@page import="classes.Banco"%>
<%@page import="classes.Cliente"%>
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
                <th>CPF</th>
                <th>RG</th>
                <th>Telefone</th>
                <th>Comandos</th>
            <tr>

                <%for (Cliente cli : Banco.getCli()) {%>
            </tr>
            <td><%= cli.getNome()%></td>
            <td><%= cli.getEmail()%></td>
            <td><%= cli.getCpf()%></td>
            <td><%= cli.getRg()%></td>
            <td><%= cli.getTelefone()%></td>
            <td>
                <%int i = Banco.getCli().indexOf(cli);%>
                <a href="editar_cliente.jsp?i=<%=i%>">Alterar</a>
                <a href="delete_cliente.jsp?i=<%=i%>">Deletar</a>
            </td>
        </tr>
        <%}%>
    </table>
</body>
</html>
