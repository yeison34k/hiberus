# hiberus
 The main goal of the test it's to simulate a tyipical checkout operation in an ecommerce solution


The simulation is developed in spring framework, using mongoDB as a database.
RestTemplate was used for the consumption of the Order, Bill and Logistic apis
for the api documentation topics swagger is used with a basic configuration to work correctly
In pojo classes or entities, lombok was implemented to get / set handling
In the payment endpoint additional fields were added for the invoice generation

docker is used for application deployment, applications can be accessed by container name

ports other than 8080 are used in containers to avoid conflicts

Development environment

- Java 8
- Maven
- Windows 10
- MongoDb (Service Atlas)
- Eclipse
- PostMan
- Git (gitHub)
- Compas (Client Mongo)
- Docker (Linux Containers)
- Zipkin
- Zuul Server
- Eureka Server
- Swagger
- docker-compose

## Definition

![Alt text](https://github.com/yeison34k/hiberus/blob/master/steps/definition.png "api-gateway")

## postman
import in your postman:

https://github.com/yeison34k/hiberus/blob/master/postman/Hiberus.postman_collection.json

![Alt text](https://github.com/yeison34k/hiberus/blob/master/steps/api-gateway.PNG "api-gateway")


#### create docker network

`docker network create hiberus`

## Zipkin
http://localhost:9411/zipkin/

![Alt text](https://github.com/yeison34k/hiberus/blob/master/steps/zipkin.PNG "zipkin")


## build payment api
### swagger
http://localhost:8989/payment/swagger-ui.html

#### run docker payment

`mvn clean package`

`docker build -t payment:v1 .`

## build order api
### swagger
http://localhost:8989/order/swagger-ui.html

#### build docker order

`mvn clean package`

`docker build -t order:v1 .`

## build bill api
### swagger 
http://localhost:8989/bill/swagger-ui.html

#### build docker bill

`mvn clean package`

`docker build -t bill:v1 .`

## build logistic api
### swagger
http://localhost:8989/logistic/swagger-ui.html

#### build docker logistic

`mvn clean package`

`docker build -t logistic:v1 .`

#### build docker gateway-server

`mvn clean package`

`docker build -t gateway-server:v1 .`

![Alt text](https://github.com/yeison34k/hiberus/blob/master/steps/api-gateway.PNG "gateway")


## payment simulation

end point: http://localhost:8989/api/payment  
method: POST

# body:

```
{
    "order": {
        "clientId": "1",
        "direction": "calle 43 # 11- 23",
        "products": [
            {
                "id": 1,
                "quantity": 11,
                "cost": 30.200
            },
            {
                "id": 2,
                "quantity": 2,
                "cost": 10.300
            }
        ]
    },
    "bill" : {
        "phone": "3174568954",
        "clientIdentity": "123938463",
        "clientName": "yeison aristizabal",
        "paymentMethod": "Efectivo"
    }
}
```

# response: 

```
{
    "bill": {
        "id": "5f0c9e28ea7d4e210d541f59",
        "numberBill": "5f0c9e1068570c65ea20af021123938463",
        "clientId": "1",
        "phone": "3174568954",
        "direction": "calle 43 # 11- 23",
        "clientIdentity": "123938463",
        "clientName": "yeison aristizabal",
        "quantity": "13",
        "paymentMethod": "Efectivo",
        "total": 40.500,
        "date": "2020-07-13T17:47:07.706+00:00",
        "products": [
            {
                "id": 1,
                "quantity": 11,
                "cost": 30.200
            },
            {
                "id": 2,
                "quantity": 2,
                "cost": 10.300
            }
        ]
    },
    "send": {
        "id": "5f0c9e1adaac45392a3ceb55",
        "order": "5f0c9e1068570c65ea20af02",
        "send": true,
        "direction": "calle 43 # 11- 23"
    },
    "order": {
        "id": "5f0c9e1068570c65ea20af02",
        "clientId": "1",
        "date": "2020-07-13T17:46:56.141+00:00",
        "direction": "calle 43 # 11- 23",
        "products": [
            {
                "id": 1,
                "quantity": 11,
                "cost": 30.200
            },
            {
                "id": 2,
                "quantity": 2,
                "cost": 10.300
            }
        ]
    }
}
```

## docker-composer: at the root of the project run

`docker-compose up`

![Alt text](https://github.com/yeison34k/hiberus/blob/master/steps/run-docker-compose.PNG "Running Containers")


## Eureka server

http://localhost:8761/

![Alt text](https://github.com/yeison34k/hiberus/blob/master/steps/eureka.PNG "Eureka server")

# [APP](https://github.com/yeison34k/hiberus/tree/master/hiberus_app)
 
The application is developed in flutter, it is necessary to have the android sdk to test and the flutter package installed, the product data is dummy, but the application can connect with the server and make the purchase process

### products in stock

![Alt text](https://github.com/yeison34k/hiberus/blob/master/steps/catalogo.PNG "Products")

### Product details

![Alt text](https://github.com/yeison34k/hiberus/blob/master/steps/product_details.PNG "Products details")

### Products cart 

![Alt text](https://github.com/yeison34k/hiberus/blob/master/steps/cart.PNG "Cart")

### Payment order

in this step is necesary deploy server api and use ip or route ZuulServer 

![Alt text](https://github.com/yeison34k/hiberus/blob/master/steps/payment.PNG "Payment order")

### Bill order (Develop)

![Alt text](https://github.com/yeison34k/hiberus/blob/master/steps/bill.PNG "Order bill")
