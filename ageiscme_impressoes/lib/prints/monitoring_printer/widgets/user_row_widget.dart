import 'dart:math';

import 'package:ageiscme_impressoes/dto/monitoring_print/monitoring_print_dto.dart';
import 'package:dependencias_comuns/printing_exports.dart';

class UserRowWidget extends StatelessWidget {
  final MonitoringPrintDTO dto;

  UserRowWidget({required this.dto});

  @override
  Widget build(Context context) {
    String userName = dto.userName.substring(0, min(dto.userName.length, 15));
    String? docClasse;
    if (dto.userDocClasse != null) {
      docClasse =
          dto.userDocClasse!.substring(0, min(dto.userDocClasse!.length, 10));
    }
    String user = userName + (docClasse == null ? '' : ' - $docClasse');
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          'OP.: ' + user,
          style: const TextStyle(
            fontSize: 8,
          ),
        ),
      ],
    );
  }
}
