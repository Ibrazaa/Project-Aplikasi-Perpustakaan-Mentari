import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../data/provider/storage_provider.dart';
import '../../../routes/app_pages.dart';
import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Form(
            key: controller.formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 30,
                ),
                Center(
                  child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                      margin: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                      child: Image.asset(
                        "assets/logo.png",
                        height: 250,
                        width: 250,
                      )),
                ),
                SizedBox(height: 30),
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                    margin: EdgeInsets.symmetric(horizontal: 50, vertical: 0),
                    child: Text(
                      "Register",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: Color(0xFF000000),
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    )),
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                    margin: EdgeInsets.symmetric(horizontal: 25, vertical: 0),
                    // decoration: BoxDecoration(
                    //   color: Colors.green.shade300,
                    //   borderRadius: BorderRadius.circular(10.0),
                    // ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: TextFormField(
                            style: TextStyle(fontSize: 12),
                            controller: controller.namaController,
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              labelText: "Nama Lengkap",
                              hintText: "Masukkan Nama Lengkap Anda",
                              hintStyle: TextStyle(color: Colors.grey.shade400),
                              prefixIcon:
                              Icon(Icons.person, size: 16),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 25, horizontal: 20),
                              border: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(width: 1, color: Colors.grey),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(40))),
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(width: 1, color: Colors.grey),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(40))),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 1, color: Colors.blue),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(40)),
                              ),
                            ),
                            validator: (value) {
                              if (value!.length < 2) {
                                return "nama tidak boleh kosong";
                              }
                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: TextFormField(
                              style: TextStyle(fontSize: 12),
                              controller: controller.usernameController,
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                labelText: "Username",
                                hintText: "Masukan Username Anda",
                                hintStyle:
                                    TextStyle(color: Colors.grey.shade400),
                                prefixIcon:
                                Icon(Icons.person, size: 16),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 25, horizontal: 20),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 1, color: Colors.grey),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(40))),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 1, color: Colors.grey),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(40))),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(width: 1, color: Colors.blue),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(40),
                                  ),
                                ),
                              ),
                              validator: (value) {
                                if (value!.length < 2) {
                                  return "username tidak boleh kosong";
                                }
                                return null;
                              }),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: TextFormField(
                              style: TextStyle(fontSize: 12),
                              controller: controller.telpController,
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                labelText: "No Telp",
                                hintText: "Masukan No Telp Anda",
                                hintStyle:
                                    TextStyle(color: Colors.grey.shade400),
                                prefixIcon:
                                Icon(Icons.phone, size: 16),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 25, horizontal: 20),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 1, color: Colors.grey),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(40))),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 1, color: Colors.grey),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(40))),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(width: 1, color: Colors.blue),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(40),
                                  ),
                                ),
                              ),
                              validator: (value) {
                                if (value!.length < 2) {
                                  return "notelp tidak boleh kosong";
                                }
                                return null;
                              }),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: TextFormField(
                              style: TextStyle(fontSize: 12),
                              controller: controller.alamatController,
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                labelText: "Alamat",
                                hintText: "Masukan Alamat Anda",
                                hintStyle:
                                    TextStyle(color: Colors.grey.shade400),
                                prefixIcon:
                                Icon(Icons.maps_home_work_rounded, size: 16),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 25, horizontal: 20),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 1, color: Colors.grey),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(40))),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 1, color: Colors.grey),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(40))),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(width: 1, color: Colors.blue),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(40),
                                  ),
                                ),
                              ),
                              validator: (value) {
                                if (value!.length < 2) {
                                  return "alamat tidak boleh kosong";
                                }
                                return null;
                              }),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Obx(() => TextFormField(
                            obscureText: !controller.isPasswordHidden.isFalse, //isFalse adalah jika password diisi maka password langsung tertutup kebalikan dari value jika diisi ia kan manual menutup dengan menekan toggle eye dahulu.
                            style: TextStyle(fontSize: 12),
                            validator: (value) {
                              if (value!.length < 2) {
                                return "password tidak boleh kosong";
                              }
                              return null;
                            },
                            controller: controller.passwordController,
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              labelText: "Password",
                              hintText: "Masukan Password Anda",
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
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Material(
                                  child: Obx(
                                    () => controller.loading.value
                                        ? CircularProgressIndicator()
                                        : ElevatedButton(
                                            onPressed: () {
                                              controller.add();
                                            },
                                            style: ElevatedButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20.0),
                                              ),
                                              textStyle:
                                                  TextStyle(fontSize: 20),
                                              backgroundColor:
                                                  Color(0xff1BC0B6),
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 0 * 1.5,
                                                      vertical: 25),
                                              elevation: 5,
                                              shadowColor: Colors
                                                  .grey, // Atur warna bayangan
                                            ),

                                              child: Text(
                                                "REGISTER",
                                                style: TextStyle(
                                                    color: Color(0xFFFFFFFF)),
                                              ),
                                            ),
                                          ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Sudah punya akun?",
                              style: TextStyle(
                                fontSize: 10,
                              ),
                            ),
                            TextButton(
                              onPressed: () => Get.toNamed(Routes.LOGIN),
                              child: Text(
                                "Login Disini",
                                style: TextStyle(
                                  color: Colors.blue,
                                  // Atur warna teks menjadi biru
                                  decoration: TextDecoration.underline,
                                  // Tambahkan garis bawah pada teks
                                  fontSize: 10,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
