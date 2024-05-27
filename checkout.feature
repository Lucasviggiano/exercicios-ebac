# language: PT

Feature: Tela de cadastro - Checkout
    Como cliente da EBAC-SHOP
    Quero concluir meu cadastro
    Para finalizar minha compra

    Scenario: Finalizar Compra
        Given que o cliente da EBAC-SHOP deve preencher os dados para finalizar a compra
        When "nome" e "sobrenome" e "país" e "endereco" e "cidade" e "cep" e "telefone" e "email" forem preenchidos
        Then  deve finalizar compras exibindo a mensagem "compra finalizada"

    Scenario: Dados opcionais
        Given que o cliente não necessita preeencher todos os dados
        When "Nome da empresa"  e "complemento" não forem preenchidos
        Then deve finalizar compras exibindo a mensagem "compra finalizada"


    Scenario Outline: Autenticar campo de email
        When  o cliente digitar <email>
        Then deve exibir a <mensagem>

    Example:
            | email              | mensagem         |
            | "Exemplo@ebac.com" | "email válido"   |
            | "Exemploebac.com"  | "email inválido" |
            | "Exemplo@ebaccom"  | "email inválido" |
            | "Exemploebaccom"   | "email inválido" |



    Scenario Outline: validar compra
        When  o cliente digitar <nome> e <sobrenome> e <pais> e <endereco>
        e <cidade> e <cep> e <telefone> e <email>
        Then deve verificar os dados
        And exibir a <mensagem>

    Example:
            | nome | sobrenome | pais   | endereco | cidade         | cep       | telefone       | email         | mensagem                |
            | luis | almeida   | brasil | rua 5    | Belo Horizonte | 36420-000 | 31 9 9999-9999 | luis@ebac.com | compra finalizada       |
            | luis |           | brasil | rua 5    | Belo Horizonte | 36420-000 | 31 9 9999-9999 | luis@ebac.com | preencha todos os dados |
            | luis | almeida   |        | rua 5    | Belo Horizonte | 36420-000 | 31 9 9999-9999 | luis@ebac.com | preencha todos os dados |
            | luis | almeida   | brasil |          | Belo Horizonte | 36420-000 | 31 9 9999-9999 | luis@ebac.com | preencha todos os dados |
            | luis | almeida   | brasil | rua 5    |                | 36420-000 | 31 9 9999-9999 | luis@ebac.com | preencha todos os dados |
            | luis | almeida   | brasil | rua 5    | Belo Horizonte |           | 31 9 9999-9999 | luis@ebac.com | preencha todos os dados |
            | luis | almeida   | brasil | rua 5    | Belo Horizonte | 36420-000 |                | luis@ebac.com | preencha todos os dados |
            | luis | almeida   | brasil | rua 5    | Belo Horizonte | 36420-000 | 31 9 9999-9999 |               | preencha todos os dados |



