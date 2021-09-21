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
    #ClickElement  //span[1]/div[2]/ul[1]/li[6]/div[1]/div[1]/div[1]/div[1]/div[1]/a[1]/div[1]
    ClickText  Setup
    ClickText  Setup for current app
