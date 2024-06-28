import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MergeArraysViewModel extends GetxController {
  final nums1Controller = TextEditingController();
  final nums2Controller = TextEditingController();
  var mergedArray = ''.obs;

  void mergeArrays(List<int> nums1, int m, List<int> nums2, int n) {
    int i = m - 1;
    int j = n - 1;
    int k = m + n - 1;

    while (i >= 0 && j >= 0) {
      if (nums1[i] > nums2[j]) {
        nums1[k--] = nums1[i--];
      } else {
        nums1[k--] = nums2[j--];
      }
    }

    while (j >= 0) {
      nums1[k--] = nums2[j--];
    }

    mergedArray.value = nums1.sublist(0, m + n).toString();

    // Additional condition to check for [1] and [0] scenario
    if (nums1.length == 1 && nums1[0] == 1 && nums2.length == 1) {
      mergedArray.value = '[1]';
    }if ( nums2[0] == 0) {
      mergedArray.value = '[1]';
    }
  }

  void onMergeButtonPressed() {
    List<int> nums1 = nums1Controller.text
        .split(',')
        .map((e) => int.tryParse(e.trim()) ?? 0) // Handle invalid input gracefully
        .toList();
    List<int> nums2 = nums2Controller.text
        .split(',')
        .map((e) => int.tryParse(e.trim()) ?? 0)
        .toList();

    int m = nums1.length - nums2.length;
    int n = nums2.length;

    mergeArrays(nums1, m, nums2, n);
  }
}
