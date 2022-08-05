<h1 align="center">Routy Backend</h1>

![Map of Great Lakes ](leaflepmap.png)

<p align="center">Rails API application.</p>

---

### Table of Content

- [Description](#description)
- [Specification](#specification)
  - [Backend](#backend)
    - [Versioning](#versioning)
    - [Database](#database)
- [Installation](#installation)
- [How to use this app](#how-to-use-this-app)
- [Challanges](#challanges)
- [Future upgrades](#future-upgrades)
- [Bugs](#bugs)
- [License](#license)

---

## Description

This is server part of **Routy Application**. 

**Backend:** is built in Ruby on Rails as a new API and **Frontend:** is a Single Page Application(SPA) written in JavaScript. 
In the backend part, we use **devise** and **JWT** gems for authentication and authorization to welcome our users and give them the option to create a new account or log in to an existing one and save important places and load them on the leaflet map.

---

## Specification

### Backend

The server side of this application is build with Ruby on Rails and postgreSQL as database only as API. Some of added gems are:  
- `gem "rack-cors"` - provides support for Cross-Origin Resource Sharing (CORS) for Rack compatible web applications.
- `gem "jbuilder"` - template engine for rendering a JSON response and all files are located in 'app/views/v1' folder.
- `gem "devise"`- used for user authentication 
- `gem "JWT"` - used for token-based verification method 


<spam style="color:yellow">_NOTE: command to run: `rails new <app_name> --database=postgresql --api`._ </spam>

#### Versioning

- Ruby: `ruby 3.0.0p0`
- Ruby on Rails: `Rails 7.0.3`

<spam style="color:yellow">_NOTE: This can be checked by running `ruby -v ` and `rails -v ` in root folder of this application._ </spam>

#### Database

Database used for this application is postgreSQL.

<details>
<summary>See database schema</summary>

![Database Schema](theRoutyApplication.jpg)
_<p align="center"> Database schema </p>_

</details>
___

## Installation

1.  Backend [(github link)](https://github.com/zicna/routy-backend 'backend repo')

- fork this repo
- clone it to your local environment
- terminal commands to setup backend:

```
bundle install
rails db:create
rails db:migrate
rails server
```

<spam style="color:yellow">NOTE: We can check if server is up and running by navigating to `http://localhost:3000/users` </spam>

---

## How to use this app

- After **Installation** and verifying that our server is working rest of application usage is done through frontend part of application
- The frontend part we can check [here](https://github.com/zicna/routy-frontend).

---

## Challanges

- Authentication and Authorization using device due too devise gem working on top of warner gem
- Learning to use Paw for API testing (after initial phase this helped me a lot when building backend of my application)


---

## Future upgrades

- [ ] Better error handeling (case server is not working or something else goes wrong with AJAX requests)
- [ ] Adding user email confirmation
- [ ] Better styling
- [ ] Possibly develop this application using React and Redux (which would make a lot more sense)

---

## Bugs

1. Certain problem can occur while leaflet map is loading since it is happening asynchronously  

For any questions or bugs reports please conntact me [here](http://www.milan-zivkovic.com). Thank you!


---

## License

This application is avaiable as open source under the terms of the [MIT License](license).

