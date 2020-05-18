<%-- 
    Document   : editar_fornecedor
    Created on : 17/05/2020, 23:33:04
    Author     : angelo
--%>

<%@page import="classes.Banco"%>
<%@page import="classes.Fornecedor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String error = null;
    Fornecedor forn = null;
    int i = -1;
    if(request.getParameter("i") != null){
        i = Integer.parseInt(request.getParameter("i"));
        forn = Banco.getForn().get(i);
        if(forn == null){
            error = "Índice inválido!";
        }
    }
    
           if ( request.getParameter("edit") != null){
            String nome = request.getParameter("nome");
            String email = request.getParameter("email");
            String razaoSocial = request.getParameter("razaoSocial");
            String cnpj = request.getParameter("cnpj");
            int telefone = Integer.parseInt( request.getParameter("telefone"));
            String endereco = request.getParameter("endereco");
            if (nome.isEmpty()) {
                error = "Nome do usuario invalido";
            }   else if ( email.isEmpty()){
                error = "Email Invalido";
            }   else if (cnpj.isEmpty()) {
                error = "CPF invalida";
            } 
            else
            {
                   
                        // Inclusao de usuario
                        Fornecedor editUser = new Fornecedor();
                        editUser.setEmail(email);
                        editUser.setNome(nome);
                        editUser.setRazaoSocial(razaoSocial);
                        editUser.setCnpj(cnpj);
                        editUser.setTelefone(telefone);
                        editUser.setEndereco(endereco);
                        Banco.getForn().set(i, editUser);
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
            <input type="text" name="nome" value="<%= forn.getNome()%>"/><br/>
            E-mail:<br/>
            <input type="email" name="email" value="<%= forn.getEmail()%>"/><br/>
            Telefone:<br/>
            <input type="number" name="telefone" value="<%= forn.getTelefone()%>"/><br/>
                Razao Social:<br/>
                <input type="text" name="razaoSocial" value="<%= forn.getRazaoSocial()%>"/><br/>
                CNPJ:<br/>
                <input type="text" name="cnpj" value="<%= forn.getCnpj()%>"/><br/>
                
                <label>CEP:</label>
		<input type="text" name="cep" id="cep" placeholder="busca automática" />
		<br />
                <label>Cidade:</label>
		<input type="text" name="cidade" id="cidade" />
		<br />
                <label>Estado:</label>
		<input type="text" name="estado" id="estado" />
		<br />
                <label>Bairro:</label>
		<input type="text" name="bairro" id="bairro" />
		<br />
                <label>Rua:</label>
		<input type="text" name="rua" id="rua" />
		<br />
                <label>Número:</label>
		<input type="text" name="numero" id="numero" />
		<br />
                <label>Complemento:</label>
		<input type="text" name="complemento" id="complemento" />
		<br />
          
            <input type="submit" name="edit" value="Editar"/><br/>
        </form>
        <%}%>
    </body>
</html>