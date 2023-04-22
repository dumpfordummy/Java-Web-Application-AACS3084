/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Other/SQLTemplate.sql to edit this template
 */
/**
 * Author:  CY
 * Created: Mar 14, 2023
 */

CREATE TABLE "CUSTOMER" (
    "ID" CHAR(36) NOT NULL PRIMARY KEY,
    "USERNAME" VARCHAR(100) NOT NULL UNIQUE,
    "PASSWORDHASH" VARCHAR(100) NOT NULL UNIQUE
);

