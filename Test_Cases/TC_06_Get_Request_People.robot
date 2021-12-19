*** Settings ***
# Documentation  https://api.coinpaprika.com/
Library  SeleniumLibrary
Library  Collections
Library  RequestsLibrary

*** Variables ***
${URL}  https://api.coinpaprika.com/v1/
${people}  people/
${person_id}  vitalik-buterin

** Test Cases ***
TC_06 Get Request Registered People
    Create session  coinpaprika  https://api.coinpaprika.com/v1/  verify=true
    ${response}  get on session  coinpaprika  url=${people}${person_id}
    log to console  ${response.status_code}
    ${code}=  convert to string  ${response.status_code}
    should be equal  ${code}  200
    should not be empty  ${response.content}