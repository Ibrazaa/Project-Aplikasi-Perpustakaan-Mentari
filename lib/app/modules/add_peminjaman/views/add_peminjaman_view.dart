import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/add_peminjaman_controller.dart';

class AddPeminjamanView extends GetView<AddPeminjamanController> {
  const AddPeminjamanView({Key? key}) : super(key: key);

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
      body: Center(
        child: Form(
          key: controller.formkey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                    margin: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                    child: Text(
                      "Pinjam Buku",
                      style: TextStyle(
                          color: Color(0xFF000000),
                          fontWeight: FontWeight.w900,
                          fontFamily: 'avenir',
                          fontSize: 20),
                    )),
                Text('Buku yang dipinjam : ${Get.parameters['judul']}'),
                SizedBox(
                  height: 20,
                ),
                DateTimePicker(
                  controller: controller.tanggalpinjamController,
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                  dateLabelText: 'Tanggal Pinjam',
                  dateMask: 'yyyy-MM-dd',
                  onChanged: (val) => print(val),
                  validator: (val) {
                    print(val);
                    return null;
                  },
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.calendar_today),
                    // Icon yang Anda inginkan
                    labelText: 'Tanggal Pinjam',
                    border: OutlineInputBorder(), // Atau gaya border lainnya
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                DateTimePicker(
                  controller: controller.tanggalkembaliController,
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                  dateLabelText: 'Tanggal Kembali',
                  dateMask: 'yyyy-MM-dd',
                  onChanged: (val) => print(val),
                  validator: (val) {
                    print(val);
                    return null;
                  },
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.calendar_today),
                    // Icon yang Anda inginkan
                    labelText: 'Tanggal Kembali',
                    border: OutlineInputBorder(), // Atau gaya border lainnya
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Obx(() => controller.loading.value
                      ? CircularProgressIndicator()
                      : SizedBox(
                          width: double.infinity, // Menyamakan lebar dengan parent widget
                          child: ElevatedButton(
                              onPressed: () {
                                controller.Pinjam();
                              },
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                textStyle: TextStyle(fontSize: 15),
                                backgroundColor: Color(0xff1BC0B6),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 50, vertical: 25),
                                elevation: 5,
                                shadowColor: Colors.grey, // Atur warna bayangan
                              ),
                              child: Text("Pinjam")),
                        )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
