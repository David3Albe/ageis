import 'package:compartilhados/controllers/custom_text_editing_controller.dart';

class FormController {
  List<CustomTextEditingController> controllers;
  FormController({
    required this.controllers,
  });

  bool valid() {
    for (CustomTextEditingController controller in controllers) {
      controller.setErrors();
      bool valid = controller.valid();
      if (!valid) return false;
    }
    return true;
  }
}
