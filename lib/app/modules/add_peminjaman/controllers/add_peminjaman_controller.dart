import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart'as dio;
import 'package:peminjam_perpustakaan_kelas_c/app/data/provider/storage_provider.dart';
import '../../../data/constant/endpoint.dart';
import '../../../data/provider/api_provider.dart';
import '../../../routes/app_pages.dart';

class AddPeminjamanController extends GetxController {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final TextEditingController tanggalpinjamController = TextEditingController();
  final TextEditingController tanggalkembaliController = TextEditingController();
  final loading = false.obs;
  final count = 0.obs;


  @override
  void onInit() {
    super.onInit();
  }


  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
  Pinjam() async {
    loading(true);
    try {
      FocusScope.of(Get.context!).unfocus();
      formkey.currentState?.save();
      final tanggal_pinjam = tanggalpinjamController.text.toString();
      final tanggal_kembali = tanggalkembaliController.text.toString();
      final user_id = int.parse(StorageProvider.read(StorageKey.UID));
      final book_id = int.parse(Get.parameters['id'].toString());
      if (formkey.currentState!.validate()) {

        print('Request Data: ${{
          '"tanggal_pinjam"':'$tanggal_pinjam',
          '"tanggal_kembali"': '"$tanggal_kembali"',
          '"user_id"': '"$user_id"',
          '"book_id"': '"$book_id"',
        }}');
        final response = await ApiProvider.instance().post(Endpoint.pinjam,
            data:{
              "tanggal_pinjam": tanggalpinjamController.text.toString(),
              "tanggal_kembali": tanggalkembaliController.text.toString(),
              "user_id": int.parse(StorageProvider.read(StorageKey.UID)),
              "book_id": int.parse(Get.parameters['id'].toString()),
            });
        if (response.statusCode == 201) {
          Get.toNamed(Routes.PEMINJAMAN);
        } else {
          Get.snackbar("SORRY", "Register Gagal",
              backgroundColor: Colors.orange);
        }
      }
      loading(false);
    } on dio.DioException catch (e) {
      loading(false);
      if (e.response != null) {
        if (e.response?.data != null) {
          Get.snackbar("Sorry", "${e.response?.data['message']}",
              backgroundColor: Colors.orange);
        }
      } else {
        Get.snackbar("Sorry", e.message ?? "", backgroundColor: Colors.red);
      }
    } catch (e) {
      loading(false);
      Get.snackbar("error", e.toString(), backgroundColor: Colors.red);
    }
  }
}