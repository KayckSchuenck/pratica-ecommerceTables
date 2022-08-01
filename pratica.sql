CREATE DATABASE "banco_de_dados_pratica";

CREATE TABLE "customers" (
	"id" SERIAL PRIMARY KEY,
	"name" TEXT NOT NULL,
	"password" TEXT NOT NULL,
    "email" TEXT NOT NULL UNIQUE
);

CREATE TYPE "category" AS ENUM ('shirt','pants','dress','skirt') 

CREATE TABLE "products" (
    "id" SERIAL PRIMARY KEY,
	"name" TEXT NOT NULL,
    "price" INTEGER NOT NULL,
    "mainPicture" TEXT NOT NULL,
    "type" 'category' NOT NULL,
    "size" varchar(2) NOT NULL
)

CREATE TABLE "pictures" (
    "id" SERIAL PRIMARY KEY,
	"link" TEXT NOT NULL,
    "idProduct" INTEGER REFERENCES "products"(id) NOT NULL, 
)

CREATE TABLE "adresses" (
    "id" SERIAL PRIMARY KEY,
    "userId" INTEGER REFERENCES "customers"(id) NOT NULL,
	"street" TEXT NOT NULL,
    "number" INTEGER NOT NULL,
    "city" TEXT NOT NULL,
    "postalCode" TEXT NOT NULL,
    "state" TEXT NOT NULL,
    "complement" TEXT
)

CREATE TYPE "status" AS ENUM ('paid','created','delivered','canceled')

CREATE TABLE "purchases" (
    "id" SERIAL PRIMARY KEY,
	"idUser" INTEGER REFERENCES "customers"(id) NOT NULL,
    "date" DATE NOT NULL DEFAULT NOW(),
    "adressId" INTEGER REFERENCES "adresses"(id) NOT NULL,
    "type" 'status' NOT NULL
)

CREATE TABLE "qtyProducts" (
    "id" SERIAL PRIMARY KEY,
    "idProduct" INTEGER REFERENCES "products"(id) NOT NULL,
    "qty" INTEGER NOT NULL,
    "idPurchase" INTEGER REFERENCES "purchases"(id) NOT NULL
)