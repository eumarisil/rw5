* Settings *

Resource        ${EXECDIR}/resources/base.robot

Test Setup      Start Session
Test Teardown   Take Screenshot

#robot -d ./logs tests\carrinho.robot
#robot -d ./logs -i temp tests\carrinho.robot para rodar apenas um cenário
#três pontos: passar argumentos para uma keyword ou multiline quando fica muito grande

* Test Cases *
Deve adicionar um item ao carrinho

    #${name}             Set Variable        STARBUGS COFFE
    #${description}      Set Variable        Nada melhor que um café pra te ajudar a resolver um bug. 
    
    #Super variável usa o & para definir e estanciar a variável representada por chave e valor
    &{restaurant}      Create Dictionary       restaurant=STARBUGS COFFEE    description=Nada melhor que um café pra te ajudar a resolver um bug. 

    Go To Restaurants
    Choose Restaurants       ${restaurant}
    Add to Cart              Starbugs 500 error
    Should Add to Cart       Starbugs 500 error
    Total Cart Should Be     15,60

Deve adicionar três itens ao carrinho

    [tags]                              temp

    ${cart_json}                        Get JSON    cart.json

    Go To Restaurants
    Choose Restaurants                  ${cart_json}

#Usar o arroba para o robot entender que o valor passado é uma lista
    FOR     ${product}      IN          @{cart_json["products"]}
            Add to Cart                 ${product["name"]}
            Should Add to Cart          ${product["name"]}

    END

    Total Cart Should Be                ${cart_json["total"]}

    #Add to Cart              Starbugs 500 error
    #Should Add to Cart       Starbugs 500 error

    #Add to Cart              Cappuccino com Chantilly
    #Should Add to Cart       Cappuccino com Chantilly

    #Add to Cart              Super Espreso
    #Should Add to Cart       Super Espreso


