import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/constant/endpoint.dart';
import '../../../data/provider/api_provider.dart';
import '../../../data/provider/storage_provider.dart';
import '../../../routes/app_pages.dart';


class ChangePasswordController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final loading = false.obs;
  RxBool isPasswordHidden = true.obs;

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

  change() async {
    loading(true);
    try {
      FocusScope.of(Get.context!).unfocus();
      if (formKey.currentState!.validate()) {
        final id;
        if (StorageProvider.read(StorageKey.status) == "logged") {
          id = StorageProvider.read(StorageKey.UID);
        } else {
          final uname = usernameController.text.toString();
          final responseId = await ApiProvider.instance().get(
              '${Endpoint.UID}/$uname');
          id = responseId.data['id'];
        }
        final response = await ApiProvider.instance().put(
            '${Endpoint.changepw}/$id',
            data: {
              "password": passwordController.text.toString()
            }
        );

        if (response.statusCode == 200) {
          Get.back();
          Get.snackbar("SUCCESS", "Berhasil Mengganti Password",
              backgroundColor: Colors.blue);
        } else {
          Get.snackbar("Sorry", "Gagal Mengganti Password",
              backgroundColor: Colors.orange);
        }
      }
    } on dio.DioError catch (e) {
      if (e.response != null) {
        if (e.response!.data != null) {
          Get.snackbar("Sorry", "${e.response!.data['message']}",
              backgroundColor: Colors.orange);
        }
      } else {
        Get.snackbar("Sorry", e.message ?? "", backgroundColor: Colors.red);
      }
    } catch (e) {
      Get.snackbar("Error", e.toString(), backgroundColor: Colors.red);
    } finally {
      loading(false);
    }
  }
}


