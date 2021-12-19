*** Settings ***
Library  SeleniumLibrary
Library  Collections
Library  RequestsLibrary
Library  BuiltIn

*** Variables ***
${URL}  https://api.coinpaprika.com/v1/
${coins}  coins

*** Test Cases ***
TC_02 Get Request To List Of Coins
    Create session  coinpaprica  https://api.coinpaprika.com/v1/   
    ${response}  get on session  coinpaprica  url=${coins}
    log to console  ${response.status_code}
    ${code}=  convert to string  ${response.status_code}
    should be equal  ${code}  200
    should not be empty  ${response.content}