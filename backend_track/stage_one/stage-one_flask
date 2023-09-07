from flask import Flask, request, jsonify
from datetime import datetime

app = Flask(__name__)


@app.route('/api')
def index():
    slack_name = request.args.get('slack_name')
    track = request.args.get('track')

    json_data = {
        'slack_name': slack_name,
        'current_day': datetime.now().strftime('%A'),
        'utc_time': datetime.utcnow().strftime('%Y-%m-%dT%H:%M:%SZ'),
        'track': track,
        'github_file_url': 'https://github.com/lurldgbodex/HNG_internship/blob/main/backend_track/stage_one/stage-one_flask',
        'github_repo_url': 'https://github.com/lurldgbodex/HNG_internship',
        'status_code': 200
    }

    return jsonify(json_data), 200


if __name__ == '__main__':
    app.run()
