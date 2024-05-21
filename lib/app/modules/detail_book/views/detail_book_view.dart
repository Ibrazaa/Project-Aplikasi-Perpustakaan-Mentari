import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/detail_book_controller.dart';
import '../../../routes/app_pages.dart';

class DetailBookView extends GetView<DetailBookController> {
  const DetailBookView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isThumbUpSelected = false;
    bool isThumbDownSelected = false;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_rounded),
          color: Color(0xff1BC0B6),
          onPressed: () {
            Get.back();
          },
        ),
      ),

        body: ListView(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Text(
                "Detail Buku",
                style: TextStyle(
                  color: Color(0xFF000000),
                  fontWeight: FontWeight.w900,
                  fontFamily: 'avenir',
                  fontSize: 20,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
              decoration: BoxDecoration(
                color: Color(0xFFD9d9d9),// Set gray background color
                borderRadius: BorderRadius.circular(10), // Optionally, add border radius
              ),
              child: Row(
                children: [
                  Image.asset(
                    "assets/junglebook.png",
                    height: 100,
                  ),
                  SizedBox(width: 80,),
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Judul",
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  "Genre",
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  "Penulis",
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  "Penerbit",
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  "Tahun Terbit",
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    ": Jungle Book",
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text(
                                    ": Fiksi",
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text(
                                    ": Ujang",
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text(
                                    ": Ceria Industri",
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text(
                                    ": 2000",
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.offAllNamed(Routes.PEMINJAMAN);
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                            decoration: BoxDecoration(
                              color: Color(0xff1BC0B6),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              "PINJAM",
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10,),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
              decoration: BoxDecoration(
                color: Color(0xFFD9d9d9),
                borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
              ),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                    child: Text(
                      'Deskrispi :',
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
                    child: Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 10
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                    child: Text(
                      'Ulasan',
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                              // color: Color(0xffcccccc),
                              child: Text(
                                'Tambahkan Ulasan',
                                style: TextStyle(
                                  fontSize: 8, // Ukuran font yang ditambahkan
                                ),
                              ),

                            ),
                          ],
                        ),
                        SizedBox(width: 220,),
                        Icon(Icons.send,size: 16, color: Color(0xff487856),)
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 100),
                    padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                    decoration: BoxDecoration(
                      color: Color(0xffa1a1a1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        // ClipOval(
                        //   child: Image.asset(
                        //     'assets/perpus.jpeg',
                        //     height: 50,
                        //     width: 50,
                        //     fit: BoxFit.cover,
                        //   ),
                        // ),
                        Container(
                          margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Chelkydo M. I.", style: TextStyle(fontSize: 12)),
                              Text("Bukunya Mantap!", style: TextStyle(fontSize: 9)),
                              Row(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      isThumbUpSelected = !isThumbUpSelected;
                                    },
                                    icon: Icon(
                                      isThumbUpSelected
                                          ? Icons.thumb_up_alt_sharp
                                          : Icons.thumb_up_off_alt_outlined,
                                      color: Color(0xff487856),
                                      size: 20,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      isThumbDownSelected = !isThumbDownSelected;
                                    },
                                    icon: Icon(
                                      isThumbDownSelected
                                          ? Icons.thumb_down_alt_sharp
                                          : Icons.thumb_down_off_alt_outlined,
                                      color: Color(0xff487856),
                                      size: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
    );
  }
}
