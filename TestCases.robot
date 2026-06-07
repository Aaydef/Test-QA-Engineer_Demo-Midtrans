*** Settings ***
Library    SeleniumLibrary
Resource    keyword.robot

*** Test Cases ***
Open DEMO Midtrans Webite
    Open Website Demo Midtrans
Process to Checkout the Product
    Process to buy the product
    Fill the Shopping Cart Form
    Checkout
Pick a payment process
    Process Payment
    Fill the OTP