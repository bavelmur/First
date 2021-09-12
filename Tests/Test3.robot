*** Settings ***
Library                 QWeb
Library                 QVision
Suite Setup             OpenBrowser  about:blank  chrome
Suite Teardown          close browser


# Copy/paste the line below into Terminal to execute:
# robot -d results tests/AllUserLogin_Self.robot

*** Test Cases ***     
Veify all Role user Sign on   
    Enter Role Users

*** Variables ***
${roleuser}  Joseph Abraham\n
${password}

*** Keywords ***
Enter Role Users
    GoTo  https://test.salesforce.com
    Set Library Search Order  QWeb
    Sleep       3s
    TypeText  username  automationtestuser@cisco.com.pxp.qa
    TypeText  password  ${password}
    Sleep       3s
    VerifyText  Remember me
    VerifyText  Forgot Your Password
    VerifyText  Use Custom Domain
    VerifyText  © 2021 salesforce.com, inc. All rights reserved. | 
    VerifyText  Privacy
    ClickText  Log In to Sandbox
    Sleep       3s
    ClickElement   xpath\=//div[1]/one-appnav/div/div/div/div/one-app-launcher-header/button
    Sleep       3s
    TypeText    Search apps and items...  contacts
    ClickText   Contacts
    Sleep       1s
    ClickElement  xpath\=//div[1]/one-appnav/div/div/div/div/one-app-launcher-header/button
    Sleep       2s
    TypeText  Search Contacts and more  ${roleuser}
    Sleep       2s
    ClickElement  xpath\=//div[1]/div[2]/div/div/div/div[2]/div[2]/div[1]/div/div/table/tbody/tr[1]/th/span/a
    Sleep       6s
    ClickElement  xpath\=//div[1]/div[1]/div[3]/div/runtime_platform_actions-actions-ribbon/ul/li[4]/lightning-button-menu/button/lightning-primitive-icon
    Sleep       6s
    ClickText   Log in to Experience as User
    #ClickElement  xpath\=//span[normalize-space()='Log in to Experience as User']
    Sleep       20s
    ClickText   Performance
    #ClickElement   xpath\=//a[normalize-space()='Channel Partner']
    Sleep       12s
    VerifyText  Summary
    VerifyText  Total Bookings (By Type)
    Set Library Search Order  QVision
    VerifyText  HARDWARE
    VerifyText  SERVICE
    VerifyText  SOFTWARE
    VerifyText  CSPP
    LogScreenshot  annotated

