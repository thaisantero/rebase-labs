# Rebase-Labs - Thaís Antero

Este projeto foi desenvolvivo com o intuito de estudo e seu escopo 
foi elaborado seguindo as instruçoes o arquivo [a relative link](informaçoes.md).

## :whale: Instalação

Primeiro, clone o repositório:

```sh
$ git clone git@github.com:thaisantero/rebase-labs.git
```

Depois suba os containers do postgres, redis, sidekiq
e servidor. Isso, pode ser realizado de duas formas distintas:

1) Executando o docker compose, o qual sobe os containers do
redis, postgres e servidor, da seguinte forma:

```sh
$ docker compose up
```

E, de forma simultânea, o container do sidekiq com o comando:

```sh
bin/sidekiq
```

2) Subindo cada container de forma separada, executando esses
comandos:

```sh
$ bin/postgres

$ bin/redis

$ bin/sidekiq

$ bin/server
```

## :robot: Uso

### Endpoint '/import'

Com o servidor funcionando acesse a seguinte URL para importar os dados de 'data.csv' para o banco de dados:

http://localhost:3000/import

![alt text](https://github.com/thaisantero/rebase-labs/blob/main/lab01/images/Screenshot%20from%202023-01-12%2004-44-31.png)

### Endpoint '/tests'

A URL:

http://localhost:3000/tests

Apresenta os dados do csv 'data.csv ' na forma de json.

![alt text](https://github.com/thaisantero/rebase-labs/blob/main/lab01/images/Screenshot%20from%202023-01-12%2004-38-48.png)

### Endpoint '/index.html'

Já a URL:

http://localhost:3000/index.html

Apresenta os dados do csv importado 'data.csv' na forma de 
tabela com dados resumidos.

Para acessar os dados completos de cada token que corresponde 
a um conjunto de exames do mesmo cpf é
só clicar no link 'Detalhes' na tabela.

![alt text](https://github.com/thaisantero/rebase-labs/blob/main/lab01/images/Screenshot%20from%202023-01-12%2004-43-15.png)

### Endpoint '/show/:token'

Assim, irá redirecionar para a URL:

http://localhost:3000/show/:token

Este endpoint apresenta os dados completos do conjunto
de exames relativo ao mesmo Token.

![alt text](https://github.com/thaisantero/rebase-labs/blob/main/lab01/images/Screenshot%20from%202023-01-12%2004-44-06.png)