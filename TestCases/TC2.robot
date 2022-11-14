*** Settings ***
Resource   ../PageActions/HomePage.robot
Resource   ../PageActions/ContactPage.robot
Resource   ../PageActions/General.robot

*** Variables ***
${Forename}    John
${Email}    John.Doe@email.com
${Message}  Test

*** Test Cases ***
TC2
    [Setup]    Go to Jupitor Toys
    Verify Landing Page is Displayed
    Go to Contacts
    Enter Forename    ${Forename}
    Enter Email    ${Email}
    Enter Message   ${Message}
    Submit Contact
    Verify Success Message is Displayed    ${Forename}
    capture page screenshot    SuccessMessage.png