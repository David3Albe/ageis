import 'package:ageiscme_impressoes/dto/training_record/training_record_print_dto.dart';
import 'package:ageiscme_impressoes/dto/training_record/user/training_record_user_print_dto.dart';
import 'package:dependencias_comuns/printing_exports.dart';

class UserWidget extends StatelessWidget {
  final TrainingRecordPrintDTO dto;
  final TrainingRecordUserPrintDTO user;

  UserWidget({
    required this.dto,
    required this.user,
  });

  @override
  Widget build(Context context) {
    return Container(
      width: 195,
      child: Column(
        children: [
          Padding(padding: const EdgeInsets.only(top: 24)),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  user.userName,
                  style: const TextStyle(
                    fontSize: 8,
                  ),
                ),
              ),
            ],
          ),
          Padding(padding: const EdgeInsets.only(top: 20)),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  'Ass.: ___________________________',
                  style: const TextStyle(
                    fontSize: 8,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
