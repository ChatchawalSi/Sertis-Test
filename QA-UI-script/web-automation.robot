*** Settings ***

| Documentation | TestCases For Purchasing Order

| Library   | BuiltIn
| Library   | SeleniumLibrary
Library    AppiumLibrary
#| Library   | Selenium2Library



*** Variables ***
${url}    https://www.demoblaze.com/cart.html
${browser}   chrome


*** Keywords ***

| Shopper Open browser and navigate to Url
| | [Documentation] | Initiate the Suite by opening browser and validate all the required pages for execution
| | Open Browser    ${url}    ${browser}
| | Wait Until Element is Contains    product1_locator    Samsung galaxy s7 

| Shopper add 1 Phone product to cart
| | [Documentation] | 
| | Click Element    phone1_locator
| | Wait Until Page Contains    text
| | Wait Until Element Is Visible    AddToCart_button_locator
| | Click Element    AddToCart_button_locator

| Shopper go to cart to checkout order
| | [Documentation] | 
| | Click Element    CartMenu_locator
| | Wait Until Page Contains Element    CartList_locator
| | Wait Until Element Contains    TotalPrice_locator    ${Price}
| | Wait Until Element Is Visible    PlaceOrder_button_locator
| | Click Element    PlaceOrder_button_locator

| Shopper submit place order and credit card info
| | [Documentation] | 
| | Wait Until Element Contains    Total_locator    ${Price}
| | Wait Until Element Is Visible    NameField_locator
| | Wait Until Element Is Visible    CountryField_locator
| | Wait Until Element Is Visible    CityField_locator
| | Wait Until Element Is Visible    CreditCardField_locator
| | Wait Until Element Is Visible    MonthField_locator
| | Wait Until Element Is Visible    YearField_locator
| | Input Text    NameField_locator    ${Name}
| | Input Text    CountryField_locator    ${Country}
| | Input Text    CityField_locator    ${City}
| | Input Text    CreditCardField_locator    ${CardNo}
| | Input Text    MonthField_locator    ${Month}
| | Input Text    YearField_locator    ${Year}

| Shoper send purchase order and get confirmation details after purchase success
| | [Documentation] | 
| | Wait Until Element Is Visible    Purchase_button_locator
| | Click Element    Purchase_button_locator
| | Wait Until Element Is Visible    ConfirmDetails_locator
| | Element Text Should Be    ID_locator    ${id} 
| | Element Text Should Be    amount_locator    ${price}  Amont 
| | Element Text Should Be    ID_locator    ${CardNo}
| | Element Text Should Be    ID_locator    ${Name}
| | Element Text Should Be    Date_locator    ${Date}

| Shopper click OK button to back to Home page
| | [Documentation] | 
| | Wait Until Element Is Visible    Finish_button_locator
| | Click Element    Finish_button_locator

| Shopper add multiple Phone product to cart
| | [Documentation] | 
| | Click Element    phone1_locator
| | Wait Until Page Contains    text
| | Wait Until Element Is Visible    AddToCart_button_locator
| | Click Element    AddToCart_button_locator
| | Go to Home
| | Click Element    phone2_locator
| | Wait Until Page Contains    text
| | Wait Until Element Is Visible    AddToCart_button_locator
| | Click Element    AddToCart_button_locator

| Shopper add multiple laptops product to cart
| | [Documentation] | 
| | Click Element    laptop1_locator
| | Wait Until Page Contains    text
| | Wait Until Element Is Visible    AddToCart_button_locator
| | Click Element    AddToCart_button_locator
| | Go to Home
| | Click Element    laptop2_locator
| | Wait Until Page Contains    text
| | Wait Until Element Is Visible    AddToCart_button_locator
| | Click Element    AddToCart_button_locator

| Shopper submit place order and credit card with invalid info
| | [Documentation] | 
| | Wait Until Element Contains    Total_locator    ${Price}
| | Wait Until Element Is Visible    NameField_locator
| | Wait Until Element Is Visible    CountryField_locator
| | Wait Until Element Is Visible    CityField_locator
| | Wait Until Element Is Visible    CreditCardField_locator
| | Wait Until Element Is Visible    MonthField_locator
| | Wait Until Element Is Visible    YearField_locator
| | Input Text    NameField_locator    ${emptyName}
| | Input Text    CountryField_locator    ${Country}
| | Input Text    CityField_locator    ${City}
| | Input Text    CreditCardField_locator    ${WrongCardNo}
| | Input Text    MonthField_locator    ${Month}
| | Input Text    YearField_locator    ${Year}
| | Wait Until Element Is Visible    Purchase_button_locator
| | Click Element    Purchase_button_locator
| | Element Text Should Be    Error_locator    expectedError

| Shopper add 1 laptop product to cart
| | [Documentation] | 
| | Click Element    laptop1_locator
| | Wait Until Page Contains    text
| | Wait Until Element Is Visible    AddToCart_button_locator
| | Click Element    AddToCart_button_locator

*** Test Cases ***
TS001_Verify if general shopper purchasing for 1 phone with valid information
    [Setup]  Log To Console  setup
    Given Shopper Open browser and navigate to Url
    When Shopper add 1 Phone product to cart
    And Shopper go to cart to checkout order
    Then Shopper submit place order and credit card info
    And Shoper send purchase order and get confirmation details after purchase success
    And Shopper click OK button to back to Home page
    [Teardown]  Log To Console  teardown

TS002_Verify if general shopper purchasing for multiples phone with valid information
    [Setup]  Log To Console  setup
    Given Shopper Open browser and navigate to Url
    When Shopper add multiple Phone product to cart
    And Shopper go to cart to checkout order
    Then Shopper submit place order and credit card info
    And Shoper send purchase order and get confirmation details after purchase success
    And Shopper click OK button to back to Home page
    [Teardown]  Log To Console  teardown

TS003_Verify if general shopper purchasing for phones with invalid information
    [Setup]  Log To Console  setup
    Given Shopper Open browser and navigate to Url
    When Shopper add multiple Phone product to cart
    And Shopper go to cart to checkout order
    Then Shopper submit place order and credit card with invalid info
    [Teardown]  Log To Console  teardown

TS004_Verify if general shopper purchasing for 1 laptop with valid information
    [Setup]  Log To Console  setup
    Given Shopper Open browser and navigate to Url
    When Shopper add 1 laptop product to cart
    And Shopper go to cart to checkout order
    Then Shopper submit place order and credit card info
    And Shoper send purchase order and get confirmation details after purchase success
    And Shopper click OK button to back to Home page
    [Teardown]  Log To Console  teardown
TS005_Verify if general shopper purchasing for multiples laptops with valid information
    [Setup]  Log To Console  setup
    Given Shopper Open browser and navigate to Url
    When Shopper add multiple laptops product to cart
    And Shopper go to cart to checkout order
    Then Shopper submit place order and credit card info
    And Shoper send purchase order and get confirmation details after purchase success
    And Shopper click OK button to back to Home page
    [Teardown]  Log To Console  teardown
TS006_Verify if general shopper purchasing for laptops with invalid information
    [Setup]  Log To Console  setup
    Given Shopper Open browser and navigate to Url
    When Shopper add multiple laptops product to cart
    And Shopper go to cart to checkout order
    Then Shopper submit place order and credit card with invalid info
    [Teardown]  Log To Console  teardown