*** Settings ***
Library          SeleniumLibrary
Suite Teardown   Close All Browsers

*** Keywords ***
Open Website Demo Midtrans
    Open Browser    https://demo.midtrans.com/    chrome
    Maximize Browser Window
    Set Selenium Speed    0.2s

Process to buy the product
    Wait Until Element Is Visible    class=buy    10s
    Click Element    class=buy

Fill the Shopping Cart Form
    Wait Until Element Is Visible    xpath=//input[@value='Budi']    10s

    Clear Element Text    xpath=//input[@value='Budi']
    Input Text            xpath=//input[@value='Budi']    Rina

    Clear Element Text    xpath=//input[@value='budi@utomo.com']
    Input Text            xpath=//input[@value='budi@utomo.com']    rina@gmail.com

    Clear Element Text    xpath=//input[@value='081808466410']
    Input Text            xpath=//input[@value='081808466410']    081234567890

    Clear Element Text    xpath=//input[@value='Jakarta']
    Input Text            xpath=//input[@value='Jakarta']    Bandung

    Clear Element Text    xpath=//textarea
    Input Text            xpath=//textarea    Jl. Dago 1 no 50

    Clear Element Text    xpath=//input[@value='10220']
    Input Text            xpath=//input[@value='10220']    10423

Checkout
    Click Element    class=cart-action

Process Payment
    Wait Until Element Is Visible    id=snap-midtrans    15s
    Select Frame                     id=snap-midtrans

    # Credit Card
    Wait Until Element Is Visible    xpath=//a[contains(@href,'credit-card')]    10s
    Click Element                    xpath=//a[contains(@href,'credit-card')]

    # Card Number
    Wait Until Element Is Visible    xpath=//input[@autocomplete='cc-number']    10s
    Input Text                       xpath=//input[@autocomplete='cc-number']    4111111111111111

    # Expiry
    Input Text                       xpath=//input[@autocomplete='cc-exp']       1229

    # CVV
    Input Text                       xpath=//input[@autocomplete='cc-csc']       123

    # No Promo
    Scroll Element Into View         id=no-promo
    Execute JavaScript               document.querySelector("label[for='no-promo']").click()

    # Tunggu enkripsi selesai
    Sleep    3s

    Wait Until Element Is Enabled    xpath=//button[normalize-space()='Pay now']    10s
    Click Element                    xpath=//button[normalize-space()='Pay now']

Fill the OTP
    # Tunggu iframe OTP muncul
    Wait Until Element Is Visible    css=iframe[title="3ds-iframe"]    20s

    Select Frame                     css=iframe[title="3ds-iframe"]

    # Input OTP
    Wait Until Element Is Visible    id=otp    10s
    Input Text                       id=otp    112233

    Wait Until Element Is Enabled    xpath=//button[normalize-space()='OK']    10s
    Click Element                    xpath=//button[normalize-space()='OK']

    # Keluar dari iframe OTP
    Unselect Frame

    # Tunggu iframe OTP hilang
    Wait Until Element Is Not Visible
    ...    css=iframe[title="3ds-iframe"]
    ...    20s

    # Tunggu popup snap hilang
    Wait Until Element Is Not Visible
    ...    id=snap-midtrans
    ...    20s

    #ke halaman utama
    Wait Until Element Is Visible
    ...    xpath=//a[contains(text(),'BUY NOW')]
    ...    20s





