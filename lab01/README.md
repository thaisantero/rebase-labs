# Rebase-Labs - Thaís Antero

Este projeto foi desenvolvivo com o intuito de estudo e seu escopo foi elaborado seguindo as instruçoes o arquivo 'informaçoes.md'.

## Instalação

Primeiro, clone o repositório:

```sh
git clone git@github.com:thaisantero/rebase-labs.git
```

Depois tem que subir os containers do postgres, redis, sidekiq
e servidor. Isso, é possível de duas formas distintas:

1) Executando o docker compose, o qual sobe os containers do
redis, postgres e servidor, da seguinte forma:

```sh
docker compose up
```
E, de forma simultânea, o container do sidekiq com o comando:

```sh
bin/sidekiq
```

2) Subindo cada container de forma separada, executando esses
comandos:

```sh
bin/postgres
```

```sh
bin/redis
```

```sh
bin/sidekiq
```

```sh
bin/server
```
## Uso

Com o servidor funcionando acesse a seguinte URL para importar os dados de 'data.csv' para o banco de dados:

http://localhost:3000/import

A URL:

http://localhost:3000/tests

Apresenta os dados do csv 'data.csv ' na forma de json.

Já a URL:

http://localhost:3000/index.html

Apresenta os dados do csv importado 'data.csv' na forma de 
tabela com dados resumidos.

Para acessar os dados completos de cada token que corresponde 
a um conjuntos de exames do mesmo cpf é
só clicar no link 'Destalhes' na tabela. Assim, irá
redirecionar para a URL:

http://localhost:3000/show/:token

Este endpoint apresenta os dados completos do conjunto
de exames relativo ao mesmo Token.  
