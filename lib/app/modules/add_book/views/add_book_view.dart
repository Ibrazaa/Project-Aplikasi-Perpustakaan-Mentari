// add_book_view.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peminjam_perpustakaan_kelas_c/app/routes/app_pages.dart';
import '../controllers/add_book_controller.dart';
import '../views/add_book_view.dart';

class AddBookView extends GetView<AddBookController> {
  const AddBookView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_rounded),
          color: Color(0xff1BC0B6), // Ubah warna ikon di sini
          onPressed: () {
            // Aksi yang akan dilakukan ketika tombol leading ditekan
            Get.back(); // Contoh untuk kembali ke halaman sebelumnya menggunakan GetX
          },
        ),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Form(
              key: controller.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                      margin: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                      child: Text(
                        "Tambah Buku",
                        style: TextStyle(
                            color: Color(0xFF000000),
                            fontWeight: FontWeight.w900,
                            fontFamily: 'avenir',
                            fontSize: 20),
                      )),
                  SizedBox(
                    height: 25,
                  ),
                  TextFormField(
                    controller: controller.judulController,
                    decoration: InputDecoration(
                        labelText: 'Judul Buku', border: OutlineInputBorder()),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Judul tidak boleh kosong';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: controller.penulisController,
                    decoration: InputDecoration(
                        labelText: 'Penulis', border: OutlineInputBorder()),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Penulis tidak boleh kosong';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: controller.penerbitController,
                    decoration: InputDecoration(
                        labelText: 'Penerbit', border: OutlineInputBorder()),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Penerbit tidak boleh kosong';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: controller.tahunterbitController,
                    decoration: InputDecoration(
                        labelText: 'Tahun Terbit',
                        border: OutlineInputBorder()),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Tahun Terbit tidak boleh kosong';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  DropdownButtonFormField<String>(
                    // value: controller.selectedCategory.value,
                    items: controller.categories.map((String category) {
                      return DropdownMenuItem<String>(
                        value: category,
                        child: Text(category),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      controller.selectedCategory.value = newValue!;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Kategori tidak boleh kosong';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        labelText: 'Kategori', border: OutlineInputBorder()),
                  ),
                  SizedBox(height: 20),
                  Obx(
                    () => controller.loading.value
                        ? CircularProgressIndicator()
                        : Center(
                            child: SizedBox(
                              width: double.infinity,
                              // Menyamakan lebar dengan parent widget
                              child: ElevatedButton(
                                onPressed: () {
                                  controller.add();
                                },
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  textStyle: TextStyle(fontSize: 15),
                                  backgroundColor: Color(0xff1BC0B6),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 50, vertical: 25),
                                  // Atur padding horizontal di sini
                                  elevation: 5,
                                  shadowColor:
                                      Colors.grey, // Atur warna bayangan
                                ),
                                child: Text('Tambah'),
                              ),
                            ),
                          ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
