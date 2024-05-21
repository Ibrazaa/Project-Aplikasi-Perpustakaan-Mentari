import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peminjam_perpustakaan_kelas_c/app/data/model/response_book.dart';
import 'package:peminjam_perpustakaan_kelas_c/app/routes/app_pages.dart';
import '../controllers/book_controller.dart';

class BookView extends GetView<BookController> {
  const BookView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(Routes.ADD_BOOK),
        backgroundColor: Color(0xff1BC0B6),
        child: Icon(Icons.add),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Text(
              "List Buku",
              style: TextStyle(
                color: Color(0xFF000000),
                fontWeight: FontWeight.w900,
                fontFamily: 'avenir',
                fontSize: 20,
              ),
            ),
          ),
          Expanded(
            child: controller.obx(
                  (state) => ListView.separated(
                itemCount: state!.length,
                itemBuilder: (context, index) {
                  DataBook dataBook = state[index];
                  return ListTile(
                    title: Text("${dataBook.judul}"),
                    subtitle: Text(
                      "Penulis ${dataBook.penulis}${dataBook.kategoriId}${dataBook.penerbit} = ${dataBook.tahunTerbit} = ${dataBook.kategori}",
                    ),
                    trailing: ElevatedButton(
                      onPressed: () => Get.toNamed(Routes.ADD_PEMINJAMAN, parameters: {
                        'id': (dataBook.id ?? 0).toString(),
                        'judul': dataBook.judul ?? '-',
                      }),
                      child: Text("Pinjam"),
                    ),
                  );
                },
                separatorBuilder: (context, index) => Divider(),
              ),
              onLoading: Center(child: CupertinoActivityIndicator()),
            ),
          ),
        ],
      ),
    );
  }
}
