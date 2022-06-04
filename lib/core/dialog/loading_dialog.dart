import 'package:cv/core/utils/color_manager.dart';
import 'package:cv/main.dart';
import 'package:flutter/material.dart';

import 'overlay_dialog.dart';

int loadingCount = 0;

class Utils {
  const Utils._();

  static void loadingDialog() {
    if (loadingCount < 0) {
      loadingCount = 0;
    }
    loadingCount++;

    if (loadingCount == 1) {
      try {
        Navigator.of(globalContext).push(
          OverlayDialog(
            dialogWidget: Center(
              child: Container(
                decoration: BoxDecoration(
                  color: ColorManager.white,
                  borderRadius: BorderRadius.circular(5),
                ),
                padding: const EdgeInsets.all(20),
                child: CircularProgressIndicator(
                  color: ColorManager.primaryColor,
                ),
              ),
            ),
            dialogBarrierLabel: 'loadingDialog',
          ),
        );
      } catch (e) {
        debugPrint("Dialog Open Exception :: $e");
        loadingCount--;
      }
    }
  }

  static void closeDialog() {
    loadingCount--;

    try {
      if (loadingCount == 0 && Navigator.canPop(globalContext)) {
        Navigator.pop(globalContext);
      }
    } catch (e) {
      debugPrint("Dialog Close Exception :: $e");

      loadingCount = 0;
    }
  }
}
