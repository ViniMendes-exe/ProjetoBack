# language: pt

Funcionalidade: Pesquisar Funcionarios
    Para averiguar informacoes
    O usuario do sistema
    Deseja poder consultar informacoes dos Funcionarios

    Cenario: Buscar informacoes de funcionario
        Dado que o usuario consulte informacoes de funcionario
        Quando ele realizar a pesquisa
        Entao uma lista de funcionarios deve retornar
    
    
    Cenario: Cadastrar funcionario
        Dado que o usuario cadastre um novo funcionario
        Quando ele enviar as informacoes de funcionario
        Entao esse funcionario sera cadastrado

    Cenario: Alterar informacoes cadastrais
        Dado que o usuario altere uma informacao de funcionario
        Quando ele enviar as novas informacoes
        Entao as informacao serao alteradas