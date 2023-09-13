require("dotenv").config();
const pg = require("pg-promise")();

const db = pg({
  connectionString: process.env.DATABASE_URL,

  ssl: {
    rejectUnauthorized: true,
  },
});

const getPerson = async () => {
  const result = await db.any("SELECT * FROM persons");
  return result;
};

const getPersonById = async (id) => {
  const person = await db.oneOrNone("SELECT * FROM persons WHERE id=$1", id);
  return person;
};
const createPerson = async (name, age, email) => {
  const newPerson = await db.one(
    "INSERT INTO persons (name, age, email) VALUES ($1, $2, $3) RETURNING *",
    [name, age, email]
  );
  return newPerson;
};

const updatePerson = async (id, name, age, email) => {
  const person = await db.one(
    "UPDATE persons SET name = $1, age=$2, email=$3 WHERE id=$4 RETURNING *",
    [name, age, email, id]
  );
  return person;
};

const deletePerson = async (id) => {
  await db.none("DELETE FROM persons WHERE id=$1", id);
};

module.exports = {
  getPerson,
  getPersonById,
  createPerson,
  updatePerson,
  deletePerson,
};
