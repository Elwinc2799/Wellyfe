import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class SignInModel with ChangeNotifier, DiagnosticableTreeMixin  {

  double _openValue = 0.0;
  get openValue => _openValue;
  set openValue(value) {
    _openValue = value;
    notifyListeners();
  }

  bool _isOpening = false;
  get isOpening => _isOpening;
  set isOpening(value) {
    _isOpening = value;
    notifyListeners();
  }

  void openLiquidMenu(AnimationController animationController) {
    isOpening = !isOpening;

    if (isOpening) {
      openValue = 75.0;
      animationController.forward();
    } else {
      openValue = 0.0;
      animationController.reset();
    }

    notifyListeners();
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IntProperty('openValue', openValue));
  }
}