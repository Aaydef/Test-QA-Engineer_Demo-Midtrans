*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Fill the OTP
    Wait Until Element Is Visible    css=iframe[title="3ds-iframe"]    5s
    Select Frame    css=iframe[title="3ds-iframe"]

    Wait Until Element Is Visible    id=otp    5s
    Input Text    id=otp    112233
    Click Button    OK

    Unselect Frame

    Wait Until Page Contains    success    15s


Open Website Demo Midtrans
    open browser    https://demo.midtrans.com/    chrome

Process to buy the product
    Click Element    class=buy

Fill the Shopping Cart Form
    Input Text    xpath=//input[@value='Budi']    Rina
    Input Text    xpath=//input[@value='budi@utomo.com']    rina@gmail.com
    Input Text    xpath=//input[@value='081808466410']    081234567890
    Input Text    xpath=//input[@value='Jakarta']    Bandung
    Input Text    xpath=//textarea    Jl. Dago 1 no 50
    Input Text    xpath=//input[@value='10220']    10423

Checkout
    Click Element    class=cart-action

Process Payment
    Select Frame    id=snap-midtrans

    Wait Until Element Is Visible    xpath=//a[contains(@href,'credit-card')]    10s
    Click Element                    xpath=//a[contains(@href,'credit-card')]

    Wait Until Element Is Visible    xpath=//span["Card number"]
     Input Text                       xpath=//input[@autocomplete='cc-number']    4111111111111111

    Input Text                       xpath=//input[@autocomplete='cc-exp']    12/92

    Input Text                       xpath=//input[@autocomplete='cc-csc']    456

    #Pilih promo
    Wait Until Element Is Visible    xpath=//label[.//span[contains(text(),'Proceed without promo')]]    5s
    Click Element                    xpath=//label[.//span[contains(text(),'Proceed without promo')]]

    Sleep    3s
    Click Element    xpath=//button[normalize-space()='Pay now']


# Handle 3DS Flow
#     Select Frame    css=iframe[title="3ds-iframe"]

#     Wait Until Element Is Visible    id=otp    20s
#     Input Text    id=otp    112233
#     Click Button    OK

#     Unselect Frame

#     Wait Until Page Contains    success    15s


# Handle Payment Result
#     ${failed}=    Run Keyword And Return Status
#         ...    Wait Until Page Contains    declined    5s

#         Run Keyword If    ${failed}    Log    Payment failed (expected or test scenario)
#         ...    ELSE    Log    Payment completed without 3DS




