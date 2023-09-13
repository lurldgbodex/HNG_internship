# API Documentation

## Table of Contents

1. [Introduction](#introduction)
2. [Standard Formats for Requests and Responses](#standard-formats)
3. [Sample Usage of the API](#sample-usage)
4. [Known Limitations and Assumptions](#limitations-assumptions)
5. [Setting Up and Deploying the API](#setup-and-deployment)

---

## 1. Introduction <a name="introduction"></a>

This documentation outlines the Person API, which provides endpoints for managing information about individuals, including their name, age, and email. The API allows you to perform basic CRUD (Create, Read, Update, Delete) operations on person records.

### Base URL

The base URL for accessing the API is `/api/persons`.

---

## 2. Standard Formats for Requests and Responses <a name="standard-formats"></a>

### 2.1 Request Formats

#### 2.1.1 Create a New Person (POST `/api/persons`)

To create a new person, send a JSON request with the following fields:

```json
{
  "name": "string",
  "age": "string (numeric)",
  "email": "string (email address)"
}
```

#### 2.1.2 Update a Person (PUT `/api/persons/:id`)

To update an existing person, send a JSON request with one or more of the following fields:

```json
{
  "name": "string",
  "age": "string (numeric)",
  "email": "string (email address)"
}
```

### 2.2 Response Formats

#### 2.2.1 Successful Response

- HTTP Status Code: `200 OK` (for successful GET, PUT, DELETE requests)
- HTTP Status Code: `201 Created` (for successful POST requests)

Response body for successful requests (JSON format):

```json
{
  "id": "string",
  "name": "string",
  "age": "number",
  "email": "string"
}
```

#### 2.2.2 Error Response

- HTTP Status Code: `400 Bad Request` (for invalid request data)
- HTTP Status Code: `404 Not Found` (for resource not found)

Error response format (JSON format):

```json
{
  "error": "string (error message)"
}
```

---

## 3. Sample Usage of the API <a name="sample-usage"></a>

### 3.1 GET List of Persons (GET `/api/persons`)

#### Request

```http
GET /api/persons
```

#### Response (Example)

```json
[
  {
    "id": "1",
    "name": "John Doe",
    "age": 30,
    "email": "johndoe@example.com"
  },
  {
    "id": "2",
    "name": "Jane Smith",
    "age": 25,
    "email": "janesmith@example.com"
  }
]
```

### 3.2 Get a Person by ID (GET `/api/persons/:id`)

#### Request

```http
GET /api/persons/1
```

#### Response (Example)

```json
{
  "id": "1",
  "name": "John Doe",
  "age": 30,
  "email": "johndoe@example.com"
}
```

### 3.3 Create a New Person (POST `/api/persons`)

#### Request

```http
POST /api/persons
Content-Type: application/json

{
  "name": "Alice Johnson",
  "age": "28",
  "email": "alice@example.com"
}
```

#### Response (Example)

```json
{
  "id": "3",
  "name": "Alice Johnson",
  "age": 28,
  "email": "alice@example.com"
}
```

### 3.4 Update a Person (PUT `/api/persons/:id`)

#### Request

```http
PUT /api/persons/1
Content-Type: application/json

{
  "name": "Updated John Doe",
  "age": "31"
}
```

#### Response (Example)

```json
{
  "id": "1",
  "name": "Updated John Doe",
  "age": 31,
  "email": "johndoe@example.com"
}
```

### 3.5 Delete a Person (DELETE `/api/persons/:id`)

#### Request

```http
DELETE /api/persons/3
```

#### Response (Example)

```json
{
  "message": "Person deleted successfully"
}
```

---

## 4. Known Limitations and Assumptions <a name="limitations-assumptions"></a>

- The API assumes that the provided age is a valid numeric string when creating or updating a person. Invalid age values will result in a `400 Bad Request` error.
- All input fields (name, age, email) must be provided as strings. Providing non-string values will result in a `400 Bad Request` error.
- When updating a person, only the specified fields in the request body will be updated. Unspecified fields will remain unchanged.

---

## 5. Setting Up and Deploying the API <a name="setup-and-deployment"></a>

To set up and deploy the API locally or on a server, follow these steps:

1. Clone the API repository to your local machine.

2. Install the required dependencies:

   ```bash
   npm install
   ```

3. Configure the database connection in the application as needed (e.g., MongoDB, MySQL).

4. Start the API server:

   ```bash
   npm start
   ```

5. The API will be accessible at the base URL specified earlier (`/api/persons`).

Ensure that you have the necessary environment variables set up for database connection details, API keys, or any other configuration specific to your deployment environment.

---

This documentation provides an overview of the Person API, including its endpoints, request/response formats, sample usage, limitations, and deployment instructions. Please refer to this documentation when using the API for reference and guidance.
