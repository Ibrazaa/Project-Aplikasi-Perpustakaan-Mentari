import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/provider/storage_provider.dart';
import '../../../routes/app_pages.dart';
import '../controllers/profil_controller.dart';

class ProfilView extends GetView<ProfilController> {
  const ProfilView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Colors.white,
      child: ListView(
        children: [
          Container(
            // margin : EdgeInsets.fromLTRB(0, 100, 0, 0),
            padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(80)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Text(
                    "Edit Profile",
                    style: TextStyle(
                      color: Color(0xFF000000),
                      fontWeight: FontWeight.w900,
                      fontFamily: 'avenir',
                      fontSize: 20,
                    ),
                  ),
                ),
                Center(
                  child: ClipOval(
                    child: Image.asset(
                      'assets/mentari.png',
                      height: 100,
                      width: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  child: Center(
                    child: Container(
                        margin : EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: Text(StorageProvider.read(StorageKey.name), style: TextStyle(color: Colors.black, fontSize: 20),)
                    ),
                  ),
                ),
                Container(
                  child: Center(
                    child: Container(
                        margin : EdgeInsets.fromLTRB(0, 5, 0, 10),
                        child: Text(StorageProvider.read(StorageKey.role), style: TextStyle(color: Colors.black, fontSize: 15),)
                    ),
                  ),
                ),
              ],
            ),
          ),
          Visibility(
            visible: StorageProvider.read(StorageKey.role) == "PEMINJAM" ||
           StorageProvider.read(StorageKey.role) == "PETUGAS",
            child: Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      textStyle: TextStyle(fontSize: 10),
                      backgroundColor: Color(0xFFFFFFFF),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 0 * 1.5, vertical: 10),
                    ),
                    onPressed: () {
                      Get.toNamed(Routes.PEMINJAMAN);
                    },
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 30),
                          child: Text(
                            "Peminjaman",
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(right: 30),
                          child: Icon(
                            Icons.book_rounded,
                            color: Colors.black,
                            size: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Visibility(
            visible: StorageProvider.read(StorageKey.role) == "PEMINJAM" ||
                StorageProvider.read(StorageKey.role) == "PETUGAS",
            child: Container(
              margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      textStyle: TextStyle(fontSize: 10),
                      backgroundColor: Color(0xFFFFFFFF),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 0 * 1.5, vertical: 10),
                    ),
                    onPressed: () {
                      Get.toNamed(Routes.BOOK);
                    },
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 30),
                          child: Text(
                            "Buku",
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(right: 30),
                          child: Icon(
                            Icons.add_box_sharp,
                            color: Colors.black,
                            size: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
              margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      textStyle: TextStyle(fontSize: 10),
                      backgroundColor: Color(0xFFFFFFFF),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 0 * 1.5, vertical: 10),
                    ),
                    onPressed: () {
                      Get.toNamed(Routes.CHANGE_PASSWORD);
                    },
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 30),
                          child: Text(
                            "Change Password",
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(right: 30),
                          child: Icon(
                            Icons.book_rounded,
                            color: Colors.black,
                            size: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    textStyle: TextStyle(fontSize: 10),
                    backgroundColor: Color(0xFFFFFFFF),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 0 * 1.5, vertical: 10),
                  ),
                  onPressed: () {
                    StorageProvider.write(StorageKey.status, "");
                    Get.snackbar("SUCCESS", "Berhasil Logout!",
                        backgroundColor: Colors.blue);
                    Get.toNamed(Routes.LOGIN);
                  },
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: Text(
                          "Logout",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(right: 30),
                        child: Icon(
                          Icons.logout,
                          color: Colors.black,
                          size: 15,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }
}
