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
│   ├── etl
│   │   ├── python
│   │   │   ├── commands.sh
│   │   │   ├── Dockerfile
│   │   │   ├── Service
│   │   │   │     ├── requirements.txt
│   │   │   │     ├── etl_brand.py
│   │   │   |     ├── etl_payment_status.py
│   │   │   |     ├── etl_payment.py
│   │   │   |     ├── etl_returned_code.py
│   │   │   |     ├── etl_acquirer_responses.py
│   │   │   |     ├── etl_acquirers.py
│   ├── notebooks
│   │   ├── analise_exploratoria.ipynb
│   ├── pgadmin
│   │   ├── pgadmin4.db
│   │   ├── README.md
├── src
│   ├── data
│   │   ├── raw
│   │   │   ├── clientes.csv
│   │   ├── processed
│   │   │   ├──artigo_recomendados_por_similaridade.csv
│   │   │   ├──artigos_recomendados_por_popularidade.csv
│   │   ├── create_table.sql
|   ├── service
│   │   ├── etl_brand.py
│   │   ├── etl_payment_status.py
│   │   ├── etl_payment.py
│   │   ├── etl_returned_code.py
│   │   ├── etl_acquirer_responses.py
│   │   ├── etl_acquirers.py
├── Makefile
├── README.md
├── SOLUTION.md
├── docker-compose.yml
```


----------


#### Arquitetura utilizada: 

![arquitetura](https://user-images.githubusercontent.com/28897059/65170634-7e574280-da1f-11e9-80d9-19fd761d7c3f.png)



----------


#### Inicialização
Comandos para realizar o Build das imagens que serão utilizados.

```bash
make build
```

Comandos para rodar os serviços que serão utilizados.

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