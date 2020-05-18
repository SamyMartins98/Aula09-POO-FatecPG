<%-- 
    Document   : editar_cliente
    Created on : 17/05/2020, 23:32:51
    Author     : angelo
--%>

<%@page import="classes.Cliente"%>
<%@page import="classes.Banco"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String error = null;
    Cliente cli = null;
    int i = -1;
    if(request.getParameter("i") != null){
        i = Integer.parseInt(request.getParameter("i"));
        cli = Banco.getCli().get(i);
        if(cli == null){
            error = "Índice inválido!";
        }
    }
    
           if ( request.getParameter("edit") != null){
            String nome = request.getParameter("nome");
            String email = request.getParameter("email");
            String cpf = request.getParameter("cpf");
            String rg = request.getParameter("rg");
            int telefone = Integer.parseInt( request.getParameter("telefone"));
            if (nome.isEmpty()) {
                error = "Nome do usuario invalido";
            }   else if ( email.isEmpty()){
                error = "Email Invalido";
            }   else if (cpf.isEmpty()) {
                error = "CPF invalida";
            } 
            else
            {
                   
                        // Inclusao de usuario
                        Cliente editUser = new Cliente();
                        editUser.setEmail(email);
                        editUser.setNome(nome);
                        editUser.setCpf(cpf);
                        editUser.setRg(rg);
                        editUser.setTelefone(telefone);
                        Banco.getCli().set(i, editUser);
                        response.sendRedirect("cadastros.jsp");
                   
            } 
        

        
        }
           

%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar - UserWebApp</title>
    </head>
    <body>
        <h1>User Web App</h1>
        <h2><a href="cadastros.jsp">Usuários</a></h2>
        <h3>Editar</h3>
        
       <% if (error != null ){ %>
         <div style="color: red"><%= error %> </div>       
        <% } else { %>
        
        <form method="post">
            <input type="hidden" name="i" value="<%=i%>">
            Nome do usuário:<br/>
            <input type="text" name="nome" value="<%= cli.getNome()%>"/><br/>
            E-mail:<br/>
            <input type="email" name="email" value="<%= cli.getEmail()%>"/><br/>
            Telefone:<br/>
            <input type="number" name="telefone" value="<%= cli.getTelefone()%>"/><br/>
                CPF:<br/>
                <input type="text" name="cpf" value="<%= cli.getCpf()%>"/><br/>
                RG:<br/>
                <input type="text" name="rg" value="<%= cli.getRg()%>"/><br/>
            <input type="submit" name="edit" value="Editar"/><br/>
        </form>
        <%}%>
    </body>
</html>

