*** Settings ***
# Documentation  https://api.coinpaprika.com/
Library  SeleniumLibrary
Library  Collections
Library  RequestsLibrary

*** Variables ***
${URL}  https://api.coinpaprika.com/v1/
${price_converter}  price-converter/
${BCI}  base_currency_id=enj-enjin-coin
${QCI}  quote_currency_id=egld-elrond
${amount}  amount=147

*** Test Cases ***
TC_07 Get Request Price Converter
    Create session  coinpaprika  https://api.coinpaprika.com/v1/  verify=true
    ${response}  get on session  coinpaprika  url=${price_converter}  params=${BCI}&${QCI}&${amount}
    log to console  ${response.status_code}
    ${code}=  convert to string  ${response.status_code}
    should be equal  ${code}  200
    should not be empty  ${response.content}