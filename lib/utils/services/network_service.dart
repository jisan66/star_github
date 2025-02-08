import 'dart:async';
import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class NetworkConnectivity {
  static Future<bool> checkConnectivity() async {
    try {
      var connectivityResult = await Connectivity().checkConnectivity();

      if (connectivityResult == ConnectivityResult.none) {
        Fluttertoast.showToast(msg: "No Internet", textColor: Colors.white, backgroundColor: Colors.red, fontSize: 18,gravity: ToastGravity.TOP);
        return false;
      }

      var result = await InternetAddress.lookup('google.com')
          .timeout(const Duration(seconds: 3));

      if (result.isNotEmpty && result.first.rawAddress.isNotEmpty) {
        return true;
      } else {
        Fluttertoast.showToast(msg: "No Internet", textColor: Colors.white, backgroundColor: Colors.red, fontSize: 18,gravity: ToastGravity.TOP);
        return false;
      }
    } on SocketException catch (_) {
      Fluttertoast.showToast(msg: "No Internet", textColor: Colors.white, backgroundColor: Colors.red, fontSize: 18,gravity: ToastGravity.TOP);
      return false;
    } on TimeoutException catch (_) {
      Fluttertoast.showToast(msg: "No Internet", textColor: Colors.white, backgroundColor: Colors.red, fontSize: 18,gravity: ToastGravity.TOP);
      return false;
    } catch (e) {
      Fluttertoast.showToast(msg: "No Internet", textColor: Colors.white, backgroundColor: Colors.red, fontSize: 18,gravity: ToastGravity.TOP);
      print('Error checking connectivity: $e');
      return false;
    }
  }
}