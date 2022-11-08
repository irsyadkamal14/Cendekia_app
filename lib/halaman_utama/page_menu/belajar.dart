import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:project_premmob/restApi/model_belajar.dart';
import 'package:project_premmob/restApi/repo_belajar.dart';

import '../../restApi/constants.dart';

class Belajar extends StatefulWidget {
  const Belajar({super.key});

  @override
  State<Belajar> createState() => _BelajarState();
}

class _BelajarState extends State<Belajar> {
  List<Tb_belajar> listTb_belajar = [];
  Repo_belajar repository = Repo_belajar();

  getData_Belajar() async {
    listTb_belajar = await repository.getData_Belajar();
    setState(() {});
  }

  @override
  void initState() {
    getData_Belajar();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final String font = 'Baloo 2';
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
          ),
          backgroundColor: Color.fromRGBO(1, 180, 220, 1),
          elevation: 3,
          title: Text(
            "Belajar",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 30.0,
              fontFamily: font,
            ),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(10),
            ),
          ),
        ),
      ),
      body: Container(
        //margin: EdgeInsets.only(right: 17, left: 17),
        child: ListView.separated(
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return Card(
                elevation: 5,
                // margin: EdgeInsets.only(
                //   right: kDefaultPadding,
                //   top: kDefaultPadding / 2,
                //   bottom: kDefaultPadding / 2,
                // ),
                shape: RoundedRectangleBorder(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(8.0),
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  child: Image.network(
                    "http://192.168.1.7/cendekia_app/belajar/${listTb_belajar[index].image}",
                    //listTb_belajar[index].image,
                    width: 250,
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return Divider();
            },
            itemCount: listTb_belajar.length),
      ),
    );
  }
}
