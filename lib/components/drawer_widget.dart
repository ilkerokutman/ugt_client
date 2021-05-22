import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ugt_client/components/ugt_menu_item.dart';
import 'package:ugt_client/components/ugt_menu_label.dart';
import 'package:ugt_client/helpers/box.dart';
import 'package:ugt_client/models/auth.dart';

class UgtDrawer extends StatelessWidget {
  final Auth auth = Box.readAuth();

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
                          "${auth.fullName}",
                          style: Theme.of(context).textTheme.bodyText2.copyWith(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                        ),
                        subtitle: Text(
                          "${auth.isLecturer() ? auth.lecturer.title : auth.student.studentNumber}",
                          style: Theme.of(context).textTheme.bodyText2.copyWith(
                                fontSize: 18,
                                color: Colors.white70,
                              ),
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
            auth.isAdmin()
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: _adminMenu(),
                  )
                : auth.isLecturer()
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
      UgtMenuItemWidget(title: "Ana Sayfa", url: "/home"),
      UgtMenuLabelWidget(title: "Bana Özel"),
      UgtMenuItemWidget(
        title: "Derslerim",
        url: "/my-lectures",
        icon: Icons.my_library_books,
      ),
      UgtMenuItemWidget(
        title: "Öğrencilerim",
        url: "/my-students",
        icon: FontAwesomeIcons.userGraduate,
      ),
      UgtMenuLabelWidget(title: "Bölüme Özel"),
      UgtMenuItemWidget(
        title: "Dersler",
        url: "/classes",
        icon: FontAwesomeIcons.userGraduate,
      ),
      UgtMenuItemWidget(
        title: "Öğr.Görevlileri",
        url: "/lecturers",
      ),
      UgtMenuItemWidget(title: "Öğrenciler", url: "/students"),
      UgtMenuItemWidget(
        title: "Görevler",
        url: "/tasks",
      ),
      UgtMenuItemWidget(
        title: "Görev Havuzu",
        url: "/task-pool",
      ),
      UgtMenuLabelWidget(title: "Tanımlamalar"),
      UgtMenuItemWidget(
        title: "Öğr.Görevlileri",
        url: "/manage-lecturers",
      ),
      UgtMenuItemWidget(
        title: "Yöneticiler",
        url: "/manage-admins",
      ),
      UgtMenuItemWidget(
        title: "Fakülteler",
        url: "/manage-faculties",
      ),
      UgtMenuItemWidget(
        title: "Departmanlar",
        url: "/manage-departments",
      ),
      UgtMenuItemWidget(
        title: "Programlar",
        url: "/manage-programs",
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
        title: "item 1",
        url: "ignoring",
      ),
      UgtMenuItemWidget(
        title: "item 2",
        url: "ignoring",
      ),
    ];
  }
}