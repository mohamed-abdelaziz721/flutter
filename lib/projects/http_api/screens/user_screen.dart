import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sprints_naid_flutter/projects/http_api/model/user.dart';
import 'package:sprints_naid_flutter/projects/http_api/services/user_service.dart';
import 'package:sprints_naid_flutter/projects/page_navigation/widgets/appbar_widget.dart';
import 'package:animated_theme_switcher/animated_theme_switcher.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  List<User> userList = [];
  bool isLoading = true;

  getUserList() async {
    userList = await UserService().getUser();
    isLoading = false;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getUserList();
  }

  void userDetails(index) async{
    User instance = userList[index];
    await getUserList();
    Navigator.pop(context, {
      'Name':instance.name,
      'Email':instance.email,
      'City':instance.address.city,
      'Company':instance.company.name,
    }
    );

  }

  @override
  Widget build(BuildContext context) {
    return ThemeSwitchingArea(
      child: Builder(
        builder: (context) => Scaffold(
            appBar: buildAppBar(context),
            body: isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    itemCount: userList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        child: ListTile(
                            onTap: () {
                              userDetails(index);
                            },
                            title: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("${userList[index].name}")),
                            trailing: const Icon(Icons.people)),
                      );
                    },
                  )),
      ),
    );
  }
}
