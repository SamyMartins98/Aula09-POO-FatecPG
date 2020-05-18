<%-- 
    Document   : delete_fornecedor
    Created on : 18/05/2020, 11:17:15
    Author     : angelo
--%>

<%@page import="classes.Banco"%>
<%@page import="classes.Fornecedor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
        
    String error=null;
    Fornecedor forn = null;
    int i = -1;
    if(request.getParameter ("i") !=null){
        i = Integer.parseInt(request.getParameter("i"));
        forn = Banco.getForn().get(i);  
    }

          if ( request.getParameter("remove") != null){
            String nome = request.getParameter("nome");
            String email = request.getParameter("email");
            String razaoSocial = request.getParameter("razaoSocial");
            String cnpj = request.getParameter("cnpj");
            String endereco = request.getParameter("endereco");
            int telefone = Integer.parseInt(request.getParameter("telefone"));
            
            Fornecedor editUser = new Fornecedor();
            editUser.setEmail(email);
            editUser.setNome(nome);
            editUser.setRazaoSocial(razaoSocial);
            editUser.setCnpj(cnpj);
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
                    <b><%=forn.getNome()%></b><br/>
                    E-mail:<br/>
                    <b><%=forn.getEmail()%></b><br/>
                    Telefone:<br/>
                    <b><%=forn.getTelefone()%></b><br/>
                    CPF:<br/>
                    <b><%=forn.getCnpj()%></b><br/>
                    RG<br/>
                    <b><%=forn.getRazaoSocial()%></b><br/>
                    Endereço<br/>
                    <b><%=forn.getEndereco()%></b><br/>
                    <br/><br/>
                    <input type=submit name="remove" value="Excluir"/><br/>
                </form>
            <%}%>
    </body>
</html>
