import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peminjam_perpustakaan_kelas_c/app/routes/app_pages.dart';
import 'package:standard_searchbar/new/standard_search_anchor.dart';
import 'package:standard_searchbar/new/standard_search_bar.dart';
import 'package:standard_searchbar/new/standard_suggestion.dart';
import 'package:standard_searchbar/new/standard_suggestions.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 10,
              ),
              Container(
                child: IconButton(
                  onPressed: () {
                    // Tambahkan logika untuk menangani ketika ikon profil diklik
                  },
                  icon: Icon(Icons.account_circle),
                  iconSize: 30,
                  color: Colors.black,
                ),
              ),
              SizedBox(width:280,),
              Container(
                    child: IconButton(
                      onPressed: () {
                        // Tambahkan logika untuk menangani ketika ikon bookmark diklik
                      },
                      icon: Icon(Icons.bookmark),
                      iconSize: 30,
                      color: Colors.black,
                    ),
                  ),
            ],
          ),
          SizedBox(
            height: 25,
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(25),
            ),
            margin: EdgeInsets.fromLTRB(10, 0, 10, 20),
            child: StandardSearchAnchor(
              searchBar: StandardSearchBar(
                bgColor: Colors.white,
                borderRadius: 25,
              ),
              suggestions: StandardSuggestions(
                suggestions: [
                  StandardSuggestion(
                    text: 'No search History',
                    icon: Icons.history,
                  )
                ],
              ),
            ),
          ),
          Container(
              padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
              child: Text(
                "Best Ever Book",
                style: TextStyle(
                    color: Color(0xFF000000),
                    fontWeight: FontWeight.w900,
                    fontFamily: 'avenir',
                    fontSize: 15),
              )),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Color(0xFFD9d9d9),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.20),
                  // Warna bayangan
                  spreadRadius: 2,
                  // Jarak penyebaran bayangan
                  blurRadius: 2,
                  // Tingkat keburaman bayangan
                  offset: Offset(0, 5), // Posisi bayangan, arah sumbu X dan Y
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.asset(
                'assets/banner.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
            child: Text(
              "Genre",
              style: TextStyle(
                  color: Color(0xFF000000),
                  fontWeight: FontWeight.w900,
                  fontFamily: 'avenir',
                  fontSize: 15),
            ),
          ),
          Column(
            children: [
              Container(
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(0.0),
                          color: Color(0xFFD9d9d9),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.20),
                              spreadRadius: 2,
                              blurRadius: 2,
                              offset: Offset(0, 5),
                            ),
                          ],
                        ),
                        child: GestureDetector(
                          onTap: () => Get.toNamed(Routes.DETAIL_BOOK),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(0.0),
                            child: Image.asset(
                              'assets/junglebook.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Color(0xFFD9d9d9),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.20),
                              spreadRadius: 2,
                              blurRadius: 2,
                              offset: Offset(0, 5),
                            ),
                          ],
                        ),
                        child: GestureDetector(
                          onTap: () => Get.toNamed(Routes.DETAIL_BOOK),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(0.0),
                            child: Image.asset(
                              'assets/junglebook.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Color(0xFFD9d9d9),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.20),
                              spreadRadius: 2,
                              blurRadius: 2,
                              offset: Offset(0, 5),
                            ),
                          ],
                        ),
                        child: GestureDetector(
                          onTap: () => Get.toNamed(Routes.DETAIL_BOOK),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(0.0),
                            child: Image.asset(
                              'assets/junglebook.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )

        ],
      ),
    );
  }
}
