package com.sgcor.stageone;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@SpringBootApplication
@RestController
public class StageOneApplication {
	private static final Logger logger = LoggerFactory.getLogger(StageOneApplication.class);

	public static void main(String[] args) {
		SpringApplication.run(StageOneApplication.class, args);
	}

	/**
	 * Get information based on query parameters
	 * 
	 * @param slackName
	 * @param track
	 * @return InfoResponse object
	 */

	@GetMapping("/api")
	public ResponseEntity<?> getInfo(
			@RequestParam(name = "slack_name", required = false) String slackName,
			@RequestParam(name = "track", required = false) String track) {

		if (slackName == null || track == null || slackName.isEmpty() || track.isEmpty()) {
			return ResponseEntity
					.badRequest()
					.body(new ErrorResponse("Slack_name and track query parameters are required"));
		}

		try {
			String dayOfWeek = LocalDateTime.now().getDayOfWeek().toString();
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("uuuu-MM-dd'T'HH:mm:ss'Z'");
			LocalDateTime currentUtcTime = LocalDateTime.now().withNano(0);

			String gitHubFileUrl = "https://github.com/lurldgbodex/HNG_internship/tree/main/backend_track/stage_one";
			String githubSourceUrl = "https://github.com/lurldgbodex/HNG_internship";
			int statusCode = 200;

			return ResponseEntity.ok(new InfoResponse(
					slackName,
					dayOfWeek,
					currentUtcTime.format(formatter),
					track,
					gitHubFileUrl,
					githubSourceUrl,
					statusCode));

		} catch (Exception e) {
			logger.error("An error occured while processing the request.", e);
			return ResponseEntity
					.status(HttpStatus.INTERNAL_SERVER_ERROR)
					.body(new ErrorResponse("An error occurred while processing your request"));
		}
	}

	/**
	 * infoResponse class to represent the response in json format
	 */
	public record InfoResponse(
			String slack_name,
			String current_day,
			String utc_time,
			String track,
			String github_file_url,
			String github_repo_url,
			int status_code) {
	}

	public record ErrorResponse(String message) {
	}

}
