*** Settings ***
# Documentation  https://api.coinpaprika.com/
Library  SeleniumLibrary

*** Variables ***
${URL}  https://api.coinpaprika.com/
${browser}  chrome

*** Test Cases ***
Open A Browser And Close
    Open Browser  ${URL}  ${browser}
    Close Browser
