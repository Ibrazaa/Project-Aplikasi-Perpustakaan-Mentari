import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/model/response_peminjaman.dart';
import '../../../routes/app_pages.dart';
import '../controllers/peminjaman_controller.dart';

class PeminjamanView extends GetView<PeminjamanController> {
  const PeminjamanView({Key? key}) : super(key: key);

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
        onPressed: ()=>Get.toNamed(Routes.ADD_PEMINJAMAN),backgroundColor: Color(0xff1BC0B6), child: Icon(Icons.add),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Text(
              "Peminjaman",
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
                  DataPinjam dataPinjam = state[index];
                  return ListTile(
                    title: Text("Peminjaman"),
                    subtitle: Text("Buku : ${dataPinjam.book?.judul}\nTanggal Pinjam : ${dataPinjam.tanggalPinjam}\nTanggal Kembali : ${dataPinjam.tanggalKembali}\nStatus : ${dataPinjam.status}"),
                    trailing: Text("${dataPinjam.status}"),
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
