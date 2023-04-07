<?php  
  $host = "casadatecnologia.com.br";
  $user = "usuario_banco_de_dados";
  $pass = "senha_banco_de_dados";
  $db   = "banco_de_dados";

  $conecta = mysql_connect($host, $user, $pass) or print (mysql_select_db($db, $conecta));

  $nome_produto = $_REQUEST['nome_fornecedor'];
  $descricao_produto = $_REQUEST['endereco_fornecedor'];
  $valor_produto = $_REQUEST['contato_fornecedor'];
  $fornecedor = $_REQUEST['email_fornecedor'];
  
  $sql = "INSERT INTO produtos (nome_fornecedor, endereco_fornecedor, contato_fornecedor, email_fornecedor) VALUES 
         ('$nome_fornecedor', '$endereco_fornecedor', '$contato_fornecedor', '$email_fornecedor')";

  $query = mysql_query($sql);
?>