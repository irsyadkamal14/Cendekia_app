import 'package:flutter/material.dart';

class AccountCheck extends StatelessWidget {
  final bool login;
  final Function? press;
  const AccountCheck({
    Key? key,
    this.login = true,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          login ? "Belum memiliki akun ? " : "Sudah Memiliki Akun ? ",
          style: TextStyle(
            fontFamily: "Baloo 2",
            fontSize: 15,
          ),
        ),
        GestureDetector(
          onTap: press as void Function()?,
          child: Text(
            login ? "Daftar" : "Masuk",
            style: const TextStyle(
              color: Color.fromRGBO(1, 180, 220, 1),
              fontFamily: "Baloo 2",
              fontSize: 15,
            ),
          ),
        )
      ],
    );
  }
}
