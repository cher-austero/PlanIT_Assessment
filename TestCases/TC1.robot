*** Settings ***
Resource   ../PageActions/HomePage.robot
Resource   ../PageActions/ContactPage.robot
Resource   ../PageActions/General.robot

*** Variables ***
${Forename}    John
${Email}    John.Doe@email.com
${Message}  Test

*** Test Cases ***
TC1
    [Setup]    Go to Jupitor Toys
    Verify Landing Page is Displayed
    Go to Contacts
    Submit Contact
    Verify Alert Error Message is Displayed     bExpected=${True}
    Verify Forename Error Message is Displayed     bExpected=${True}
    Verify Email Error Message is Displayed     bExpected=${True}
    Verify Message Error Message is Displayed     bExpected=${True}
    capture page screenshot    ErrorMessages.png
    Enter Forename    ${Forename}
    Enter Email    ${Email}
    Enter Message   ${Message}
    Verify Alert Error Message is Displayed
    Verify Forename Error Message is Displayed
    Verify Email Error Message is Displayed
    Verify Message Error Message is Displayed
    capture page screenshot    NoErrorMessages.png