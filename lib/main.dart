import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ugt_client/pages/my_lecture_list_page.dart';
import 'package:ugt_client/pages/my_student_list_page.dart';
import 'package:ugt_client/pages/my_task_list_page.dart';
import 'package:ugt_client/pages/student_detail_page.dart';
import 'package:ugt_client/pages/students_of_task_page.dart';

import './settings/page_codes.dart' as p;
import './pages/splash_page.dart';
import './pages/signin_page.dart';
import './pages/home_page.dart';
import './pages/student_edit_page.dart';
import './pages/admin_add_page.dart';
import './pages/admin_edit_page.dart';
import './pages/admin_list_page.dart';
import './pages/admin_page.dart';
import './pages/lecture_add_page.dart';
import './pages/lecture_edit_page.dart';
import './pages/lecture_list_page.dart';
import './pages/lecture_page.dart';
import './pages/lecturer_add_page.dart';
import './pages/lecturer_edit_page.dart';
import './pages/lecturer_list_page.dart';
import './pages/lecturer_page.dart';
import './pages/my_profile_page.dart';
import './pages/student_add_page.dart';
import './pages/student_list_page.dart';
import './pages/student_page.dart';
import './pages/faculty_add_page.dart';
import './pages/faculty_edit_page.dart';
import './pages/faculty_list_page.dart';
import './pages/faculty_page.dart';
import './pages/task_add_page.dart';
import './pages/task_edit_page.dart';
import './pages/task_list_page.dart';
import './pages/task_page.dart';
import './pages/department_add_page.dart';
import './pages/department_edit_page.dart';
import './pages/department_list_page.dart';
import './pages/department_page.dart';
import './pages/program_add_page.dart';
import './pages/program_edit_page.dart';
import './pages/program_list_page.dart';
import './pages/program_page.dart';
import './pages/my_lectures_page.dart';
import './pages/my_students_page.dart';
import './pages/my_tasks_page.dart';
import './pages/our_Lecturers_page.dart';
import './pages/our_Lectures_page.dart';
import './pages/our_students_page.dart';

void main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(UGT());
}

class UGT extends StatefulWidget {
  @override
  _UGTState createState() => _UGTState();
}

class _UGTState extends State<UGT> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      themeMode: ThemeMode.system,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        // appBarTheme: AppBarTheme(systemOverlayStyle: SystemUiOverlayStyle.light)
      ),
      getPages: [
        GetPage(name: p.splash, page: () => SplashPage()),
        GetPage(name: p.signin, page: () => SigninPage()),
        GetPage(name: p.home, page: () => HomePage()),
        //
        GetPage(name: p.myProfile, page: () => MyProfilePage()),
        GetPage(name: p.myLectures, page: () => MyLectureListPage()),
        GetPage(name: p.myTasks, page: () => MyTaskListPage()),
        GetPage(name: p.myStudents, page: () => MyStudentListPage()),
        //
        GetPage(name: p.ourLecturers, page: () => OurLecturersPage()),
        GetPage(name: p.ourLectures, page: () => OurLecturesPage()),
        GetPage(name: p.ourStudents, page: () => OurStudentsPage()),
        //
        GetPage(name: p.lecture, page: () => LecturePage()),
        GetPage(name: p.lectures, page: () => LectureListPage()),
        GetPage(name: p.lectureNew, page: () => LectureAddPage()),
        GetPage(name: p.lectureEdit, page: () => LectureEditPage()),
        //
        GetPage(name: p.lecturers, page: () => LecturerListPage()),
        GetPage(name: p.lecturer, page: () => LecturerPage()),
        GetPage(name: p.lecturerAdd, page: () => LecturerAddPage()),
        GetPage(name: p.lecturerEdit, page: () => LecturerEditPage()),
        //
        GetPage(name: p.students, page: () => StudentListPage()),
        GetPage(name: p.student, page: () => StudentPage()),
        GetPage(name: p.studentAdd, page: () => StudentAddPage()),
        GetPage(name: p.studentEdit, page: () => StudentEditPage()),
        GetPage(name: p.studentDetail, page: () => StudentDetailPage()),
        //
        GetPage(name: p.taskPool, page: () => TaskListPage(isPool: 1)),
        GetPage(name: p.tasks, page: () => TaskListPage()),
        GetPage(name: p.task, page: () => TaskPage()),
        GetPage(name: p.taskAdd, page: () => TaskAddPage()),
        GetPage(name: p.taskEdit, page: () => TaskEditPage()),
        GetPage(name: p.taskDetail, page: () => StudentsOfTaskPage()),
        //
        GetPage(name: p.admins, page: () => ManageAdminListPage()),
        GetPage(name: p.admin, page: () => ManageAdminPage()),
        GetPage(name: p.adminAdd, page: () => ManageAdminAddPage()),
        GetPage(name: p.adminEdit, page: () => ManageAdminEditPage()),
        //
        GetPage(name: p.faculties, page: () => FacultyListPage()),
        GetPage(name: p.faculty, page: () => FacultyPage()),
        GetPage(name: p.facultyAdd, page: () => FacultyAddPage()),
        GetPage(name: p.facultyEdit, page: () => FacultyEditPage()),
        //
        GetPage(name: p.departments, page: () => DepartmentListPage()),
        GetPage(name: p.department, page: () => DepartmentPage()),
        GetPage(name: p.departmentAdd, page: () => DepartmentAddPage()),
        GetPage(name: p.departmentEdit, page: () => DepartmentEditPage()),
        //
        GetPage(name: p.programs, page: () => ProgramListPage()),
        GetPage(name: p.program, page: () => ProgramPage()),
        GetPage(name: p.programAdd, page: () => ProgramAddPage()),
        GetPage(name: p.programEdit, page: () => ProgramEditPage()),
      ],
      initialRoute: p.splash,
    );
  }
}

class LifecycleEventHandler extends WidgetsBindingObserver {
  final AsyncCallback resumeCallBack;
  final AsyncCallback suspendingCallBack;

  LifecycleEventHandler({
    required this.resumeCallBack,
    required this.suspendingCallBack,
  });

  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    switch (state) {
      case AppLifecycleState.resumed:
        if (resumeCallBack != null) {
          await resumeCallBack();
        }
        break;
      case AppLifecycleState.inactive:
      case AppLifecycleState.paused:
      case AppLifecycleState.detached:
        if (suspendingCallBack != null) {
          await suspendingCallBack();
        }
        break;
    }
  }
}
