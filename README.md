# README

pour un usage local de ce merveilleurx petittrucafaire

1 - lancer bundle install

2 - Modifier database.yml

development:
  adapter: postgresql
  encoding: unicode
  database: lenomdevotrebase
  pool: 5

3 - lancer rails db:create

4 - rails db:migrate

5 - rails server

