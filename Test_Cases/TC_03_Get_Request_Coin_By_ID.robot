*** Settings ***
# Documentation  https://api.coinpaprika.com/
Library  SeleniumLibrary
Library  Collections
Library  RequestsLibrary

*** Variables ***
${URL}  https://api.coinpaprika.com/v1/
${coins}  coins/
${coin_id}  eth-ethereum

*** Test Cases ***
TC_03 Get Request Coin By ID
    Create session  coinpaprica  https://api.coinpaprika.com/v1/  verify=true
    ${response}  get on session  coinpaprica  url=${coins}${coin_id}
    log to console  ${response.status_code}
    ${code}=  convert to string  ${response.status_code}
    should be equal  ${code}  200
    should not be empty  ${response.content}