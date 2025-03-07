# README

pour un usage local de ce merveilleux petittrucafaire

1 - lancer bundle install

2 - Modifier database.yml

development:
  adapter: postgresql
  encoding: unicode
  database: lenomdevotrebase
  pool: 5

3 - lancer rails db:create

4 - Créer un fichier .env et ajouter une variable DEVISE_JWT_SECRET_KEY = "cudqVkC2qo1EJFbr+wfxpOlRzHJ9OiS5uNUHJu2dVIoy3yL18V1+7neA95qr9CLX" (tu peux mettre ce que tu veux à la place c'est juste pour faire tourner jwt) ou lance 'rails secret', ca peut petre le faire aussi.

5 - rails db:migrate

6 - rails server

NOTE =============================v


J’ai mis un peu plus de temps que prévu pour faire ce que j’ai fait (beaucoup plus que ce qui été demandé dans l’énoncé, environ 6 ou 7h en tout). 

Comme dit, je reprends un peu la main sur rails après un petit moment sans y avoir touché. 

Les versions du framework sont tellement diverses qu’il est vraiment possible d’aller dans pleins de directions. Au delà de ça, le fait de partir from scratch exige pas mal de configuration au final par rapport à du développement de feature pure et dure sur un produit déjà en place xD. 

J’ai pas utilisé de scaffolding pour les modèles User et Event parce que je voulais mettre les mains dans le cambouis au début (motivé le garçon) ça aurait put m’épargner une bonne demie here je pense. Pour l’authentification j’ai bien utilisé Devise et la gem a fait pas mal de choses pour moi. 

J’ai un peu galéré a finaliser l’authentification parce que dans l’énoncé ça parle de password_digest qui lui est géré par  ‘bcrypt’, une autre gem qui fonctionne avec has_secure_password. A un moment j’avais les deux gems en meme temps et forcément ca ne le fait pas du tout ^^ Bref, Devise a fait le taff mais pas d’attribut “password_digest”. 

Le password est encrypter cela dit.J’ai aussi eu un soucis de versioning de ruby pour implémenter un SaaS et importer bootstrap, Ca m’a pris la tete alors j’ai décidé de faire tout a la Mano avec du css à la volée. Le résultat…est… ce qu’il est, pas dingue visuellement mais je me suis dit que c’était pas le but de l’exercice. :) 

Pour le reste, le CRUD fonctionne, la validation est en place, JWT aussi  via devise-jwt. J’ai mis une mini requête API GET histoire de. Si tu as déjà un User de créé, tu peux curl -X GET http://localhost:3000/api/v1/users/[:id]/events -H "Authorization: Bearer <JWT_TOKEN>”. 

Pour chopper tous évènements rattaché a ce user. Je l’ai pas mis dans l’interface parce que je voyais pas trop l’intérêt a ce stade a moins que veuille vraiment se lancer dans le Business avec cette super appli :D
Ya pas vraiment de grosse requêtes à faire donc pour les query N+1 queries je sais pas si ca a un réel intérêt mais rassures toi, je vois de quoi il s’agit.

Je m'arrete là, je commence a fatiguer. Il y aurait évidement PLEEEEINN de trucs à améliorer, j'ai utilisé assez peut de helper par example, j'aurrait put aller plus dans la création de l'API et sont utilisation, utilisé turbo frame pour ne pas à avoir a recharger les pages etc, ajouter des tests biensure, bref beaucoup de choses mais en 3, 4h et dans le sens que je l'ai pris ça faisait un peu serrer... 

Désolé Pas taper, pas taper !!


NOTE =============================^
