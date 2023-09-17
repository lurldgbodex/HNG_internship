import '../models/work_experience.dart';
import '../models/certification.dart';
import '../models/profile.dart';
import '../models/language.dart';
import '../models/education.dart';
import '../models/skill.dart';
import '../models/project.dart';

class Resume {
  final Profile profile;
  final List<Skill> skills;
  final List<Language> languages;
  final List<Education> education;
  final List<Project> projects;
  final List<Certification> certifications;
  final List<WorkExperience> xperience;

  Resume({
    required this.profile,
    required this.skills,
    required this.languages,
    required this.education,
    required this.projects,
    required this.certifications,
    required this.xperience,
  });
}
