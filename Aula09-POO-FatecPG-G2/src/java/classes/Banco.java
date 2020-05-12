/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package classes;

import java.util.ArrayList;

/**
 *
 * @author angelo
 */
public class Banco {
    
    private static ArrayList<Cliente> cli;
    
    public static ArrayList<Cliente> getCli()
    {
        if(cli == null)
        {
            cli = new ArrayList<>();
            Cliente teste = new Cliente();
            teste.setNome("Jão");
            teste.setEmail("joaozinho@jao.com");
            teste.setTelefone(123456789);
            teste.setCpf("123456");
            teste.setRg("123456");
            cli.add(teste);
        }
        return cli;
    }
    
    private static ArrayList<Fornecedor> fornecedor;
    
        public static ArrayList<Fornecedor> getFornecedor()
    {
        if(fornecedor == null)
        {
            fornecedor = new ArrayList<>();
            Fornecedor teste = new Fornecedor();
            teste.setNome("Fornecedor");
            teste.setEmail("tio@ortifruti.com");
            teste.setTelefone(123456789);
            teste.setCnpj("123456");
            teste.setRazaoSoscial("Tio do Ortifrut");
            fornecedor.add(teste);
        }
        return fornecedor;
    }
    
}
