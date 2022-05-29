import 'package:flutter/material.dart';
import 'package:shoppingmall/utility/my_constant.dart';
import 'package:shoppingmall/widgets/show_image.dart';
import 'package:shoppingmall/widgets/show_title.dart';

class Authen extends StatefulWidget {
  Authen({Key? key}) : super(key: key);

  @override
  State<Authen> createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  //ประกาศค่าตัวแปรเพื่อให้เห็นPassword
  bool statusRedEye = true;
  @override
  Widget build(BuildContext context) {
    //สร้างตัวแปรเพื่อกำหนดขนาดรูปภาพ
    double size = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        //การโฟกัสคีบอร์ดเมื่อคลิกที่อื่นคีบอร์ดจะหายไป
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(
            FocusNode(),
          ),
          behavior: HitTestBehavior.opaque,
          //คีบอร์ดหาย
          child: ListView(
            children: [
              buildImage(size),
              buildAppname(),
              buildUser(size),
              buildPassword(size),
              //การสร้างปุ่มElevate Button
              buildLogin(size),
              //การสร้างตัวอักษร
              buildCreateAccount(),
            ],
          ),
        ),
      ),
    );
  }

  //ตัวอักษร
  Row buildCreateAccount() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ShowTitle(
          title: 'Non Account ?',
          textStyle: MyConstant().h3Style(),
        ),
        //สร้างTextButton
        TextButton(
          //เมื่อเมาส์คลิกที่ Create Account จะเปิดหน้า create_account
          onPressed: () =>
              Navigator.pushNamed(context, MyConstant.routeCreateAccount),
          child: const Text('Create Account'),
        ),
      ],
    );
  }

  //สร้างปุ่มLogin
  Row buildLogin(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 16),
          width: size * 0.6,
          child: ElevatedButton(
            style: MyConstant().myButtonStyle(),
            onPressed: () {},
            child: Text('Login'),
          ),
        ),
      ],
    );
  }

  //ฟิลด์User
  Row buildUser(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 10),
          width: size * 0.6,
          child: TextFormField(
            decoration: InputDecoration(
              labelStyle: MyConstant().h3Style(),
              labelText: 'User :',
              prefixIcon: Icon(
                Icons.account_circle_outlined,
                color: MyConstant.dark,
              ),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: MyConstant.dark),
                  borderRadius: BorderRadius.circular(30)),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyConstant.light),
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
        ),
      ],
    );
  }

  //ฟิลด์Password
  Row buildPassword(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 10),
          width: size * 0.6,
          child: TextFormField(
            //แสดงค่าpassword
            obscureText: statusRedEye,
            decoration: InputDecoration(
              //เงื่อนไขในกรณีให้แสดงตัวอักษรรหัสผ่าน
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    statusRedEye = !statusRedEye;
                  });
                },
                icon: statusRedEye
                    ? Icon(
                        Icons.remove_red_eye,
                        color: MyConstant.dark,
                      )
                    : Icon(
                        Icons.remove_red_eye_outlined,
                        color: MyConstant.dark,
                      ),
              ),
              labelStyle: MyConstant().h3Style(),
              labelText: 'Password :',
              prefixIcon: Icon(
                Icons.lock_clock_outlined,
                color: MyConstant.dark,
              ),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: MyConstant.dark),
                  borderRadius: BorderRadius.circular(30)),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyConstant.light),
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
        ),
      ],
    );
  }

  //แสดงTitle(ชื่อแอพ)
  Row buildAppname() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ShowTitle(
          title: MyConstant.appName,
          textStyle: MyConstant().h1Style(),
        ),
      ],
    );
  }

  //แสดงภาพแอพ
  Row buildImage(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: size * 0.6,
          child: ShowImage(pathImage: MyConstant.image4),
        ),
      ],
    );
  }
}
