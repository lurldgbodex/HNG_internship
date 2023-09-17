import 'package:flutter/material.dart';

import '../models/project.dart';

class ProjectProvider with ChangeNotifier {
  final List<Project> _projects = [
    const Project(
      title: "Quick Quiz",
      subtitle: "Basic Web Application",
      stack: ["NodeJs", "ExpressJs", "Mongodb", "EJS"],
      description: [
        "Developed a web application that allows users to create and take quizzes, including user authentication and authorization, quiz creation and management, quiz-taking functionality, user score tracking and display",
        "Used NodeJs with ExpressJs framework for the backend, MongoDB for data storage, Ejs for server-side rendering, and Passportjs for authentication and authorization",
        "Worked on the full stack development of the application, including designing and implementation the data schema and interface and functionality"
      ],
      sourceCode: "https://github.com/lurldgbodex/QuickQuiz",
    ),
    const Project(
      title: "Task-Manager",
      subtitle: "API",
      stack: ["ExpressJs", "MongoDB"],
      description: [
        "A RESTFUL web service that provides endpoints for managing tasks and user authentication",
        "It allows users to create, retrieve, update and delete tasks, as well as register and log in user accounts",
        "Uses ExpressJS framework for building the API, MongoDB as database, and JWT for authentication and authorization"
      ],
      sourceCode:
          "https://github.com/lurldgbodex/Portfolio/tree/main/Task-Manager-API",
    ),
  ];

  List<Project> get projects => _projects;

  void addProject(Project newProject) {
    _projects.add(newProject);
    notifyListeners();
  }

  void removeProject(int index) {
    _projects.removeAt(index);
    notifyListeners();
  }

  void updateProject(int index, Project updatedProject) {
    if (index >= 0 && index < _projects.length) {
      _projects[index] = updatedProject;
      notifyListeners();
    }
  }
}
