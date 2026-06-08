*** Settings ***
Library    SeleniumLibrary
Resource    keyword.robot
Suite Teardown   Close All Browsers

*** Test Cases ***
Buying product from midtrans until success to checkout
    Open Website Demo Midtrans
    Process to buy the product
    Fill the Shopping Cart Form
    Checkout
    Process Payment
    Fill the OTP
