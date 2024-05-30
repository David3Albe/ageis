import 'package:dependencias_comuns/bloc_export.dart';

class GridRecordsCubit extends Cubit<GridRecordsState> {
  GridRecordsCubit() : super(GridRecordsState(records: 0));

  void setRecords(int records) {
    emit(GridRecordsState(records: records));
  }
}


class GridRecordsState{
  final int records;

  GridRecordsState({required this.records});
}