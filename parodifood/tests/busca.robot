* Settings *

Resource        ${EXECDIR}/resources/base.robot

Test Setup      Start Session
Test Teardown   Take Screenshot

#robot -d ./logs tests\busca.robot

* Test Cases*
Deve buscar um único restaurante

    Go To Restaurants
    Search by                           Debuger
    Restaurant Should Be Visible        DEBUGER KING
    Restaurant Count Should Be          1      

Deve buscar uma única categoria

    Go To Restaurants
    Search by                          Cafe
    Restaurant Should Be Visible       STARBUGS COFFEE  

Deve buscar todos os restaurantes

    Go To Restaurants
    Search by                           a
    Restaurant Count Should Be          5
