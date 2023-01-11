# Rebase-Labs - Thaís Antero

Este projeto foi desenvolvivo com o intuito de estudo e seu escopo foi elaborado seguindo as instruçoes o arquivo 'informaçoes.md'.

## Instalação

Primeiro, clone o repositório:

```sh
git clone git@github.com:thaisantero/rebase-labs.git
```

Depois, execute os comandos de forma simultânea:

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

Com o servidor funcionando acesse a seguinte URL para importar os dados de 'data.csv' para o banco de dados utilizando 
sidekiq:

http://localhost:3000/import

Após importar os dados para o banco pode finalizar a execução dos containers e utilizar o comando:

```sh
docker compose up
```

Para executar o docker compose.

## Uso

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
