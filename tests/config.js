require("dotenv").config()

module.exports = {
  host: process.env.MYSQL_HOST,
  user: process.env.MYSQL_USER,
  password: process.env.MYSQL_PASSWORD,
  database: process.env.MYSQL_DB,
  //debug: process.env.PRODUCTION || true,
}
