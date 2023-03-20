import 'dart:developer';

import 'package:flutter/material.dart';

class NotificationToastSingleton {
  factory NotificationToastSingleton() {
    _instance ??= NotificationToastSingleton._();
    return _instance!;
  }
  NotificationToastSingleton._();

  static NotificationToastSingleton? _instance;

  static late GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey;

  static set sKey(GlobalKey<ScaffoldMessengerState> sKey) {
    scaffoldMessengerKey = sKey;
  }

  static GlobalKey<ScaffoldMessengerState> get sKey => scaffoldMessengerKey;

  static Future<void> makeToast({
    required String title,
    required String subTitle,
    required double topcoustom,
    VoidCallback? onpress,
  }) async {
    try {
      scaffoldMessengerKey.currentState?.showSnackBar(
        SnackBar(
          action: SnackBarAction(
            onPressed: () {
              if (onpress != null) {
                onpress();
              }
            },
            label: '',
          ),
          backgroundColor: Colors.white.withOpacity(0.9),
          content: GestureDetector(
            onTap: () {
              if (onpress != null) {
                onpress();
              }
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.only(right: 8),
                  child: Icon(
                    Icons.info,
                    color: Colors.black,
                  )
                ),
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 13.5,
                  ),
                )
              ],
            ),
          ),
          duration: const Duration(milliseconds: 3000),
          margin: EdgeInsets.only(
            bottom: topcoustom,
            left: 20,
            right: 20,
          ),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      );
    } catch (e) {
      log(e.toString());
    }
  }
}
