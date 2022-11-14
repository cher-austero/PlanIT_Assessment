*** Settings ***
Resource   ../PageActions/HomePage.robot
Resource   ../PageActions/ContactPage.robot
Resource   ../PageActions/ShopPage.robot
Resource   ../PageActions/General.robot

*** Variables ***
${Items_Frog}    Stuffed Frog
${Items_Bunny}    Fluffy Bunny
${Items_Bear}   Valentine Bear
${Qty_Frog}    2
${Qty_Bunny}    5
${Qty_Bear}   3

*** Test Cases ***
TC3
    [Setup]    Go to Jupitor Toys
    Verify Landing Page is Displayed
    Go to Shop
    Buy Items   ${Items_Frog}   ${Qty_Frog}
    Buy Items   ${Items_Bunny}   ${Qty_Bunny}
    Buy Items   ${Items_Bear}   ${Qty_Bear}

    ${Frog_Price}    Get Item Price   ${Items_Frog}
    ${Bunny_Price}    Get Item Price   ${Items_Bunny}
    ${Bear_Price}    Get Item Price   ${Items_Bear}
    capture page screenshot    Shop.png

    Go to Cart
    ${Subtotal_Frog}    Verify Item Subtotal in Car Table    ${Items_Frog}    ${Frog_Price}    ${Qty_Frog}
    ${Subtotal_Bunny}    Verify Item Subtotal in Car Table    ${Items_Bunny}    ${Bunny_Price}    ${Qty_Bunny}
    ${Subtotal_Bear}    Verify Item Subtotal in Car Table    ${Bear_Price}    ${Bear_Price}    ${Qty_Bear}

    Verify Item Price in Car Table   ${Items_Frog}    ${Frog_Price}
    Verify Item Price in Car Table   ${Items_Bunny}    ${Bunny_Price}
    Verify Item Price in Car Table   ${Items_Bear}    ${Bear_Price}

    Verify Total Cart Table    ${Subtotal_Frog}    ${Subtotal_Bunny}    ${Subtotal_Bear}
    capture page screenshot    Cart.png
