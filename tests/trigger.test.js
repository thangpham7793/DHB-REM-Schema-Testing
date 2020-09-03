const { populate, cleanUp } = require("./db_operations")

describe("When inserting a new doctor", () => {
  let pool
  beforeAll(async () => {
    pool = await require("./pool")
    //clear out old data
    await cleanUp(pool)
    //populate team table
    await pool.query(
      "INSERT INTO team (team_name, on_call_hours) VALUES (?, ?), (?, ?), (?, ?)",
      ["radiology", 80, "surgery", 60, "cancer", 120]
    )
    //populate doctor table
    await pool.query(
      "INSERT INTO doctor (first_name, team_name) VALUES (?, ?), (?, ?), (?, ?), (?, ?), (?, ?), (?, ?)",
      [
        "Tom",
        "radiology",
        "Kathy",
        "surgery",
        "Joe",
        "surgery",
        "Lisa",
        "cancer",
        "Mary",
        "cancer",
        "Will",
        "cancer",
      ]
    )
  })

  it.only("should update the on_call_hours and member_count in table team", async () => {
    const expected = [
      { team_name: "surgery", member_count: 2, average_on_call_hours: 30 },
      { team_name: "radiology", member_count: 1, average_on_call_hours: 80 },
      { team_name: "cancer", member_count: 3, average_on_call_hours: 40 },
    ]

    const tests = expected.map(
      async ({ team_name, member_count, average_on_call_hours }) => {
        const [
          rows,
        ] = await pool.query(
          "SELECT member_count, average_on_call_hours FROM team WHERE team_name = ?",
          [team_name]
        )
        expect(rows[0].member_count).toEqual(member_count)
        //returns string in result it seems
        expect(parseFloat(rows[0].average_on_call_hours)).toEqual(
          average_on_call_hours
        )
      }
    )

    await Promise.all(tests)
  })

  it("should only update the relevant team when a new team member is added", async () => {
    console.log("Do tests!")
  })

  it("should only update the relevant team when a member is deleted", async () => {
    console.log("Do tests!")
  })

  afterAll(async () => {
    await pool.end()
  })
})
