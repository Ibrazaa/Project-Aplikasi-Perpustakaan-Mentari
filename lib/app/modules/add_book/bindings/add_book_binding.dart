import 'package:get/get.dart';

import '../controllers/add_book_controller.dart';
import '../views/add_book_view.dart';

class AddBookBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddBookController>(
      () => AddBookController(),
    );
  }
}
