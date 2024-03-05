class CustomAudio {
  CustomAudio({required this.code, required this.path});

  int code;

  String path;

  static List<CustomAudio> getAll() {
    return [
      CustomAudio(code: 1, path: 'sounds/AlertaSonoroPergunta.wav'),
      CustomAudio(code: 2, path: 'sounds/AlertaSonoroErroSequencia.wav'),
      CustomAudio(code: 3, path: 'sounds/AlertaSonoro.wav'),
      CustomAudio(code: 4, path: 'sounds/DestinoNaoCompativel.wav'),
      CustomAudio(code: 5, path: 'sounds/MaterialUrgente.wav'),
      CustomAudio(code: 6, path: 'sounds/AlertaSonoroFluxo.wav'),
      CustomAudio(code: 7, path: 'sounds/AlertaSonoroPergunta2.wav'),
      CustomAudio(code: 8, path: 'sounds/AlertaNovoKit.wav'),
    ];
  }

  static CustomAudio? getOneFromCode(int code) =>
      getAll().where((element) => element.code == code).firstOrNull;
}
