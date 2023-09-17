import 'package:flutter/material.dart';

import '../models/profile.dart';

class ProfileProvider with ChangeNotifier {
  Profile _myProfile = const Profile(
    fullName: "Gbodi Segun Clement",
    slackName: "gbodi segun",
    subtitle: "Software Engineer & Mobile Developer",
    githubLink: "https://github.com/lurldgbodex/",
    address: "HillView Estate LifeCamp, Abuja F.C.T, Nigeria",
    bio:
        "Accounting graduate with a passion for software engineering and one year of software development training, specializing in backend development. Skilled in JavaScript, Python, Nodejs, Express, Flask, SQL, NoSQL, and AWS. Strong understanding of software development principles and experience using agile methodologies, version control, and continuous integration and delivery. Completed foundational courses in C programming, networking, and DevOps.",
  );

  Profile get myProfile => _myProfile;

  void updateProfile(Profile newProfile) {
    _myProfile = newProfile;
    notifyListeners();
  }
}
