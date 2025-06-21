import 'package:flutter/material.dart';

class NinProvider extends ChangeNotifier {
  final TextEditingController ninController = TextEditingController();
  final TextEditingController bvnController = TextEditingController();
  
  bool get isValid => ninController.text.length == 11;
  bool get isValid1 => bvnController.text.length == 11;
  
  void updateNin(String value) {
    if (value.isEmpty || (value.length <= 11 && int.tryParse(value) != null)) {
      ninController.text = value;
      ninController.selection = TextSelection.collapsed(
        offset: ninController.text.length,
      );
      notifyListeners();
    }
  }

  void updatebvn(String value) {
    if (value.isEmpty || (value.length <= 11 && int.tryParse(value) != null)) {
      bvnController.text = value;
      bvnController.selection = TextSelection.collapsed(
        offset: bvnController.text.length,
      );
      notifyListeners();
    }
  }

  @override
  void dispose() {
    ninController.dispose();
    bvnController.dispose();
    super.dispose();
  }
}