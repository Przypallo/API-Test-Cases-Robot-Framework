*** Settings ***
# Documentation  https://api.coinpaprika.com/
Library  SeleniumLibrary
Library  Collections
Library  RequestsLibrary

*** Variables ***
${URL}  https://api.coinpaprika.com/v1/
${coins}  coins/
${coin_id}  doge-dogecoin
${historical}  /ohlcv/historical/
${start}  start=2019-04-23
${end}  end=2019-05-02
${limit}  limit=12

*** Test Cases ***
TC_04 Get Request Coin By ID Historical Open High Low Close
    Create session  coinpaprica  https://api.coinpaprika.com/v1/  verify=true
    ${response}  get on session  coinpaprica  url=${coins}${coin_id}${historical}  params=${start}&${end}&${limit}
    log to console  ${response.status_code}
    ${code}=  convert to string  ${response.status_code}
    should be equal  ${code}  200
    should not be empty  ${response.content}