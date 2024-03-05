class ListHelper {
  static List<List<T>> dividirLista<T>(
    List<T> listaOriginal,
    int tamanhoSublista,
  ) {
    List<List<T>> sublistas = [];

    for (int i = 0; i < listaOriginal.length; i += tamanhoSublista) {
      int endIndex = (i + tamanhoSublista < listaOriginal.length)
          ? i + tamanhoSublista
          : listaOriginal.length;
      sublistas.add(listaOriginal.sublist(i, endIndex));
    }

    return sublistas;
  }
}
