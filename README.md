# hiberus
 The main goal of the test it's to simulate a tyipical checkout operation in an ecommerce solution



## payment api
### swagger
http://localhost:8181/swagger-ui.html

run docker payment

mvn clean package

docker build -t payment:v1 .

docker run -p 8181:8181 --name payment --network hiberus payment:v1


## order api
## swagger
http://localhost:8086/swagger-ui.html

run docker order

mvn clean package

docker build -t order:v1 .

docker run -p 8086:8086 --name payment --network hiberus payment:v1


## bill api
### swagger 
http://localhost:8092/swagger-ui.html

run docker bill

mvn clean package

docker build -t bill:v1 .

docker run -p 8092:8092 --name bill-simulation --network hiberus payment:v1


## logistic api
### swagger
http://localhost:8091/swagger-ui.html

run docker order

mvn clean package

docker build -t logistic:v1 .

docker run -p 8092:8092 --name logistic-simulation --network hiberus logistic:v1