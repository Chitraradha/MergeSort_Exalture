import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils/curved_container.dart';
import '../view_model/merge_arrays_view_model.dart';

class MergeArraysPage extends StatelessWidget {
  final MergeArraysViewModel viewModel = Get.put(MergeArraysViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Merge Sort",style: TextStyle(color: Colors.white),),
      ),
      body: Stack(
        children: [
          
          SingleChildScrollView(
            padding: const EdgeInsets.all(26.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                SizedBox(height: 200),
                Center(
                  child: ElevatedButton(
                    onPressed: viewModel.onMergeButtonPressed,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 176, 73, 106),
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
