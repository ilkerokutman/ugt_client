import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:ugt_client/components/ugt_menu_item.dart';
import 'package:ugt_client/components/ugt_menu_label.dart';
import 'package:ugt_client/helpers/box.dart';
import 'package:ugt_client/models/auth.dart';
import '../settings/page_codes.dart' as p;

class UgtDrawer extends StatelessWidget {
  final Auth? auth = Box.readAuth();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 200,
              child: DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  image: DecorationImage(image: AssetImage("assets/images/nav_header_bg.png"), fit: BoxFit.cover),
                ),
                child: Container(
                  padding: const EdgeInsets.fromLTRB(8, 0, 8, 12),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        title: Text(
                          "${auth!.fullName}",
                          style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                        ),
                        subtitle: Text(
                          "${auth!.isLecturer() ? auth!.lecturer!.title : auth!.student!.studentNumber}",
                          style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                fontSize: 18,
                                color: Colors.white70,
                              ),
                        ),
                        trailing: IconButton(
                          icon: Icon(
                            Icons.edit,
                            color: Colors.white54,
                          ),
                          onPressed: () {
                            Get.toNamed(p.myProfile);
                          },
                        ),
                        leading: InkWell(
                          child: Stack(
                            children: [
                              CircleAvatar(
                                backgroundImage: AssetImage("assets/images/default_profile_pic.png"),
                              ),
                              //TODO: fetch pic here
                            ],
                          ),
                          onTap: () {
                            //TODO: take new pic here
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            auth!.isAdmin()
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: _adminMenu(),
                  )
                : auth!.isLecturer()
                    ? Column(
                        children: _lecturerMenu(),
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                      )
                    : Column(
                        children: _studentMenu(),
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                      ),
          ],
        ),
      ),
    );
  }

  List<Widget> _adminMenu() {
    return [
      UgtMenuItemWidget(title: "Ana Sayfa", url: p.home),
      UgtMenuLabelWidget(title: "Bana Özel"),
      UgtMenuItemWidget(
        title: "Derslerim",
        url: p.myLectures,
        // icon: Icons.my_library_books,
      ),
      UgtMenuItemWidget(
        title: "Öğrencilerim",
        url: p.myStudents,
        // icon: FontAwesomeIcons.userGraduate,
      ),
      UgtMenuLabelWidget(title: "Bölüme Özel"),
      UgtMenuItemWidget(
        title: "Bölüm Dersleri",
        url: p.ourLectures,
        // icon: FontAwesomeIcons.userGraduate,
      ),
      UgtMenuItemWidget(
        title: "Bölüm Öğr.Görevlileri",
        url: p.ourLecturers,
      ),
      UgtMenuItemWidget(
        title: "Bölüm Öğrencileri",
        url: p.ourStudents,
      ),
      UgtMenuItemWidget(
        title: "Görevler",
        url: p.tasks,
      ),
      UgtMenuItemWidget(
        title: "Görev Havuzu",
        url: p.taskPool,
      ),
      UgtMenuLabelWidget(title: "Tanımlamalar"),
      UgtMenuItemWidget(
        title: "Öğrenci Lıstesi",
        url: p.students,
      ),
      UgtMenuItemWidget(
        title: "Öğr.Görevlileri Listesi",
        url: p.lecturers,
      ),
      UgtMenuItemWidget(
        title: "Yöneticiler",
        url: p.admins,
      ),
      UgtMenuItemWidget(
        title: "Fakülteler",
        url: p.faculties,
      ),
      UgtMenuItemWidget(
        title: "Departmanlar",
        url: p.departments,
      ),
      UgtMenuItemWidget(
        title: "Programlar",
        url: p.programs,
      ),
    ];
  }

  List<Widget> _lecturerMenu() {
    return [
      UgtMenuItemWidget(
        title: "item 1",
        url: "ignoring",
      ),
    ];
  }

  List<Widget> _studentMenu() {
    return [
      UgtMenuItemWidget(
        title: "Derslerim",
        url: "ignoring",
      ),
      UgtMenuItemWidget(
        title: "Görevlerim",
        url: "ignoring",
      ),
      UgtMenuItemWidget(
        title: "Bulunduğum Gruplar",
        url: "ignoring",
      ),
    ];
  }
}
