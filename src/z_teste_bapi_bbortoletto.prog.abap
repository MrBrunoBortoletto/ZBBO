*&---------------------------------------------------------------------*
*& Report Z_TESTE_BAPI_BBORTOLETTO
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT Z_TESTE_BAPI_BBORTOLETTO.

* Exemplo de entrada de dados na tabela SFLIGHT
*    airlineid       = 'LH'
*   connectionid    = '0401'
*    flightdate      = '07.03.2014'

* Declara variaveis
DATA : dados TYPE bapisfldat,
       dados_info TYPE bapisfladd,
       dados_availability TYPE bapisflava,
       dados_it_ret TYPE STANDARD TABLE OF bapiret2.

* Declara parametros
PARAMETERS : empresa TYPE sflight-carrid,
             conexao TYPE sflight-connid,
             data    TYPE sflight-fldate.


START-OF-SELECTION.
* Chama BAPI
CALL FUNCTION 'BAPI_FLIGHT_GETDETAIL'
  EXPORTING
    airlineid       = empresa
    connectionid    = conexao
    flightdate      = data
  IMPORTING
    flight_data     = dados
    additional_info = dados_info
    availibility    = dados_availability
  TABLES
    return          = dados_it_ret.

* Imprime Resultado dos campos
write : / 'Flight Data: ',
        / dados-AIRLINEID,
        / dados-AIRLINE,
        / dados-CONNECTID,
        / dados-FLIGHTDATE,
        / dados-AIRPORTFR,
        / dados-CITYFROM,
        / dados-AIRPORTTO,
        / dados-CITYTO,
        / dados-DEPTIME,
        / dados-ARRTIME,
        / dados-ARRDATE,
        / dados-PRICE,
        / dados-CURR,
        / dados-CURR_ISO.
