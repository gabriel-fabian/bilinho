# Bilinho

API simples em RoR para administração de matrículas e pagamentos de mensalidades pelos alunos a instituíção que estudam.

## Primeira Execução

O projeto está configurado utilizando algumas variáveis de ambiente. Antes de mais nada crie um arquivo `.env` na root do projeto especificando as variáveis de acesso.

```
DB_USER=postgres
DB_PASS=password
DB_HOST=db
DB_DEV=bilinho_development
DB_TEST=bilinho_test
```
Após definida as variáveis de ambiente basta executar `docker-compose up --build -d` para buildar as docker images necessárias e subir a aplicação. Lembrando que é necessário buildar novamente para cada nova alteração de código.

:warning: O Dockerfile está configurado para executar `bundle install` com `frozen` habilitado, certifique-se de executar localmente o `bundle install` caso haja alguma nova Gem adicionada ao `Gemfile`.

Para acessar o container da aplicação basta executar `docker exec -it bilinho_web_1`.

## Configurando o Banco
Estando dentro do container da aplicação basta executar `rake db:create db:migrate db:seed` para criar ambos os ambientes de `test` e `development`

Agora é possível executar os testes com o comando `rspec` ou acessar o rails console com `rails c`
