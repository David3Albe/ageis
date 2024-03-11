import 'package:dependencias_comuns/printing_exports.dart';

class RowItemWidget extends StatelessWidget {
  final List<Widget> widgets;

  RowItemWidget({required this.widgets});
  @override
  Widget build(Context context) {
    return Column(
      children: [
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.only(left:35),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: widgets,
          ),
        ),
        SizedBox(height: 20),
        Divider(
          height: 2,
          thickness: 1,
        ),
      ],
    );
  }
}
