*** Settings ***
Library    SeleniumLibrary
Library    String
Variables   ../PageObjects/ShopPage.py


*** Keywords ***
Buy Items
   [Arguments]    ${Item}   ${Quantity}

   ${Buy_Button}    replace variables    ${Buy_Btn}
   wait until element is visible    ${Buy_Button}
   FOR  ${i}    IN RANGE    ${Quantity}
       click element    ${Buy_Button}
   END

Get Item Price
    [Arguments]    ${Item}

    ${Price_Text}    replace variables    ${Price_Text}
    ${Price}    get text    ${Price_Text}
    [Return]    ${Price}

Go to Cart
    wait until element is visible    ${Cart_Link}
    click element   ${Cart_Link}

Get Column Index of Cart Table
    [Arguments]    ${Column_Name}

    wait until element is visible    ${Cart_Table}
    ${Col_Count}    get element count   ${Cart_Table}//th
    FOR    ${Index}    IN RANGE    1    ${Col_Count}+1
        ${UI_Col_Name}    Get Text    ${Cart_Table}//th\[${Index}]
        exit for loop if    '${UI_Col_Name.strip()}'=='${Column_Name}'
    END
    [Return]    ${Index}

Get Row Index of Cart Table
    [Arguments]    ${Row_Name}

    ${Col_Index}    Get Column Index of Cart Table     Item
    ${Row_Count}    get element count   ${Cart_Table}//tbody//tr
    FOR    ${Index}    IN RANGE    1    ${Row_Count}+1
        ${UI_Row_Name}    Get Text    ${Cart_Table}//tbody//tr\[${Index}]
        exit for loop if    '${Row_Name}' in '${UI_Row_Name}'
    END
    [Return]    ${Index}

Verify Item Price in Car Table
    [Arguments]    ${Item}    ${Expected_Price}

    ${Col_Index}    Get Column Index of Cart Table     Price
    ${Row_Index}    Get Row Index of Cart Table     ${Item}
    ${Locator}    set variable    ${Cart_Table}//tbody//tr\[${Row_Index}]//td\[${Col_Index}]
    ${UI_Price}    get text    ${Locator}
    run keyword and continue on failure    should be equal    ${Expected_Price}    ${UI_Price}

Verify Item Subtotal in Car Table
    [Arguments]    ${Item}    ${Expected_Price}    ${Quantity}

    ${Col_Index}    Get Column Index of Cart Table     Subtotal
    ${Row_Index}    Get Row Index of Cart Table     ${Item}
    ${Locator}    set variable    ${Cart_Table}//tbody//tr\[${Row_Index}]//td\[${Col_Index}]
    ${UI_Subtotal}    get text    ${Locator}

    ${Price}    remove string      ${Expected_Price}    $
    ${Price}    convert to number    ${Price}
    ${Expected_SubTotal}    Evaluate    ${Price}*${Quantity}

    run keyword and continue on failure    should be equal    $${Expected_SubTotal}    ${UI_Subtotal}
    [Return]    ${UI_Subtotal}

Verify Total Cart Table
    [Arguments]    @{SubTotal_List}

    ${Expected_Total}   set variable    0
    FOR    ${SubTotal}    IN    @{SubTotal_List}
        ${SubTotal}    remove string      ${SubTotal}    $
        ${SubTotal}    convert to number    ${SubTotal}
        ${Expected_Total}     evaluate    "%.2f" % (${Expected_Total}+${SubTotal})
        ${Expected_Total}    strip string   ${Expected_Total}   mode=right     characters=0
    END
    ${UI_Total}    get text    ${Cart_Table}//tfoot//strong[@class="total ng-binding"]
    run keyword and continue on failure    should be equal    Total: ${Expected_Total}    ${UI_Total}
