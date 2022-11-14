*** Settings ***
Library    SeleniumLibrary
Variables   ../PageObjects/HomePage.py

*** Keywords ***
Verify Landing Page is Displayed
    wait until element is visible    ${Logo}

Go to Contacts
    wait until element is visible    ${Contact_Menu}
    click element    ${Contact_Menu}

Go to Shop
    wait until element is visible    ${Shop_Menu}
    click element    ${Shop_Menu}
