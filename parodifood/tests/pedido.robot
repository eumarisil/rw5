* Settings *

Resource        ${EXECDIR}/resources/base.robot

Test Setup      Start Session
Test Teardown   Take Screenshot

#robot -d ./logs tests\pedido.robot
#robot -d ./logs -i temp tests\pedido.robot para rodar apenas um cenário
#três pontos: passar argumentos para uma keyword ou multiline quando fica muito grande

* Test Cases *

Deve realizar um novo pedido em dinheiro

        ${order_json}       Get JSON   order.json

        Go To Restaurants
        Choose Restaurants  ${order_json}

        FOR     ${product}      IN          @{order_json["products"]}
            Add to Cart                     ${product["name"]}
            Should Add to Cart              ${product["name"]}

        END

        Go Checkout
        Fill Data Customer                  ${order_json["customer"]}
        Select Payment Option               ${order_json["payment"]}
        Pay order
        Order Should Be Completed