import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../data/provider/storage_provider.dart';
import '../../../routes/app_pages.dart';
import '../controllers/change_password_controller.dart';

class ChangePasswordView extends GetView<ChangePasswordController> {
  const ChangePasswordView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 30,
                ),
                Center(
                  child: Container(
                      child: Image.asset(
                        "assets/logo.png",
                        height: 250,
                        width: 250,
                      )),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                    margin: EdgeInsets.symmetric(horizontal: 50, vertical: 0),
                    // mengurangi margin vertical
                    child: Text(
                      "Change Password",
                      style: TextStyle(
                          color: Color(0xFF000000),
                          fontWeight: FontWeight.bold,
                          fontFamily: 'avenir',
                          fontSize: 15),
                    )),
                Visibility(
                  // visible: StorageProvider.read(StorageKey.status) != "logged" ,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 25),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Obx(() => TextFormField(
                            obscureText: !controller.isPasswordHidden.isFalse, //isFalse adalah jika password diisi maka password langsung tertutup kebalikan dari value jika diisi ia kan manual menutup dengan menekan toggle eye dahulu.
                            style: TextStyle(fontSize: 12),
                            validator: (value) {
                              if (value!.length < 2) {
                                return "password baru tidak boleh kosong";
                              }
                              return null;
                            },
                            controller: controller.passwordController,
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              labelText: "Password Baru",
                              hintText: "Masukan Password Baru Anda",
                              hintStyle:
                              TextStyle(color: Colors.grey.shade400),
                              prefixIcon: Icon(Icons.lock_rounded, size: 15),
                              suffix: InkWell(
                                child: Icon(
                                  controller.isPasswordHidden.value
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.grey,
                                  size: 15,
                                ),
                                onTap: () {
                                  controller.isPasswordHidden.value = !controller
                                      .isPasswordHidden
                                      .value; // Panggil fungsi untuk mengubah visibilitas password
                                },
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 25, horizontal: 20),
                              border: OutlineInputBorder(
                                borderSide:
                                BorderSide(width: 1, color: Colors.grey),
                                borderRadius:
                                BorderRadius.all(Radius.circular(40)),
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 1, color: Colors.grey),
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(40))),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                BorderSide(width: 1, color: Colors.blue),
                                borderRadius:
                                BorderRadius.all(Radius.circular(40)),
                              ),
                            ),
                          )),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Material(
                                child: Obx(
                                      () => controller.loading.value
                                      ? CircularProgressIndicator()
                                      : ElevatedButton(
                                    onPressed: () {
                                      controller.change();
                                    },
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.circular(20.0),
                                      ),
                                      textStyle: TextStyle(fontSize: 20),
                                      backgroundColor: Color(0xff1BC0B6),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 0 * 1.5,
                                          vertical: 25),
                                      elevation: 5,
                                      shadowColor: Colors
                                          .grey, // Atur warna bayangan
                                    ),
                                    child: Text(
                                      "KIRIM",
                                      style: TextStyle(
                                        color: Color(0xFFFFFFFF),
                                        fontFamily: 'avenir',
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
