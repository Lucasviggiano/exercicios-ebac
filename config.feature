# language: pt

Feature: configurar produto

    Como cliente da EBAC-SHOP
    Quero configurar o produto por tamanho e cor
    e escolher a quantidade
    Para depois inserir no carrinho

    Scenario: preencher todos os requisitos é obrigatório
        Given que o cliente deve selecionar todos os atributos
        When Cor, tamanho, e quantidade forem preenchidos
        Then deve inserir o produto ao carrinho

    Scenario: preencher todos os requisitos é obrigatório
        Given que o cliente não selecionou todos os atributos
        When Cor, tamanho, e quantidade são obrigatorios
        Then deve aparecer a mensagem de erro "selecione todos os atributos"
        And não adicionar o produto ao carrinho



    Scenario Outline: Configurar produto
        When o cliente inserir o <produto> e <cor> e <tamanho> e <quantidade>
        But quantidade máxima de 10 produtos
        Then deve inserir no carrinho e exibir a <mensagem> "adcionado ao carrinho"

    Example: Produto Augusta Pullover Jacket

            | Produtos                  | Cor        | Tamanho | quantidade | Mensagem                |
            | "Augusta Pullover Jacket" | "Azul"     | "xs"    | 1          | "adcionado ao carrinho" |
            | "Augusta Pullover Jacket" | "Azul"     | "m"     | 2          | "adcionado ao carrinho" |
            | "Augusta Pullover Jacket" | "Azul"     | "l"     | 3          | "adcionado ao carrinho" |
            | "Augusta Pullover Jacket" | "Azul"     | "xl"    | 4          | "adcionado ao carrinho" |
            | "Augusta Pullover Jacket" | "Azul"     | "G"     | 5          | "adcionado ao carrinho" |
            | "Augusta Pullover Jacket" | "Laranja"  | "xs"    | 6          | "adcionado ao carrinho" |
            | "Augusta Pullover Jacket" | "Laranja"  | "m"     | 7          | "adcionado ao carrinho" |
            | "Augusta Pullover Jacket" | "Laranja"  | "l"     | 8          | "adcionado ao carrinho" |
            | "Augusta Pullover Jacket" | "Laranja"  | "xl"    | 9          | "adcionado ao carrinho" |
            | "Augusta Pullover Jacket" | "Laranja"  | "G"     | 10         | "adcionado ao carrinho" |
            | "Augusta Pullover Jacket" | "Vermelha" | "xs"    | 2          | "adcionado ao carrinho" |
            | "Augusta Pullover Jacket" | "Vermelha" | "m"     | 3          | "adcionado ao carrinho" |
            | "Augusta Pullover Jacket" | "Vermelha" | "l"     | 0          | "adcionado ao carrinho" |
            | "Augusta Pullover Jacket" | "Vermelha" | "xl"    | 2          | "adcionado ao carrinho" |
            | "Augusta Pullover Jacket" | "Vermelha" | "G"     | 0          | "adcionado ao carrinho" |


    Scenario: Quantidade limíte excedida
        Given que o cliente escolhe a quantidade de produtos
        When quantidade maior que 10 produtos
        Then exibir a mensagem "quantidade máxima de produtos excedida, escolha no máximo 10 produtos"
        And não permitir adcionar ao carrinho


    Scenario: Quantidade limíte permitida
        Given que o cliente escolhe a quantidade de produtos
        When quantidade menor ou igual a 10 produtos
        Then exibir a mensagem "adicionado ao carrinho"


    Scenario: Limpar
        Given que o cliente deseja desisitir das suas escolhas realizadas
        When apertar o botão "limpar"
        Then todos os atributos devem voltar ao estado original




