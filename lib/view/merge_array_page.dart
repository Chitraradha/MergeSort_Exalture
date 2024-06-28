import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils/curved_container.dart';
import '../view_model/merge_arrays_view_model.dart';

class MergeArraysPage extends StatelessWidget {
  final MergeArraysViewModel viewModel = Get.put(MergeArraysViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ClipPath(
            clipper: CurvedContainer(),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.17,
              color: Colors.green.shade700,
            ),
          ),
          SingleChildScrollView(
            padding: const EdgeInsets.all(26.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30),
                Center(
                  child: Text(
                    'Merge Arrays',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ),
                SizedBox(height: 80),
                TextField(
                  controller: viewModel.nums1Controller,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter nums1 (comma separated)',
                  ),
                ),
                SizedBox(height: 25),
                TextField(
                  controller: viewModel.nums2Controller,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter nums2 (comma separated)',
                  ),
                ),
                SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: viewModel.onMergeButtonPressed,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green.shade700,
                      padding:
                      EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Text(
                      'Merge Arrays',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 40),
                Center(
                  child: Text(
                    'Merged Array:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 10),
                Center(
                  child: Obx(
                        () => Text(
                      viewModel.mergedArray.value,
                      style: TextStyle(fontSize: 30),
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
