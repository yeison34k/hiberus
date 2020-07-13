# hiberus
 The main goal of the test it's to simulate a tyipical checkout operation in an ecommerce solution


The simulation is developed in spring framework, using mongoDB as a database.
RestTemplate was used for the consumption of the Order, Bill and Logistic apis
for the api documentation topics swagger is used with a basic configuration to work correctly
In pojo classes or entities, lombok was implemented to get / set handling
In the payment endpoint additional fields were added for the invoice generation

the use of Eureka or the like is omitted
use of zuul server (ApiGetway) or similar is ignored

docker is used for application deployment, applications can be accessed by container name

ports other than 8080 are used in containers to avoid conflicts

Development environment

Java 8
Maven
Windows 10
MongoDb (Service Atlas)
Eclipse
PostMan
Git (gitHub)
Compas (Client Mongo)
Docker (Linux Containers)


## postman
import in your postman:

https://github.com/yeison34k/hiberus/blob/master/postman/Hiberus.postman_collection.json


#### create docker network

`docker network create hiberus`

## payment api
### swagger
http://localhost:8181/swagger-ui.html

#### run docker payment

`mvn clean package`

`docker build -t payment:v1 .`

## order api
### swagger
http://localhost:8086/swagger-ui.html

#### run docker order

`mvn clean package`

`docker build -t order:v1 .`

## bill api
### swagger 
http://localhost:8092/swagger-ui.html

#### run docker bill

`mvn clean package`

`docker build -t bill:v1 .`

## logistic api
### swagger
http://localhost:8091/swagger-ui.html

#### run docker order

`mvn clean package`

`docker build -t logistic:v1 .`

## payment simulation

end point: http://localhost:8181/payment  
method: POST
body:

```
{
  "bill": {
    "clientId": "string",
    "clientIdentity": "string",
    "clientName": "string",
    "date": "2020-06-29T22:24:50.738Z",
    "direction": "string",
    "id": "string",
    "numberBill": "string",
    "paymentMethod": "string",
    "phone": "string",
    "products": [
      {
        "clientId": "string",
        "date": "2020-06-29T22:24:50.738Z",
        "direction": "string",
        "id": "string",
        "products": [
          null
        ]
      }
    ],
    "quantity": "string",
    "total": 0
  },
  "order": {
    "clientId": "string",
    "date": "2020-06-29T22:24:50.738Z",
    "direction": "string",
    "id": "string",
    "products": [
      null
    ]
  }
}
```

##docker-composer: at the root of the project run

`docker-compose up`

