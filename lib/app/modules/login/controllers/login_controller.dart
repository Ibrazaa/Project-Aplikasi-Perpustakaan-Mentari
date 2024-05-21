import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import '../../../data/constant/endpoint.dart';
import '../../../data/provider/api_provider.dart';
import '../../../data/provider/storage_provider.dart';
import '../../../routes/app_pages.dart';

class LoginController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final loading = false.obs;
  RxBool isPasswordHidden = true.obs;


  @override
  void onInit() {
    super.onInit();
    if(StorageProvider.read(StorageKey.status) == 'logged'){
      Get.offAllNamed(Routes.NAVBAR);
    }
  }

  @override
  void onReady() {
    super.onReady();
    if(StorageProvider.read(StorageKey.status) == 'logged'){
      Get.offAllNamed(Routes.NAVBAR);
    }
  }

  login() async {
    loading(true);
    try {
      FocusScope.of(Get.context!).unfocus();
      if(formKey.currentState!.validate()){
        final response = await ApiProvider.instance().post(Endpoint.login,
            data: {
              "username": usernameController.text.toString(),
              "password": passwordController.text.toString()
            }
        );
        if(response.statusCode == 200){
          String uname = usernameController.text.toString();

          await StorageProvider.write(StorageKey.status, "logged");


          final responseId = await ApiProvider.instance().get('${Endpoint.UID}/$uname');
          final id = responseId.data['id'];
          await StorageProvider.write(StorageKey.UID, id.toString());

          final responseRole = await ApiProvider.instance().get('${Endpoint.role}/$uname');
          final role = responseRole.data['role'];
          StorageProvider.write(StorageKey.role, role);

          final responseNama = await ApiProvider.instance().get('${Endpoint.name}/$uname');
          final name = responseNama.data['nama'];
          StorageProvider.write(StorageKey.name, name);
          Get.toNamed(Routes.NAVBAR);
        } else {

          Get.offAllNamed(Routes.NAVBAR);
          Get.snackbar("Sorry", "Login Gagal", backgroundColor: Colors.orange);
        }
      }
    } on dio.DioError catch (e) {
      if (e.response != null) {
        if (e.response!.data != null) {
          Get.snackbar("Sorry", "${e.response!.data['message']}", backgroundColor: Colors.orange);
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
