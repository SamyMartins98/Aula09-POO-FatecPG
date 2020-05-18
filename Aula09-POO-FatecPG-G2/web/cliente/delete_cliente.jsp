<%-- 
    Document   : delete
    Created on : 17/05/2020, 23:31:08
    Author     : angelo
--%>

<%@page import="classes.Banco"%>
<%@page import="classes.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
        
    String error=null;
    Cliente user = null;
    int i = -1;
    if(request.getParameter ("i") !=null){
        i = Integer.parseInt(request.getParameter("i"));
        user = Banco.getCli().get(i);  
    }

          if ( request.getParameter("remove") != null){
            String nome = request.getParameter("nome");
            String email = request.getParameter("email");
            String rg = request.getParameter("rg");
            String cpf = request.getParameter("cpf");
            String endereco = request.getParameter("endereco");
            int telefone = Integer.parseInt(request.getParameter("telefone"));
            
            Cliente editUser = new Cliente();
            editUser.setEmail(email);
            editUser.setNome(nome);
            editUser.setRg(rg);
            editUser.setCpf(cpf);
            editUser.setEndereco(endereco);
            editUser.setTelefone(telefone);
            Banco.getCli().remove(i);
            response.sendRedirect("cadastros.jsp");
        
        }
            
    


%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Excluir</title>
    </head>
    <body>
        <h1>Cadastro de Cliente/Fornecedor</h1>
        <h2><a href="cadastros.jsp">Cadastros</h2>
        <h3>Excluir mesmo o registro abaixo?</h3>
        
        <%if(error!=null){%>
        <div style="color:red"></div>      
          
            <%}else{%>
                <form method="post">
                    <input type="hidden" name="i" value="<%=i%>"/>
                    Nome:<br/>
                    <b><%=user.getNome()%></b><br/>
                    E-mail:<br/>
                    <b><%=user.getEmail()%></b><br/>
                    Telefone:<br/>
                    <b><%=user.getTelefone()%></b><br/>
                    CPF:<br/>
                    <b><%=user.getCpf()%></b><br/>
                    RG<br/>
                    <b><%=user.getRg()%></b><br/>
                    Endereço<br/>
                    <b><%=user.getEndereco()%></b><br/>
                    <br/><br/>
                    <input type=submit name="remove" value="Excluir"/><br/>
                </form>
            <%}%>
    </body>
</html>