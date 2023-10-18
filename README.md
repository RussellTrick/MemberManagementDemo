# MemberManagementDemo

## Table of Contents
1. [Introduction](#introduction)
2. [Features](#features)
3. [Prerequisites](#prerequisites)
4. [Installation](#installation)
5. [Database Setup](#database-setup)
6. [Usage](#usage)

## Introduction
This is a php MVC School management demo where a user can view a school and it returns a full list of the schools members. A user can also delete edit and create schools/members.
There is also unit tests and api functionallity. 

## Features
- Adding new members with fields (Name, Email Address, School)
- Displaying members for a selected school

## Prerequisites

You need to create .env files in the root of the directories.

For the Laravel php  

Backend>.env  
```
APP_NAME
APP_ENV
APP_KEY
APP_DEBUG
APP_URL
LOG_CHANNEL
LOG_DEPRECATIONS_CHANNEL
LOG_LEVEL
DB_CONNECTION
DB_HOST
DB_PORT
DB_DATABASE
DB_USERNAME
DB_PASSWORD
```

## Flutter Frontend (Work in Progress)

This project also includes a Flutter frontend, which is currently in development and not yet finalized. While the Laravel backend is fully functional for managing members and schools, the frontend may have limited functionality or features that are not yet implemented.

### Running the Flutter Frontend  

If you want to test the Flutter frontend, follow the instructions in the `frontend_flutter/README.md` file for setup and usage.  


Frontend>Mobile>.env  
```
API_BASE_URL
```

## Installation
You need to clone the repo and open a terminal in backend and run composer install.

```bash
git clone https://github.com/RussellTrick/MemberManagementDemo.git  
cd backend  
composer install  
```

## Database Setup
This will create the tables in your MySQL database and seed them with some dummy data.
```bash
php artisan migrate --seed
```

## Usage
In order to run the laravel run the following in a terminal /backend
```
php artisan serve
```

To perform the unit tests run the following in a terminal /backend
```
php artisan test
```
