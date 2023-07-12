# Recipes Websites

API Recipes Websites with VueJS frontend & Rails backend.\
Database is stored on phpmyadmin.
Recipe's Image is uploaded to Google Cloud Storage.\
<i>(contact me for granting access key to this repo)</i>

## Prerequisite:
- Docker<br>
- For running on local:
  - MySQL
  - Rails
  - VueJS

## Member
<a href="https://github.com/minhld99/Recipes-Website/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=minhld99/Recipes-Website" />
</a>

## Build this app using docker <b>(Temporarily Down)</b>
1. Let's build from scratch
```
$ docker-compose up --build
```
2. Open docker bash and migrate db
```
$ docker exec -ti rails bash
(docker) $ rails db:migrate
```
## Or run this in dev mode
1. First clone these two repos to your local, remember to also check the submodule inside this repo
2. Open rails server
```
$ cd rails
$ bundle install
$ rake db:migrate
$ rails s
```
3. Run vue-app on browser\
(inside this submodule [https://github.com/linhntt011199/recipeswebsitefrontend](https://github.com/linhntt011199/recipeswebsitefrontend))
```
$ cd recipeswebsitefrontend
$ npm install
$ npm run serve
```
4. Enter this link for login: [http://localhost:3000/](http://localhost:3000/login)

## Account for testing
```
- Email: minh@minh.com
- Password: password
```
