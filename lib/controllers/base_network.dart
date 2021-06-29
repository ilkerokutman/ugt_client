import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ugt_client/models/assignment.dart';
import 'package:ugt_client/models/assignment_detail.dart';
import 'package:ugt_client/models/db_entity.dart';
import 'package:ugt_client/models/department.dart';
import 'package:ugt_client/models/faculty.dart';
import 'package:ugt_client/models/lecture.dart';
import 'package:ugt_client/models/lecturer.dart';
import 'package:ugt_client/models/program_and_division.dart';
import 'package:ugt_client/models/student.dart';
import 'package:ugt_client/models/student_detail.dart';
import 'package:ugt_client/models/students_of_assignments.dart';
import 'package:ugt_client/pages/students_of_task_page.dart';
import '../helpers/box.dart';
import '../models/credentials.dart';
import '../models/auth.dart';
import '../settings/constants.dart' as c;

class UgtBaseNetwork {
  static final String baseUrl = "https://t07.performans.com/uludag/api/";

  //#region FUNCTIONS
  static Map<String, dynamic> _processResponse(Response response) {
    try {
      switch (response.statusCode) {
        case 200:
          if (response.data["success"]) {
            switch (response.data["statusCode"]) {
              case 200:
                if (response.data["data"] != null) {
                  return response.data;
                } else {
                  return {"success": true, "statusCode": response.data["statusCode"]};
                }
              default:
                return {"success": false, "statusCode": response.data["statusCode"]};
            }
          } else {
            return {"success": false, "statusCode": response.data["statusCode"]};
          }
        default:
          return {"success": false, "statusCode": response.statusCode};
      }
    } catch (exception) {
      return {"success": false, "message": exception.toString()};
    }
  }

  static Future<Dio> _getDio() async {
    Dio dio = Dio();
    dio.options.headers["Access-Control-Allow-Origin"] = "*";
    dio.options.headers["Access-Control-Allow-Credentials"] = true;
    dio.options.headers["Access-Control-Allow-Headers"] =
        "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale";
    dio.options.headers["Access-Control-Allow-Methods"] = "GET, HEAD, POST, OPTIONS";
    dio.options.contentType = "application/json";
    dio.options.followRedirects = false;
    return dio;
  }

  static Future<Dio> _getDioWithToken() async {
    String _token = Box.readToken();
    print("using Token: $_token");
    Dio _dio = await _getDio();
    _dio.options.headers["Authorization"] = "Bearer $_token";
    return _dio;
  }

  static Future<Map<String, dynamic>> _get(String partUrl) async {
    final fullUrl = "$baseUrl$partUrl";
    try {
      var _dio = await _getDio();
      final response = await _dio.get(fullUrl);
      return _processResponse(response);
    } catch (exception) {
      return {"success": false, "message": exception.toString()};
    }
  }

  static Future<Map<String, dynamic>> _getWithToken(String partUrl) async {
    final fullUrl = "$baseUrl$partUrl";
    try {
      var _dio = await _getDioWithToken();
      final response = await _dio.get(fullUrl);
      return _processResponse(response);
    } catch (exception) {
      return {"success": false, "message": exception.toString()};
    }
  }

  static Future<Map<String, dynamic>> _post(String partUrl, Map<String, dynamic> data) async {
    final fullUrl = "$baseUrl$partUrl";
    try {
      var _dio = await _getDio();
      final response = await _dio.post(fullUrl, data: data);
      return _processResponse(response);
    } on DioError catch (error) {
      return {"success": false, "message": error.toString()};
    }
  }

  static Future<Map<String, dynamic>> _postWithToken(String partUrl, Map<String, dynamic> data) async {
    final fullUrl = "$baseUrl$partUrl";
    try {
      var _dio = await _getDioWithToken();
      //TODO: remove printLog below
      print("POST: $fullUrl ${json.encode(data)}");
      final response = await _dio.post(fullUrl, data: data);
      return _processResponse(response);
    } catch (exception) {
      return {"success": false, "message": exception.toString()};
    }
  }

  //#endregion

  //#region USER
  static Future<Auth?> userSignin(Credentials credentials) async {
    Map<String, dynamic> data = {
      "email": credentials.username,
      "password": credentials.password,
    };
    var response = await _post(c.URL_USER_SIGNIN, data);
    if (response["success"] == false) return null;
    var auth = Auth.fromMap(response["data"]);
    if (auth.accessToken != null) {
      await Box.writeCredentials(credentials);
      await Box.writeToken(auth.accessToken ?? "");

      if ((auth.role == "LEC" || auth.role == "ADM") && auth.profileId != null) {
        var lecturer = await getLecturer(auth.profileId ?? "");
        auth.lecturer = lecturer;
      }

      await Box.writeAuth(auth);
    }
    return auth;
  }
  //#endregion

  //#region LECTURER
  static Future<List<Lecturer>> getLecturers() async {
    var response = await _postWithToken(c.URL_LECTURER_LIST, {});
    if (response["data"] != null && response["data"] is List && response["data"].length > 0) {
      var list = List<Lecturer>.from(response["data"].map((x) => Lecturer.fromMap(x)));
      return list;
    }
    return <Lecturer>[];
  }

  static Future<Lecturer?> getLecturer(String id) async {
    Map<String, dynamic> data = {"id": id};
    var response = await _postWithToken(c.URL_LECTURER_GET, data);
    if (response["success"] == false) return null;
    if (response["data"] is List && response["data"].length > 0) {
      var lecturer = Lecturer.fromMap(response["data"][0]);
      return lecturer;
    }
    var lecturer = Lecturer.fromMap(response["data"]);
    return lecturer;
  }

  static Future<Lecturer?> getLecturerByUserId(String id) async {
    Map<String, dynamic> data = {"id": id};
    var response = await _postWithToken(c.URL_LECTURER_GET_BY_USER, data);
    if (response["success"] == false) return null;
    var lecturer = Lecturer.fromMap(response["data"]);
    return lecturer;
  }

  static Future<Lecturer?> saveLecturer(Map<String, dynamic> data) async {
    var response = await _postWithToken(c.URL_LECTURER_SAVE, data);
    if (response["data"] != null) {
      var data = Lecturer.fromMap(response["data"][0]);
      return data;
    }
    return null;
  }
  //#endregion

  //#region STUDENT
  static Future<StudentDetail> getStudentDetail(String id) async {
    StudentDetail? detail = StudentDetail();
    // var student = await getStudent(id);
    var lectures = await getLecturesOfStudent(id);
    var tasks = await getAssignmentsOfStudent(id);
    // detail.student = student;
    detail.lectures = lectures;
    detail.assingments = tasks;
    return detail;
  }

  static Future<List<Student>> getStudents() async {
    var response = await _postWithToken(c.URL_STUDENT_LIST, {});
    if (response["data"] != null && response["data"] is List && response["data"].length > 0) {
      var list = List<Student>.from(response["data"].map((x) => Student.fromMap(x)));
      return list;
    }
    return <Student>[];
  }

  static Future<Student?> getStudent(String id) async {
    Map<String, dynamic> data = {"id": id};
    var response = await _postWithToken(c.URL_STUDENT_GET, data);
    if (response["success"] == false) return null;
    if (response["data"] is List && response["data"].length > 0) {
      var student = Student.fromMap(response["data"][0]);
      return student;
    }
    var student = Student.fromMap(response["data"]);
    return student;
  }

  static Future<Student?> getStudentByUserId(String id) async {
    Map<String, dynamic> data = {"id": id};
    var response = await _postWithToken(c.URL_STUDENT_GET_BY_USER, data);
    if (response["success"] == false) return null;
    var student = Student.fromMap(response["data"]);
    return student;
  }

  static Future<Student?> saveStudent(Map<String, dynamic> data) async {
    var response = await _postWithToken(c.URL_STUDENT_SAVE, data);
    if (response["data"] != null) {
      var data = Student.fromMap(response["data"][0]);
      return data;
    }
    return null;
  }

  //#endregion

  //#region LECTURE
  static Future<List<Lecture>> getLectures() async {
    var response = await _postWithToken(c.URL_LECTURE_LIST, {});
    if (response["success"] == false) return <Lecture>[];
    if (response["data"] != null && response["data"] is List && response["data"].length > 0) {
      var list = List<Lecture>.from(response["data"].map((x) => Lecture.fromMap(x)));
      return list;
    }
    return <Lecture>[];
  }

  static Future<List<Lecture>> getLecturesOfStudent(String id) async {
    var response = await _postWithToken(c.URL_LECTURE_LIST, {"studentId": id});
    if (response["success"] == false) return <Lecture>[];
    if (response["data"] != null && response["data"] is List && response["data"].length > 0) {
      var list = List<Lecture>.from(response["data"].map((x) => Lecture.fromMap(x)));
      return list;
    }
    return <Lecture>[];
  }

  static Future<Lecture?> getLecture(String id) async {
    Map<String, dynamic> data = {"id": id};
    var response = await _postWithToken(c.URL_LECTURE_GET, data);
    if (response["success"] == false) return null;
    if (response["data"] is List && response["data"].length > 0) {
      var lecture = Lecture.fromMap(response["data"][0]);
      return lecture;
    }
    var lecture = Lecture.fromMap(response["data"]);
    return lecture;
  }

  static Future<Lecture?> saveLecture(Map<String, dynamic> data) async {
    var response = await _postWithToken(c.URL_LECTURE_SAVE, data);
    if (response["data"] != null) {
      var data = Lecture.fromMap(response["data"][0]);
      return data;
    }
    return null;
  }
  //#endregion

  //#region ASSIGNMENT
  static Future<AssignmentDetail> getStudentOfAssignments(String id) async {
    AssignmentDetail _assignmentDetail = AssignmentDetail();
    var assignment = await getAssignment(id);
    _assignmentDetail.assignment = assignment;
    var response = await _postWithToken(c.URL_STUDENT_OF_ASSIGNMENT, {"id": id});
    if (response["success"] == false) return _assignmentDetail;
    if (response["data"] != null && response["data"] is List && response["data"].length > 0) {
      var list = List<StudentsOfAssignments>.from(response["data"].map((x) => StudentsOfAssignments.fromMap(x)));
      _assignmentDetail.students = list;
    }
    return _assignmentDetail;
  }

  static Future<List<Assignment>> getAssignments({int isPool = 0}) async {
    var response = await _postWithToken(c.URL_ASSIGNMENT_LIST, {"isPool": isPool});
    if (response["success"] == false) return <Assignment>[];
    if (response["data"] != null && response["data"] is List && response["data"].length > 0) {
      var list = List<Assignment>.from(response["data"].map((x) => Assignment.fromMap(x)));
      return list;
    }
    return <Assignment>[];
  }

  static Future<List<Assignment>> getAssignmentsOfStudent(String id) async {
    var response = await _postWithToken(c.URL_ASSIGNMENTS_OF_STUDENT, {"id": id});
    if (response["success"] == false) return <Assignment>[];
    if (response["data"] != null && response["data"] is List && response["data"].length > 0) {
      var list = List<Assignment>.from(response["data"].map((x) => Assignment.fromMap(x)));
      return list;
    }
    return <Assignment>[];
  }

  static Future<Assignment?> getAssignment(String id) async {
    Map<String, dynamic> data = {"id": id};
    var response = await _postWithToken(c.URL_ASSIGNMENT_LIST, data);
    if (response["success"] == false) return null;
    if (response["data"] is List && response["data"].length > 0) {
      var item = Assignment.fromMap(response["data"][0]);
      return item;
    }
    var item = Assignment.fromMap(response["data"]);
    return item;
  }

  static Future<String?> copyAssignment(String id) async {
    var response = await _postWithToken(c.URL_ASSIGNMENT_COPY, {"id": id});
    String s = response["data"].toString();
    String r = s.replaceAll("{", "").replaceAll("}", "").replaceAll("id: ", "");
    return r;
  }

  static Future<Assignment?> saveAssignment(Map<String, dynamic> data) async {
    var response = await _postWithToken(c.URL_ASSIGNMENT_SAVE, data);
    if (response["data"] != null) {
      var data = Assignment.fromMap(response["data"][0]);
      return data;
    }
    return null;
  }
  //#endregion

  //#region FACULTY
  static Future<List<Faculty>> listFaculties() async {
    var response = await _postWithToken(c.URL_FACULTY_LIST, {});
    if (response["data"] != null && response["data"] is List && response["data"].length > 0) {
      var list = List<Faculty>.from(response["data"].map((x) => Faculty.fromMap(x)));
      return list;
    }
    return <Faculty>[];
  }

  static Future<Faculty?> getFaculty(String id) async {
    var response = await _postWithToken(c.URL_FACULTY_GET, {"id": id});
    if (response["data"] != null) {
      var faculty = Faculty.fromMap(response["data"][0]);
      return faculty;
    }
    return null;
  }

  static Future<void> deleteFaculty(String id) async {
    await _postWithToken(c.URL_FACULTY_DELETE, {"id": id});
  }

  static Future<Faculty?> saveFaculty(Faculty faculty) async {
    print("saving faculty: ${faculty.toMap().toString()}");
    var response = await _postWithToken(c.URL_FACULTY_SAVE, faculty.toMap());
    if (response["data"] != null) {
      var faculty = Faculty.fromMap(response["data"][0]);
      return faculty;
    }
    return null;
  }
  //#endregion

  //#region DEPARTMENT
  static Future<List<Department>> listDepartments() async {
    var response = await _postWithToken(c.URL_DEPARTMENT_LIST, {});
    if (response["data"] != null && response["data"] is List && response["data"].length > 0) {
      var list = List<Department>.from(response["data"].map((x) => Department.fromMap(x)));
      return list;
    }
    return <Department>[];
  }

  static Future<Department?> getDepartment(String id) async {
    var response = await _postWithToken(c.URL_DEPARTMENT_GET, {"id": id});
    if (response["data"] != null) {
      var department = Department.fromMap(response["data"][0]);
      return department;
    }
    return null;
  }

  static Future<Faculty?> saveDepartment(Faculty d) async {
    print("saving faculty: ${d.toMap().toString()}");
    var response = await _postWithToken(c.URL_DEPARTMENT_SAVE, d.toMap());
    if (response["data"] != null) {
      var department = Faculty.fromMap(response["data"][0]);
      return department;
    }
    return null;
  }
  //#endregion

  //#region PROGRAMS AND DIVISIONS
  static Future<List<ProgramAndDivision>> listPrograms() async {
    var response = await _postWithToken(c.URL_DAP_LIST, {});
    if (response["data"] != null && response["data"] is List && response["data"].length > 0) {
      var list = List<ProgramAndDivision>.from(response["data"].map((x) => ProgramAndDivision.fromMap(x)));
      return list;
    }
    return <ProgramAndDivision>[];
  }

  static Future<ProgramAndDivision?> getProgram(String id) async {
    var response = await _postWithToken(c.URL_DAP_GET, {"id": id});
    if (response["data"] != null) {
      var data = ProgramAndDivision.fromMap(response["data"][0]);
      return data;
    }
    return null;
  }

  static Future<ProgramAndDivision?> saveProgram(Map<String, dynamic> data) async {
    var response = await _postWithToken(c.URL_DAP_SAVE, data);
    if (response["data"] != null) {
      var data = ProgramAndDivision.fromMap(response["data"][0]);
      return data;
    }
    return null;
  }

  //#endregion

  //#region DBENTITY
  static Future<List<DbEntity>> fetchDropdownItems({required String url, Map<String, dynamic>? data}) async {
    var response = await _postWithToken(url, data ?? {});
    if (response["data"] != null && response["data"] is List && response["data"].length > 0) {
      var list = List<DbEntity>.from(response["data"].map((x) => DbEntity.fromMap(x)));
      return list;
    }
    return <DbEntity>[];
  }
  //#endregion

  //#region GENERIC
  static Future<String> addGeneric({required String url, required Map<String, dynamic> data}) async {
    var response = await _postWithToken(url, data);
    String s = response["data"].toString();
    String r = s.replaceAll("{", "").replaceAll("}", "").replaceAll("id: ", "");
    return r;
  }

  static Future<void> deleteGeneric({required String url, required String id}) async {
    await _postWithToken(url, {"id": id});
  }
  //#endregion
}
