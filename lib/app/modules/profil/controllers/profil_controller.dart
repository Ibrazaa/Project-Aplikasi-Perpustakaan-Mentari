import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/constant/endpoint.dart';
import '../../../data/provider/api_provider.dart';
import '../../../data/provider/storage_provider.dart';
import 'package:dio/dio.dart' as dio;
class ProfilController extends GetxController {
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

  void getName() async {
    loading(true);
    try{
      final id = StorageProvider.read(StorageKey.UID).toString();
      final responseNama = await ApiProvider.instance().get('${Endpoint.name}/$id',);
      final nama = responseNama.data['nama'];
      StorageProvider.write(StorageKey.name, nama);
    }catch (e){
      loading(false);
      if (e is dio.DioException) {
        loading(false);
        if (e.response != null) {
          if (e.response?.data != null) {
            Get.snackbar(
              "Sorry",
              "${e.response?.data['message']}",
              backgroundColor: Colors.orange,
            );
          }
        } else {
          Get.snackbar("Sorry", e.message ?? "", backgroundColor: Colors.red);
        }
      } else {
        loading(false);
        Get.snackbar("Error", e.toString(), backgroundColor: Colors.red);
      }
    }finally{
      loading(false);
    }

  }

}
