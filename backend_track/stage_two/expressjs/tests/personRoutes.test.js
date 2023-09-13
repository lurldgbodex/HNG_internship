const chai = require("chai");
const chaiHttp = require("chai-http");
const app = require("../app");
const expect = chai.expect;

chai.use(chaiHttp);

describe("Person Routes", function () {
  this.timeout(10000);

  describe("GET /persons", () => {
    it("should return a list of persons", async () => {
      const res = await chai.request(app).get("/api/persons");

      expect(res).to.have.status(200);
      expect(res.body).to.be.an("array");
    });

    it("should return a person based on id", async () => {
      //get valid person
      const getPerson = await chai.request(app).get("/api/persons");
      const validPersonId = getPerson.body[0].id;

      const res = await chai.request(app).get(`/api/persons/${validPersonId}`);

      expect(res).to.have.status(200);
      expect(res.body).to.have.property("id");
      expect(res.body).to.have.property("name");
      expect(res.body).to.have.property("age");
      expect(res.body).to.have.property("email");
    });
  });

  describe("POST /persons", () => {
    it("should create a new person with valid input", async () => {
      const newPerson = {
        name: "Test Person 1",
        age: "20",
        email: "testperson1@mail.com",
      };
      const res = await chai.request(app).post("/api/persons").send(newPerson);
      expect(res).to.have.status(201);
      expect(res.body).to.be.an("object");
      expect(res.body.name).to.equal(newPerson.name);
      expect(res.body.age).to.equal(Number(newPerson.age));
      expect(res.body.email).to.equal(newPerson.email);
    });

    it("should return 400 if invalid input fields", async () => {
      const invalidData = {
        name: "Charlie",
        age: 25,
        email: "fakeemail",
      };
      const res = await chai
        .request(app)
        .post("/api/persons")
        .send(invalidData);
      expect(res).to.have.status(400);
      expect(res.body.error).to.equal(
        "All input fields must be provided as string"
      );
    });

    it("should return 400 if name input field missing", async () => {
      const inputfield = {
        age: "20",
        email: "s@mail.com",
      };
      const res = await chai.request(app).post("/api/persons").send(inputfield);
      expect(res).to.have.status(400);
      expect(res.body.error).to.equal("Name is required");
    });

    it("should return 400 if age input field missing", async () => {
      const inputfield = {
        name: "test_name",
        email: "s@mail.com",
      };
      const res = await chai.request(app).post("/api/persons").send(inputfield);
      expect(res).to.have.status(400);
      expect(res.body.error).to.equal("Age is required");
    });

    it("should return 400 if invalid age input field", async () => {
      const inputfield = {
        name: "slei",
        age: "myAge",
        email: "s@mail.com",
      };
      const res = await chai.request(app).post("/api/persons").send(inputfield);
      expect(res).to.have.status(400);
      expect(res.body.error).to.equal("Invalid age, provide a valid age");
    });

    it("should return 400 if e-mail input field missing", async () => {
      const inputfield = {
        name: "dkjbi",
        age: "13",
      };
      const res = await chai.request(app).post("/api/persons").send(inputfield);
      expect(res).to.have.status(400);
      expect(res.body.error).to.equal("E-mail is required");
    });
  });

  describe("PUT /persons/:id", () => {
    let validPersonId;
    //get valid person
    before(async () => {
      const getPerson = await chai.request(app).get("/api/persons");
      validPersonId = getPerson.body[0].id;
    });
    it("should update a person with valid input", async () => {
      const updateData = {
        name: "Piper",
        age: "35",
        email: "updated@mail.com",
      };
      const res = await chai
        .request(app)
        .put(`/api/persons/${validPersonId}`)
        .send(updateData);
      expect(res).to.have.status(200);
      expect(res.body).to.be.an("object");
      expect(res.body.name).to.be.equal(updateData.name);
      expect(res.body.email).to.be.equal(updateData.email);
      expect(res.body.age).to.be.equal(Number(updateData.age));
    });

    it("should return a 400 error if any input string is not a string", async () => {
      const invalidUpdateData = {
        name: 123,
        age: "19",
        email: "updated@mail.com",
      };

      const res = await chai
        .request(app)
        .put(`/api/persons/${validPersonId}`)
        .send(invalidUpdateData);

      expect(res).to.have.status(400);
      expect(res.body.error).to.be.equal(
        "All input fields must be provided as string"
      );
    });

    it("should return a 404 error if id does not exist", async () => {
      const updateData = {
        name: "new name",
        age: "29",
        email: "newname@mail.com",
      };
      const res = await chai
        .request(app)
        .put("/api/persons/589382")
        .send(updateData);

      expect(res).to.have.status(404);
      expect(res.body.error).to.be.equal("Person not found");
    });

    it("should update with only specified fields", async () => {
      const updateData = {
        name: "smackdown",
      };
      const res = await chai
        .request(app)
        .put(`/api/persons/${validPersonId}`)
        .send(updateData);

      expect(res).to.have.status(200);
      expect(res.body.name).to.be.equal(updateData.name);
    });
  });

  describe("DELETE /persons/:id", () => {
    let lastPersonId;

    before(async () => {
      const getPerson = await chai.request(app).get("/api/persons");
      const lastPerson = getPerson.body.length - 1;
      lastPersonId = getPerson.body[lastPerson].id;
    });

    it("should delete a person by id", async () => {
      const res = await chai
        .request(app)
        .delete(`/api/persons/${lastPersonId}`);

      console.log("body: " + res.body);
      expect(res).to.have.status(200);
      expect(res.body.message).to.be.equal("Person deleted successfully");
    });

    it("should return a 404 error if the person id does not exist", async () => {
      const res = await chai.request(app).delete("/api/persons/3898");

      expect(res).to.have.status(404);
      expect(res.body.error).to.be.equal("Person not found");
    });
  });
});
