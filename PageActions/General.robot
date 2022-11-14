*** Settings ***
Library    SeleniumLibrary
Variables   ../PageObjects/ContactPage.py


*** Keywords ***
Go to Jupitor Toys
    open browser    https://jupiter.cloud.planittesting.com    browser=gc
    maximize browser window
#    options=add_argument{headless

Wait Until Browser Ready State
    execute javascript    return window.load
    FOR    ${i}    IN RANGE    1    200
        ${stat_readystate}     execute javascript    return document.readyState
        exit for loop if    '${stat_readystate}'=='complete'
    END
