*** Setting ***
Library     String
Library     SeleniumLibrary

*** Variables ***
${browser}      chrome
${homepage}     automationpractice.com/index.php
${scheme}       http
${testUr}       ${scheme}://${homepage}

*** Keywords ***
Open Homepage
    Open browser    ${testUr}       ${browser}

*** Test Cases ***
C001 Hacer Clic en Contenedores
    Open Homepage
    Set Global Variable     @{nombreDeContenedores}     //*[@id="homefeatured"]/li[1]/div/div[2]/h5/a   //*[@id="homefeatured"]/li[2]/div/div[2]/h5/a   //*[@id="homefeatured"]/li[3]/div/div[2]/h5/a   //*[@id="homefeatured"]/li[4]/div/div[2]/h5/a   //*[@id="homefeatured"]/li[5]/div/div[2]/h5/a   //*[@id="homefeatured"]/li[6]/div/div[2]/h5/a   //*[@id="homefeatured"]/li[7]/div/div[2]/h5/a
    :FOR    ${nombreDeContenedor}   IN      @{nombreDeContenedores}
    \   Run Keyword If      '${nombreDeContenedor}'=='//*[@id="homefeatured"]/li[8]/div/div[2]/h5/a'    Exit Loop
    \   Click Element       xpath=${nombreDeContenedor}
    \   Wait Until Element Is Visible   xpath=//*[@id="bigpic"]
    \   Click Element       xpath=//*[@id="header_logo"]/a/img
    Close Browser