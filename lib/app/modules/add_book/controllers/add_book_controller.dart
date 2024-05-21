// add_book_controller.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import '../../../data/constant/endpoint.dart';
import '../../../data/provider/api_provider.dart';
import '../../../routes/app_pages.dart';

class AddBookController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController judulController = TextEditingController();
  final TextEditingController penulisController = TextEditingController();
  final TextEditingController penerbitController = TextEditingController();
  final TextEditingController tahunterbitController = TextEditingController();
  final selectedCategory = ''.obs;
  final loading = false.obs;

  final List<String> categories = ['FIKSI', 'NONFIKSI', 'KOMIK','ANAK-ANAK','ROMANCE','KAMUS'];

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

  void add() async {
    loading(true);
    try {
      FocusScope.of(Get.context!).unfocus();
      formKey.currentState?.save();
      final kategori = _getCategoryId(selectedCategory.value);
      final judul = judulController.text.toString();
      final penulis = penulisController.text.toString();
      final penerbit = penerbitController.text.toString();
      final tahun_terbit = tahunterbitController.text.toString();
      if (formKey.currentState!.validate()) {
        print('Request Data: ${{
          '"kategori_id"':'$kategori',
          '"judul"': '"$judul"',
          '"penulis"': '"$penulis"',
          '"penerbit"': '"$penerbit"',
          '"tahun_terbit"': '$tahun_terbit',
        }}');

        // Uncomment the lines below after handling the API request
        final response = await ApiProvider.instance().post(
          Endpoint.add_book,
          data: {
            "kategori_id": _getCategoryId(selectedCategory.value).toString(),
            "judul": judulController.text.toString(),
            "penulis": penulisController.text.toString(),
            "penerbit": penerbitController.text.toString(),
            "tahun_terbit": tahunterbitController.text.toString(),
          },
        );

        if (response.statusCode == 200) {
          Get.toNamed(Routes.BOOK);
          Get.snackbar("SUCCES", "Berhasil menambahkan buku",
              backgroundColor: Colors.blue);
        } else {
          Get.snackbar("SORRY", "Gagal menambahkan buku",
              backgroundColor: Colors.orange);
        }

      }
    } catch (e) {
      loading(false);
      if (e is dio.DioException) {
        loading(false);
        if (e.response != null) {
          if (e.response?.data != null) {
            Get.snackbar(
              "Maaf",
              "${e.response?.data['message']}",
              backgroundColor: Colors.orange,
            );
          }
        } else {
          Get.snackbar("Maaf", e.message ?? "", backgroundColor: Colors.red);
        }
      } else {
        loading(false);
        Get.snackbar("Error", e.toString(), backgroundColor: Colors.red);
      }
    } finally {
      loading(false);
    }
  }

  int _getCategoryId(String category) {
    switch (category) {
      case 'FIKSI':
        return 1;
      case 'NONFIKSI':
        return 2;
      case 'KOMIK':
        return 3;
      case 'ANAK - ANAK':
        return 4;
      case 'ROMANCE':
        return 5;
      case 'KAMUS':
        return 6;
      default:
        return 1; // Default to Fiksi if category not found
    }
  }
}