## ***Desafio Big Data Wirecard***
A proposta é não travar qual tecnologia deverá ser utilizada em cada layer, mas sim trazer um modelo que consiga atingir o máximo possível dos objetivos gerais de uma arquitetura de big data e garantir que o time de data engineer não seja focado na manutenção de estruturas, mas sim no processamento e transformação dos dados.

----------


#### Arquitetura sugerida:

A proposta ficaria semelhante a imagem abaixo.


![arquitetura_sugestao](https://user-images.githubusercontent.com/28897059/65190997-fdad3c00-da48-11e9-8a5a-cc3a23168b4f.png)


----------


#### Arquitetura
O modelo proposto visa trazer uma arquitetura genérica, que independe de soluções tecnológicas específicas para a coleta, armazenamento e processamento dos dados, sendo dividida em 3 grandes camadas. 

 ***- Batch layer***

É a camada onde o dado bruto, é armazenado e usado para o processamento. 
Este processamento por sua vez ocorre com alta latência, já que o volume de dados nesta camada é muito grande.

 ***- Speed layer***
 
Nesta camada os logs de dados recebidos são processados rapidamente para a geração de visualizações em near-realtime. 

 ***- Serving Layer***

É a camada responsável por indexar os dados processados nas camadas anteriores, permitindo que queries sejam geradas.


----------


Este modelo é proposto seguindo as seguintes premissas:

 - Robustez e tolerância a falhas;
 - Baixa latência para leitura e atualização;
 - Escalabilidade;
 - Generalização;
 - Extensibilidade;
 - Queries;
 - Manutenção mínima;
 - Fácil de debugar;
