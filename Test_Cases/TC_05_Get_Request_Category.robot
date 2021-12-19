*** Settings ***
# Documentation  https://api.coinpaprika.com/
Library  SeleniumLibrary
Library  Collections
Library  RequestsLibrary

*** Variables ***
${URL}  https://api.coinpaprika.com/v1/
${coins}  coins/
${coin_id}  sand-the-sandbox
${markets}  /markets
${params}  quotes=AUD,CHF,ARS


*** Test Cases ***
TC_05 Get Request Category
    Create session  coinpaprika  https://api.coinpaprika.com/v1/  verify=true
    ${response}  get on session  coinpaprika  url=${coins}${coin_id}${markets}  params=${params}
    log to console  ${response.status_code}
    ${code}=  convert to string  ${response.status_code}
    should be equal  ${code}  200
    should not be empty  ${response.content}