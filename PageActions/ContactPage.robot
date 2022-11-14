*** Settings ***
Library    SeleniumLibrary
Resource   ../PageActions/General.robot
Variables   ../PageObjects/ContactPage.py


*** Keywords ***
Submit Contact
    wait until element is visible    ${Submit_Btn}
    click element    ${Submit_Btn}

Verify Alert Error Message is Displayed
    [Arguments]    ${bExpected}=${False}
    ${IsVisible}    run keyword and return status    element should be visible    ${Alert_Err_Msg}
    IF    ${bExpected} and ${IsVisible}
        Log    Correct! Expected Error: 'We welcome your feedback - but we won't get it unless you complete the form correctly.' is displayed.    console=${True}
    ELSE IF    ${bExpected} and ${IsVisible}==${False}
        run keyword and continue on failure    Fail    Incorrect! Expected Error: 'We welcome your feedback - but we won't get it unless you complete the form correctly.' is not displayed.
    ELSE IF    ${bExpected}==${False} and ${IsVisible}==${True}
        run keyword and continue on failure    Fail    Incorrect! Expected Error: 'We welcome your feedback - but we won't get it unless you complete the form correctly.' is displayed.
    ELSE IF    ${bExpected}==${False} and ${IsVisible}==${False}
        Log    Correct! Expected Error: 'We welcome your feedback - but we won't get it unless you complete the form correctly.' is not displayed.    console=${True}
    ELSE
        Log    Please check!    level=WARN
    END

Verify Forename Error Message is Displayed
    [Arguments]    ${bExpected}=${False}
    ${IsVisible}    run keyword and return status    element should be visible    ${Forename_Err_Msg}
    IF    ${bExpected} and ${IsVisible}
        Log    Correct! Expected Error: 'Forename is required' is displayed'    console=${True}
    ELSE IF    ${bExpected} and ${IsVisible}==${False}
        run keyword and continue on failure    Fail    Incorrect! Expected Error: 'Forename is required' is not displayed.
    ELSE IF    ${bExpected}==${False} and ${IsVisible}==${True}
        run keyword and continue on failure    Fail    Incorrect! Expected Error: 'Forename is required' is displayed'
    ELSE IF    ${bExpected}==${False} and ${IsVisible}==${False}
        Log    Correct! Expected Error: 'Forename is required' is not displayed'    console=${True}
    ELSE
        Log    Please check!    level=WARN
    END

Verify Email Error Message is Displayed
    [Arguments]    ${bExpected}=${False}
    ${IsVisible}    run keyword and return status    element should be visible    ${Email_Err_Msg}
    IF    ${bExpected} and ${IsVisible}
        Log    Correct! Expected Error: 'Email is required' is displayed.    console=${True}
    ELSE IF    ${bExpected} and ${IsVisible}==${False}
        run keyword and continue on failure    Fail    Incorrect! Expected Error: 'Email is required' is not displayed.
    ELSE IF    ${bExpected}==${False} and ${IsVisible}==${True}
        run keyword and continue on failure    Fail    Incorrect! Expected Error: 'Email is required' is displayed.
    ELSE IF    ${bExpected}==${False} and ${IsVisible}==${False}
        Log    Correct! Expected Error: 'Email is required' is not displayed.    console=${True}
    ELSE
        Log    Please check!    level=WARN
    END

Verify Message Error Message is Displayed
    [Arguments]    ${bExpected}=${False}
    ${IsVisible}    run keyword and return status    element should be visible    ${Message_Err_Msg}
    IF    ${bExpected} and ${IsVisible}
        Log    Correct! Expected Error: 'Message is required' is displayed.    console=${True}
    ELSE IF    ${bExpected} and ${IsVisible}==${False}
        run keyword and continue on failure    Fail    Incorrect! Expected Error: 'Message is required' is not displayed.
    ELSE IF    ${bExpected}==${False} and ${IsVisible}==${True}
        run keyword and continue on failure    Fail    Expected Error: 'Message is required' is displayed.
    ELSE IF    ${bExpected}==${False} and ${IsVisible}==${False}
        Log    Correct! Expected Error: 'Message is required' is not displayed.    console=${True}
    ELSE
        Log    Please check!    level=WARN
    END

Enter Forename
    [Arguments]    ${Forename}
    wait until element is visible    ${Forename_Input}
    input text    ${Forename_Input}    ${Forename}

Enter Email
    [Arguments]    ${Email}
    wait until element is visible    ${Email_Input}
    input text    ${Email_Input}    ${Email}

Enter Message
    [Arguments]    ${Message}
    wait until element is visible    ${Message_TextArea}
    input text    ${Message_TextArea}    ${Message}

Verify Success Message is Displayed
    [Arguments]    ${Forename}
    wait until element is not visible    ${Loading_Bar}    timeout=5m
    wait until element is visible    ${Success_Msg}
    ${IsVisible}    run keyword and return status    element should be visible    ${Success_Msg}
    IF    ${IsVisible}
        Log    Correct! Success Message: 'Thanks ${Forename}, we appreciate your feedback.' is displayed.    console=${True}
    ELSE
        run keyword and continue on failure    Fail    Incorrect! Success Message: 'Thanks ${Forename}, we appreciate your feedback.' is displayed.
    END
