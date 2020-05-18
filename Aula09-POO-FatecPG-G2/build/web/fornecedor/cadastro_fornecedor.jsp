<%-- 
    Document   : cadastro_fornecedor
    Created on : 17/05/2020, 14:06:41
    Author     : angelo
--%>

<%@page import="classes.Banco"%>
<%@page import="classes.Fornecedor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String error = null;
    if(request.getParameter("add") !=  null)
    {
        String name = request.getParameter("nome");
        String email = request.getParameter("email");
        String endereco = request.getParameter("endereco");
        int telefone = Integer.parseInt( request.getParameter("telefone"));/*int telefone = integer.toString(telefone);*/ 
        String cnpj = request.getParameter("cnpj");
        String razaoSocial = request.getParameter("razaosocial");
        if(name.isEmpty())
        {
            error = "Nome Inválido";
        }
        else if(email.isEmpty())
        {
            error = "E-mail Inválido";
        }
        else if(cnpj.isEmpty())
        {
            error = "CPF Inválido";
        }
         else if(razaoSocial.isEmpty())
        {
            error = "RG Inválido";
        }
        else
         {
             Fornecedor forn = new Fornecedor();
             forn.setNome(name);
             forn.setEmail(email);
             forn.setRazaoSoscial(razaoSocial);
             forn.setCnpj(cnpj);
             forn.setTelefone(telefone);
             forn.setEndereco(endereco);
             Banco.getForn();
             response.sendRedirect("cadastros_fornecedores.jsp");
                
        } 
    }
%>
<html>
    <head>
        <title>Cadastro Fornecedor</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/jquery.mask.min.js"></script>	
	<script type="text/javascript">
            $(document).ready(function(){
			$("#cpf").mask("000.000.000-00");
			$("#cnpj").mask("00.000.000/0000-00");
			$("#telefone").mask("(00) 0000-0000");
			$("#cep").mask("00000-000");
			$("#dataNascimento").mask("00/00/0000");
			$("#rg").mask("999.999.999-W", {
				translation: {
					'W': {
						pattern: /[X0-9]/
					}
				},
				reverse: true
			});	
			var options = {
				translation: {
					'A': {pattern: /[A-Z]/},
					'a': {pattern: /[a-zA-Z]/},
					'S': {pattern: /[a-zA-Z0-9]/},
					'L': {pattern: /[a-z]/}
				}
			};
			$("#celular").mask("(00) 0000-00009");
			$("#celular").blur(function(event){
				if ($(this).val().length === 15){
					$("#celular").mask("(00) 00000-0009");
				}else{
					$("#celular").mask("(00) 0000-00009");
				}
			});
                        $("#cep").focusout(function(){
            var cep = $("#cep").val();
            cep = cep.replace("-", "");
 
            var urlStr = "https://viacep.com.br/ws/"+ cep +"/json/";
         
            $.ajax({
                url : urlStr,
                type : "get",
                dataType : "json",
                success : function(data){
                    console.log(data);
                     
                    $("#cidade").val(data.localidade);
                    $("#estado").val(data.uf);
                    $("#bairro").val(data.bairro);
                    $("#rua").val(data.logradouro);
                    $("#complemento").val(data.complemento);
                },
                error : function(erro){
                    console.log(erro);
                }
                });
               });
            });
        </script>
    </head>
    <body>
        <h1>Novo Fornecedor</h1>
        
        <div>
            <form name="formulario" method="post">
                <label>Nome:</label>
		<input type="text" name="nome" id="nome" placeholder="digite seu Nome"/>
		<br />
		<label>Razão Social:</label>
		<input type="text" name="razaosocial" id="razaosocial" />
		<br />
		<label>CNPJ:</label>
                <input type="text" name="cnpj" id="cnpj" placeholder="digite seu CNPJ" />
		<br />
                <label>E-mail:</label>
                <input type="email" name="email" id="email" placeholder="digite seu E-mail" />
		<br />
		<label>Telefone:</label>
                <input type="text" name="telefone" id="telefone" placeholder="digite seu Telefone" />
		<br />
		<label>Celular:</label>
		<input type="text" name="celular" id="celular" placeholder="digite seu Celular" />
		<br />
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
		<input type="submit" name="enviar" value="Enviar" />
                <input type="button" name="voltar" value="Voltar" onclick="history.go(-1)" />
            </form>
        </div>
        
    </body>
</html>