import 'dart:typed_data';

 class FluxoPrintDTO  {
  Uint8List imageBytes;
  String nomeFluxo;
  FluxoPrintDTO({
    required this.imageBytes,
    required this.nomeFluxo,
  });
}
