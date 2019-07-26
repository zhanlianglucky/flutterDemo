import 'package:flutter/material.dart';
import 'package:flutter_demo/demo/home/HomePageWidget.dart';

void main() => runApp(MaterialApp(
      title: "login",
      home: LoginWidget(),
    ));

/// login
class LoginWidget extends StatefulWidget {
  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  String email, userName, password;
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  final mainKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: mainKey,
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: OverflowBox(
        //防止底部超过屏幕，造成overflow，还能让键盘把控件顶上去
        maxHeight: 500, //这个参数必须要加
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Form(
              key: formKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    autocorrect: false,
                    decoration: InputDecoration(
                      labelText: "Email:",
                    ),
                    validator: (str) => !str.contains("@") ? "请输入正确的邮箱！" : null,
                    // 如果正常的话必须返回 null
                    onSaved: (str) => email = str,
                  ),
                  TextFormField(
                    autocorrect: false,
                    decoration: InputDecoration(
                      labelText: "UserName:",
                    ),
                    validator: (str) => str.length == 0 ? "用户名不能为空！" : null,
                    onSaved: (str) => userName = str,
                  ),
                  TextFormField(
                    autocorrect: false,
                    decoration: InputDecoration(
                      labelText: "Password:",
                    ),
                    validator: (str) => str.length < 6 ? "请输入大于6位的密码！" : null,
                    onSaved: (str) => password = str,
                  ),
                  RaisedButton(
                    onPressed: () {
                      _onPressed();
                      print(
                          "email: $email ; userName: $userName ; password: $password");
                    },
                    child: Text("登录"),
                  ),
                ],
              )),
        ),
      ),
    );
  }

  _onPressed() {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();

//      var snackBar = SnackBar(
//        content: Text("email: $email ; userName: $userName ; password: $password"),
//        duration: Duration(seconds: 3),
//      );
//      mainKey.currentState.showSnackBar(snackBar);

      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => HomePageWidget()),
          (route) => route == null); //跳转并关闭当前页
    }
  }
}
