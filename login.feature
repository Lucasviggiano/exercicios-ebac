# language: pt

Feature: login na plataforma

    Como cliente da EBAC-SHOP
    Quero me autenticar na plataforma
    Para visualizar meus itens

    Background: autenticar login
        Given que o cliete acesse a página de autenticação da EBAC-SHOP

    Scenario: Autenticação válida
        When o cliente iserir o usuário "lucas@ebac.com"
        And  senha "senha123"
        Then deve direcionar para a tela de checkout


    Scenario Outline: autenticação inválida
        When o cliente inserir o <usuario> e <senha>
        Then deve exibir a <mensagem>

    Example:
            | usuario             | senha          | mensagem                     |
            | "luca321s@ebac.com" | "senha123"     | "usuário ou senha inválidos" |
            | "Ana@ebac.com"      | "senha321"     | "usuário ou senha inválidos" |
          

