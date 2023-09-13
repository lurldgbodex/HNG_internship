# Person API - README

This README provides detailed instructions on how to set up, run, and use the Person API. The API allows you to manage information about individuals, including their name, age, and email. You can perform basic CRUD (Create, Read, Update, Delete) operations on person records.

## Table of Contents

1. [Prerequisites](#prerequisites)
2. [Getting Started](#getting-started)
   - [Clone the Repository](#clone-the-repository)
   - [Install Dependencies](#install-dependencies)
   - [Configure the Database](#configure-the-database)
   - [Start the API](#start-the-api)
3. [API Endpoints](#api-endpoints)
   - [GET List of Persons](#get-list-of-persons)
   - [Get a Person by ID](#get-a-person-by-id)
   - [Create a New Person](#create-a-new-person)
   - [Update a Person](#update-a-person)
   - [Delete a Person](#delete-a-person)
4. [UML diagram link](#uml-diagram-link)
5. [Testing](#testing)
6. [Known Limitations and Assumptions](#known-limitations-and-assumptions)

## 1. Prerequisites <a name="prerequisites"></a>

Before you can set up and run the Person API, ensure you have the following prerequisites installed on your system:

- Node.js: You can download and install Node.js from the [official website](https://nodejs.org/).

- npm (Node Package Manager): npm is usually installed automatically with Node.js. You can check its version using `npm -v`.

- Postgresql: If you plan to use MongoDB as the database for this API, make sure it is installed and running. You can download MongoDB from the [official website](https://www.postgresql.org/).

## 2. Getting Started <a name="getting-started"></a>

Follow these steps to set up, run, and use the Person API:

### Clone the Repository <a name="clone-the-repository"></a>

Clone the API repository to your local machine using Git:

```bash
git clone https://github.com/lurldgbodex/HNG_internship.git
```

### Install Dependencies <a name="install-dependencies"></a>

Navigate to the project directory and install the required Node.js dependencies:

```bash
cd backend_track/stage_two/expressjs
npm install
```

### Configure the Database <a name="configure-the-database"></a>

create `.env` file in the project root directory and update the `DATABASE_URL` variable with your postgres connection string. Here's an example:

```env
DATABASE_URL=postgres://localhost:.../persons
```

Replace `postgres://localhost:.../persons` with your actual postgres connection string.

### Start the API <a name="start-the-api"></a>

Start the API server by running the following command:

```bash
npm start
```

The API should now be running and accessible at the base URL `http://localhost:3000/api/persons`. By default, it runs on port 3000, but you can change this in the `.env` file.

## 3. API Endpoints <a name="api-endpoints"></a>

The Person API provides the following endpoints for managing person records:

### 3.1 GET List of Persons <a name="get-list-of-persons"></a>

- **Endpoint:** `/api/persons`
- **HTTP Method:** GET
- **Description:** Retrieve a list of all persons.
- **Response:** JSON array containing person records.

### 3.2 Get a Person by ID <a name="get-a-person-by-id"></a>

- **Endpoint:** `/api/persons/:id`
- **HTTP Method:** GET
- **Description:** Retrieve a person's information by their ID.
- **Response:** JSON object containing the person's details.

### 3.3 Create a New Person <a name="create-a-new-person"></a>

- **Endpoint:** `/api/persons`
- **HTTP Method:** POST
- **Description:** Create a new person record.
- **Request:** JSON object with `name`, `age`, and `email` fields.
- **Response:** JSON object with the newly created person's details.

### 3.4 Update a Person <a name="update-a-person"></a>

- **Endpoint:** `/api/persons/:id`
- **HTTP Method:** PUT
- **Description:** Update an existing person's information.
- **Request:** JSON object with one or more of the following fields: `name`, `age`, and `email`.
- **Response:** JSON object with the updated person's details.

### 3.5 Delete a Person <a name="delete-a-person"></a>

- **Endpoint:** `/api/persons/:id`
- **HTTP Method:** DELETE
- **Description:** Delete a person record by their ID.
- **Response:** JSON object with a success message.

## 4. UML diagram link <a name="uml-diagram-link"></a>

- [uml link that shows relationship between models and API classes](https://drive.google.com/file/d/1VoOthXTZNaYbM-f3uMzWX2O4efCgvqYv/view?usp=sharing)
- [Entity relational diagram of database table](https://drive.google.com/file/d/154Hq0fgAU3krZGpr0PoAQK05QDNd9IJR/view?usp=sharing)

## 5. Testing <a name="testing"></a>

- The endpoints is extensively tested to ensure proper functioning.
- after setup, you can run the tests with the command `npm test tests` from the root directory

## 6. Known Limitations and Assumptions <a name="known-limitations-and-assumptions"></a>

- The API assumes that the provided age is a valid numeric string when creating or updating a person. Invalid age values will result in a `400 Bad Request` error.

- All input fields (name, age, email) must be provided as strings. Providing non-string values will result in a `400 Bad Request` error.

- When updating a person, only the specified fields in the request body will be updated. Unspecified fields will remain unchanged.

Congratulations! You have successfully set up and started the Person API. You can now use it to manage person records by making HTTP requests to the provided endpoints. Please refer to the API documentation for more details on using each endpoint.
