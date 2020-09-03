const populate = async (pool) => {
  return
}

const cleanUp = async (pool) => {
  await pool.query("TRUNCATE TABLE doctor")
  await pool.query("DELETE FROM team")
}

module.exports = {
  populate,
  cleanUp,
}
