require("dotenv").config();

const express = require("express");
const cors = require("cors");

const app = express();
const port = process.env.PORT || 3000;

app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use(cors());

app.use("/api", require("./routes/personRoutes"));

app.listen(port, () => {
  console.log(`Server started on port ${port}`);
});

module.exports = app;
