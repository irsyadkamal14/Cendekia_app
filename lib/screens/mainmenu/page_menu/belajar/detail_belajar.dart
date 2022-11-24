import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'belajar_model.dart';

class DetailBelajar extends StatefulWidget {
  final List list;
  final int index;
  const DetailBelajar({required this.index, required this.list});

  @override
  State<DetailBelajar> createState() => _DetailBelajarState();
}

class _DetailBelajarState extends State<DetailBelajar> {
  late YoutubePlayerController _controller;
  final vidioURL = 'https://youtu.be/YMx8Bbev6T4';

  @override
  Widget build(BuildContext context) {
    bool _like = false;
    final font = 'Baloo 2';
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: FirebaseFirestore.instance.collection('belajar').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var belajar = snapshot.data!.docs
                .map((e) => Belajar.fromSnapshot(e))
                .toList();
            final vidioID =
                YoutubePlayer.convertUrlToId(belajar[widget.index].yt);
            _controller = YoutubePlayerController(
                initialVideoId: vidioID!,
                flags: const YoutubePlayerFlags(autoPlay: false));
            return Scaffold(
              body: SingleChildScrollView(
                child: Container(
                  width: width,
                  child: Stack(
                    children: <Widget>[
                      Container(
                        height: height * 0.30,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/images/python.png'),
                                fit: BoxFit.cover)),
                        child: Container(
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [
                                Colors.black.withOpacity(0.9),
                                Colors.black.withOpacity(0.5),
                                Colors.black.withOpacity(0.0),
                                Colors.black.withOpacity(0.0),
                                Colors.black.withOpacity(0.5),
                                Colors.black.withOpacity(0.9),
                              ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight)),
                        ),
                      ),
                      Container(
                        width: width,
                        //margin: EdgeInsets.only(top: height * 0.5),
                        margin: EdgeInsets.only(top: 230),
                        padding: EdgeInsets.all(30),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30)),
                        ),
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                child: Text(
                                  belajar[widget.index].title,
                                  //textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontFamily: font,
                                      fontSize: 28,
                                      fontWeight: FontWeight.w800),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(bottom: 10),
                                child: Row(
                                  children: [
                                    Container(
                                      child: Row(
                                        children: [
                                          Container(
                                            child: Icon(
                                              Icons.access_time,
                                              size: 15,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            'Nov 22 2022',
                                            style: TextStyle(
                                                fontFamily: font, fontSize: 12),
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Container(
                                      child: Row(
                                        children: [
                                          Container(
                                            child: Icon(
                                              Icons.person_outline,
                                              size: 15,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            belajar[widget.index].author,
                                            style: TextStyle(
                                                fontFamily: font, fontSize: 12),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              YoutubePlayer(
                                controller: _controller,
                                showVideoProgressIndicator: true,
                                onReady: () => debugPrint('Ready'),
                                bottomActions: [
                                  CurrentPosition(),
                                  ProgressBar(
                                    isExpanded: true,
                                    colors: const ProgressBarColors(
                                        playedColor: Colors.white,
                                        handleColor: Colors.white),
                                  )
                                ],
                              ),
                              // Row(
                              //   children: [
                              //     Container(
                              //       margin: EdgeInsets.only(
                              //           right: 15, top: 10, left: 15),
                              //       child: Text(
                              //         belajar[widget.index].title,
                              //         style: TextStyle(
                              //           fontFamily: font,
                              //           fontSize: 18,
                              //           fontWeight: FontWeight.w600,
                              //         ),
                              //       ),
                              //     ),
                              //   ],
                              // ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                child: Text(
                                  belajar[widget.index].text,
                                  textAlign: TextAlign.justify,
                                  style:
                                      TextStyle(fontFamily: font, fontSize: 15),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),

                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[],
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      // Positioned(
                      //   left: 30,
                      //   top: height * 0.02,
                      //   child: GestureDetector(
                      //     onTap: () {
                      //       Navigator.pop(context);
                      //     },
                      //     child: Icon(
                      //       Icons.backspace_outlined,
                      //       size: 30,
                      //       color: Colors.white,
                      //     ),
                      //   ),
                      // ),
                      // Positioned(
                      //   right: 30,
                      //   top: 10,
                      //   child: GestureDetector(
                      //     // onTap: () {
                      //     //   setState(() {
                      //     //     _like = !_like;
                      //     //   });
                      //     // },
                      //     child: Container(
                      //       height: 70,
                      //       width: 70,
                      //       decoration: BoxDecoration(
                      //           color: Colors.white,
                      //           borderRadius: BorderRadius.circular(35),
                      //           boxShadow: [
                      //             BoxShadow(
                      //                 color: Colors.black.withOpacity(0.5),
                      //                 blurRadius: 5,
                      //                 spreadRadius: 1)
                      //           ]),
                      //       child: Icon(
                      //         Icons.favorite,
                      //         size: 45,
                      //         color: (_like) ? Colors.red : Colors.grey[600],
                      //       ),
                      //     ),
                      //   ),
                      // )
                    ],
                  ),
                ),
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
  }
}
