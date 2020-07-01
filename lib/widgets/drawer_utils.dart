import 'package:flutter/material.dart';
import 'package:xes1v1mobileweb/common/strings.dart';
import 'package:xes1v1mobileweb/common/text_styles.dart';

class DrawerUtils {
  static int _selectedIndex = 0;
  static String _selectMenu = Strings.menu_article;

  static Widget buildDrawer(BuildContext context, Function clickCallback) {
    return ListView(
      children: <Widget>[
        DrawerHeader(
          child: Container(
            child: RichText(
              text: TextSpan(
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.black,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: Strings.xueersi,
                    style: TextStyles.logo1,
                  ),
                  TextSpan(
                    text: Strings.onevone,
                    style: TextStyles.logo2,
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
            alignment: Alignment.center,
          ),
        ),
        ListTile(
            leading: Icon(
              Icons.library_books,
              color: Colors.red,
            ),
            title: Text(Strings.menu_article),
            trailing: Icon(
              Icons.chevron_right,
              color: Colors.red,
            ),
            onTap: () {
              Navigator.of(context).pop();
              if (clickCallback != null) {
                _selectedIndex = 0;
                _selectMenu = Strings.menu_article;
                clickCallback(_selectedIndex, _selectMenu);
              }
            }),
        ListTile(
          leading: Icon(
            Icons.build,
            color: Colors.red,
          ),
          title: Text(Strings.menu_frame),
          trailing: Icon(
            Icons.chevron_right,
            color: Colors.red,
          ),
          onTap: () {
            Navigator.of(context).pop();
            if (clickCallback != null) {
              _selectedIndex = 1;
              _selectMenu = Strings.menu_frame;
              clickCallback(_selectedIndex, _selectMenu);
            }
          },
        ),
        ListTile(
          leading: Icon(
            Icons.lightbulb_outline,
            color: Colors.red,
          ),
          title: Text(Strings.menu_course),
          trailing: Icon(
            Icons.chevron_right,
            color: Colors.red,
          ),
          onTap: () {
            Navigator.of(context).pop();
            if (clickCallback != null) {
              _selectedIndex = 2;
              _selectMenu = Strings.menu_course;
              clickCallback(_selectedIndex, _selectMenu);
            }
          },
        ),
        ListTile(
          leading: Icon(
            Icons.local_bar,
            color: Colors.red,
          ),
          title: Text(Strings.menu_honor),
          trailing: Icon(
            Icons.chevron_right,
            color: Colors.red,
          ),
          onTap: () {
            Navigator.of(context).pop();
            if (clickCallback != null) {
              _selectedIndex = 3;
              _selectMenu = Strings.menu_honor;
              clickCallback(_selectedIndex, _selectMenu);
            }
          },
        ),
        ListTile(
          leading: Icon(
            Icons.mail,
            color: Colors.red,
          ),
          title: Text(Strings.menu_about),
          trailing: Icon(
            Icons.chevron_right,
            color: Colors.red,
          ),
          onTap: () {
            Navigator.of(context).pop();
            if (clickCallback != null) {
              _selectedIndex = 4;
              _selectMenu = Strings.menu_about;
              clickCallback(_selectedIndex, _selectMenu);
            }
          },
        )
      ],
    );
  }
}
