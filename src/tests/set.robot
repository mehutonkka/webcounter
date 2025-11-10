*** Settings ***
Resource  resource.robot
Suite Setup  Open And Configure Browser
Suite Teardown  Close Browser

*** Test Cases ***
When counter has a nonzero value and it is reset the value becomes zero
    Go To  ${HOME_URL}
    Click Button  Paina
    Click Button  Paina
    Input Text  new_value  100
    Click Button  Aseta
    Page Should Contain  nappia painettu 100 kertaa
    Click Button  Nollaa
    Input Text  new_value  74
    Click Button  Aseta
    Page Should Contain  nappia painettu 74 kertaa
    Click Button  Nollaa
    Page Should Contain  nappia painettu 0 kertaa