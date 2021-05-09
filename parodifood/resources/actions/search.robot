* Settings *
Documentation       Ações de funcionalidade de busca de restaurantes

* Variables *
${DIV_BOX_RESTAURANTS}      css=div [class="place-info-box"][style="opacity: 1;"]

* Keywords *

Go To Restaurants

    Click           text=Estou com fome!
    Get Text        css=h1 strong       contains    Ta na hora de matar a fome!

Choose Restaurants
    [Arguments]                 ${super_var}

    Click                       text=${super_var["restaurant"]}
    Wait For Elements State     css=#detail     visible     10      #hastag busca o elemento por id
    Get Text                    css=#detail     contains    ${super_var["description"]}

Search by
    [Arguments]     ${value}

    Click           css=.search-link
    #Preencher um campo
    Fill Text       css=input[formcontrolname="searchControl"]      ${value}

Restaurant Should Be Visible
    [Arguments]     ${name}

    #Garantir que o elemento está na tela e evitar o Sleep
    Wait for Elements State    ${DIV_BOX_RESTAURANTS}     visible     10
    Get Text                   ${DIV_BOX_RESTAURANTS}    contains    ${name}

Restaurant Count Should Be
    [Arguments]     ${qtd}

    Wait for Elements State    ${DIV_BOX_RESTAURANTS}     visible     10
    Get Element Count          ${DIV_BOX_RESTAURANTS}     equal       ${qtd}