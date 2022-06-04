import 'dart:convert';

import 'package:cv/core/database/localDb/databaseKey.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalDBFunctions {
  Future<bool> setCart(String cart);
  Future<Map?> getCart();
}

class LocalDbFunctionImpl extends LocalDBFunctions {
  @override
  Future<bool> setCart(String cart) async {
    try {
      SharedPreferences sp = await SharedPreferences.getInstance();

      sp.setString(AppLocalDatabaseKey.CART, cart);

      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  @override
  Future<Map?> getCart() async {
    Map? keyValue;

    SharedPreferences sp = await SharedPreferences.getInstance();
    String? _encodedData = sp.getString(AppLocalDatabaseKey.CART);

    if (_encodedData != null) {
      keyValue = jsonDecode(_encodedData);
    }

    return keyValue ?? null;
  }
}
