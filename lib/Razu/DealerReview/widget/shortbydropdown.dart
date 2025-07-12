import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../controller/Review_controller/review_controller.dart';

class ShortByDropdown extends StatelessWidget {
  final BusinessController controller = Get.put(BusinessController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return DropdownButtonFormField<String>(
        dropdownColor: Colors.white,
        value: controller.selectedShortBy.value.isEmpty
            ? null
            : controller.selectedShortBy.value,

        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
          hintText: 'Select your sort', // typo fixed from "short"
          hintStyle: TextStyle(color: Colors.grey.shade400),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.grey.shade300),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.grey.shade300),
          ),
        ),

        icon: Icon(Icons.arrow_drop_down),

        items: controller.shortList.map((item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Text(item),
          );
        }).toList(),

        onChanged: (value) {
          if (value != null) {
            controller.setSelectedShortBy(value); // ✅ fixed method name
          }
        },
      );
    });
  }
}
