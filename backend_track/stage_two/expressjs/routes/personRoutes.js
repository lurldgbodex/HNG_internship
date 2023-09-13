const express = require("express");
const {
  getPerson,
  getPersonById,
  createPerson,
  updatePerson,
  deletePerson,
} = require("../db");

const router = express.Router();

router.get("/persons", async (req, res) => {
  try {
    const persons = await getPerson();
    res.status(200).json(persons);
  } catch (error) {
    res.status(500).json({ error: "Failed to fetch users" });
  }
});

router.get("/persons/:id", async (req, res) => {
  try {
    const personId = req.params.id;
    const person = await getPersonById(personId);

    if (!person) {
      return res.status(404).json({ error: "Person not found" });
    }

    return res.status(200).json(person);
  } catch (error) {
    return res.status(500).json({ error: "Failed to fetch user" });
  }
});

router.post("/persons", async (req, res) => {
  try {
    const { name, age, email } = req.body;
    const validAge = Number(age);

    if (!name) {
      return res.status(400).json({ error: "Name is required" });
    }

    if (!age) {
      return res.status(400).json({ error: "Age is required" });
    }

    if (isNaN(validAge) || validAge <= 0) {
      return res
        .status(400)
        .json({ error: "Invalid age, provide a valid age" });
    }

    if (!email) {
      return res.status(400).json({ error: "E-mail is required" });
    }

    if (
      typeof name !== "string" ||
      typeof age !== "string" ||
      typeof email !== "string"
    ) {
      return res
        .status(400)
        .json({ error: "All input fields must be provided as string" });
    }

    const newPerson = await createPerson(name, validAge, email);
    res.status(201).json(newPerson);
  } catch (error) {
    console.log(error.message);
    return res.status(500).json({ error: "Failed to create person" });
  }
});

router.put("/persons/:id", async (req, res) => {
  try {
    const personId = req.params.id;
    const oldData = await getPersonById(personId);

    if (!oldData) {
      return res.status(404).json({ error: "Person not found" });
    }

    let { name, age, email } = req.body;
    let validAge;

    if (
      (name && typeof name !== "string") ||
      (age && typeof age !== "string") ||
      (email && typeof email !== "string")
    ) {
      return res
        .status(400)
        .json({ error: "All input fields must be provided as string" });
    }

    if (age && !isNaN(Number(age)) && Number(age) > 0) {
      validAge = Number(age);
    }

    const updatedData = {
      name: name || oldData.name,
      age: validAge || oldData.age,
      email: email || oldData.email,
    };
    const updatedPerson = await updatePerson(
      personId,
      updatedData.name,
      updatedData.age,
      updatedData.email
    );
    return res.status(200).json(updatedPerson);
  } catch (error) {
    console.log(error.message);
    return res.status(500).json({ error: "Failed to updated person" });
  }
});

router.delete("/persons/:id", async (req, res) => {
  try {
    const personId = req.params.id;
    const person = await getPersonById(personId);
    if (!person) {
      return res.status(404).json({ error: "Person not found" });
    }

    await deletePerson(personId);
    return res.status(200).json({ message: "Person deleted successfully" });
  } catch (error) {
    return res.status(500).json({ error: "Failed to delete user" });
  }
});

module.exports = router;
