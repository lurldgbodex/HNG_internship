const express = require("express");
const app = express();
const port = 3000;
const { DateTime } = require("luxon");

app.get("/api", (req, res) => {
  const slackName = req.query.slack_name;
  const track = req.query.track;
  const currentDay = DateTime.now().toLocaleString({ weekday: "long" });
  const utcTime = DateTime.utc().toISO({ suppressMilliseconds: true });
  const githubFileUrl =
    "https://github.com/lurldgbodex/HNG_internship/blob/main/backend_track/stage_one/stage-one_flask";
  const githubSourceUrl = "https://github.com/lurldgbodex/HNG_internship";
  const statusCode = 200;

  const responseData = {
    slack_name: slackName,
    current_day: currentDay,
    utc_time: utcTime,
    track: track,
    github_file_url: githubFileUrl,
    github_repo_url: githubSourceUrl,
    status_code: statusCode,
  };
  res.json(responseData);
});

app.listen(port, () => {
  console.log(`Express app listening on http://localhost:${port}`);
});
