import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SnackBarServices {
  static void showSuccessMessage(String msg) {
    BotToast.showCustomNotification(
      toastBuilder: (void Function() cancelFunc) => _buildCustomToast(
        msg: msg,
        color: Colors.green,
        animationAsset: 'assets/icons/smile.json', // Path to your Lottie animation file
      ),
      duration: const Duration(seconds: 3),
      dismissDirections: [DismissDirection.endToStart],
      animationDuration: const Duration(milliseconds: 300),
      animationReverseDuration: const Duration(milliseconds: 300),
    );
  }

  static void showErrorMessage(String msg) {
    BotToast.showCustomNotification(
      toastBuilder: (void Function() cancelFunc) => _buildCustomToast(
        msg: msg,
        color: Colors.red,
        animationAsset: 'assets/icons/crying.json', // Path to your Lottie animation file
      ),
      duration: const Duration(seconds: 3),
      dismissDirections: [DismissDirection.endToStart],
    );
  }

  // Common widget for both SnackBar and Error message
  static Widget _buildCustomToast({
    required String msg,
    required Color color,
    required String animationAsset,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: color,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Lottie animation
            Lottie.asset(
              animationAsset,
              width: 40,
              height: 40,
              fit: BoxFit.contain,
            ),
            const SizedBox(width: 10),
            // Message text
            Expanded(
              child: Text(
                msg,
                style: TextStyle(color: Colors.white),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
