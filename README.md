## ***Desafio***
O Projeto tem como objetivo disponibilizar os dados após um breve tratamento e disponibilizar as informações em uma API Rest.

### *Serviço Wirecard*
```
.
│   ├── api
│   │   ├── app
│   │   │   ├── requirements.txt
│   │   │   ├── Dockerfile
│   │   │   ├── view.py
│   ├── db
│   │   ├── README.md
│   │   ├── postgres
│   │   │   ├── src
│   │   │   |     ├── create_table.sql 
│   │   │   ├── Dockerfile
│   │   │   ├── der
│   │   │   ├── generate_der.sh
│   │   │   ├── postgresql-42.1.1.jar
│   │   │   ├── schemaSpy_5.0.0
│   │   │   ├── README.md
│   ├── etl
│   │   ├── python
│   │   │   ├── commands.sh
│   │   │   ├── Dockerfile
│   │   │   ├── Service
│   │   │   │     ├── requirements.txt
│   ├── notebooks
│   │   ├── analise_exploratoria.ipynb
│   ├── pgadmin
│   │   ├── pgadmin4.db
│   │   ├── README.md
├── src
│   ├── data
│   │   ├── raw
│   │   │   ├── brand.csv
│   │   │   ├── payment_status.csv
│   │   │   ├── payment.csv
│   │   │   ├── returned_code.csv
│   │   │   ├── acquirer_responses.csv
│   │   │   ├── acquirers.csv
│   ├── processed
│   ├── service
│   │   │   ├── etl_brand.py
│   │   │   ├── etl_payment_status.py
│   │   │   ├── etl_payment.py
│   │   │   ├── etl_returned_code.py
│   │   │   ├── etl_acquirer_responses.py
│   │   │   ├── etl_acquirers.py
├── Makefile
├── README.md
├── SOLUTION.md
├── docker-compose.yml
```


----------


#### Arquitetura utilizada: 

![Capturar](https://user-images.githubusercontent.com/28897059/76781160-09c24e00-678d-11ea-8b1c-13f8baebb415.PNG)



----------


#### Inicialização
Comando para realizar o Build das imagens que serão utilizados.

```bash
make build
```

Comando para rodar os serviços que serão utilizados.

```bash
make run
```
Jupyter para visualizar analise exploratoria dos dados.

```bash
make jupyter
```
***Password:*** 

`bigdatageo123`


----------

####  ***API***

##### POST `/<url>/exemplo`:
Exemplo de retorno:
```
[{"tpv": "13478.55", "tpv_count": "38"}]
```
Post volume total de pagamentos.

```bash
curl -X POST 'http://localhost:5003/tpv/wirecard.com'
```
Post taxa de conversão geral.

```bash
curl -X POST 'http://localhost:5003/overall_conversion_rate/wirecard.com'
```

Post eficiência do adquirente.

```bash
curl -X POST 'http://localhost:5003/acquirer_efficiency/wirecard.com'
```

##### GET `/<url>/exemplo`:

Exemplo de retorno:
```
[
   {
      "tpv":"13478.55",
      "tpv_count":"38"
   }
]
```

Get volume total de pagamentos.

```bash
http://localhost:5003/tpv/wirecard.com
```
Get taxa de conversão geral.

```bash
http://localhost:5003/overall_conversion_rate/wirecard.com
```

Get eficiência do adquirente.

```bash
http://localhost:5003/acquirer_efficiency/wirecard.com
```

----------