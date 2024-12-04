import 'dart:ffi'; // Para interagir com FFI
import 'package:ffi/ffi.dart'; // Para manipulação de strings no nível nativo
import 'package:win32/win32.dart'; // Biblioteca para manipular o registro do Windows

class RegistryService {
  static const String registryPath =
      r'Software\com.example\ageiscme\WinSparkle';

  void checkAndClearSkipThisVersion() {
    // Tenta verificar no HKEY_CURRENT_USER primeiro
    if (!processRegistryKey(HKEY_CURRENT_USER)) {
      print(
        'Chave não encontrada no HKEY_CURRENT_USER. Tentando HKEY_LOCAL_MACHINE...',
      );
      // Caso não encontre, tenta no HKEY_LOCAL_MACHINE
      processRegistryKey(HKEY_LOCAL_MACHINE);
    }
  }

  bool processRegistryKey(int rootKey) {
    final hKey = calloc<HANDLE>();
    final subKey = TEXT(registryPath);

    try {
      // Abra a chave no registro
      final openResult = RegOpenKeyEx(
        rootKey,
        subKey,
        0,
        KEY_READ | KEY_WRITE,
        hKey,
      );

      if (openResult == ERROR_SUCCESS) {
        final valueName = TEXT('SkipThisVersion');
        final dataBuffer = calloc<Uint8>(256); // Aloca um buffer de 256 bytes
        final dataSize = calloc<DWORD>()..value = 256;

        // Tente ler o valor da chave
        final queryResult = RegQueryValueEx(
          hKey.value,
          valueName,
          nullptr,
          nullptr,
          dataBuffer,
          dataSize,
        );

        if (queryResult == ERROR_SUCCESS) {
          // Verifica se o valor existe
          final existingValue = dataBuffer.cast<Utf8>().toDartString();
          print('SkipThisVersion Value: $existingValue');

          // Se o valor não está vazio, remova-o (deixe vazio)
          if (existingValue.isNotEmpty) {
            final clearResult = RegSetValueEx(
              hKey.value,
              valueName,
              0,
              REG_SZ,
              nullptr, // Define um valor vazio
              0,
            );

            if (clearResult == ERROR_SUCCESS) {
              print('SkipThisVersion foi limpo com sucesso.');
            } else {
              print('Erro ao limpar SkipThisVersion: $clearResult');
            }
          }
        } else {
          print('SkipThisVersion não encontrado ou erro ao consultar.');
        }

        return true; // A chave foi encontrada e processada
      } else {
        print('Erro ao abrir o registro: $openResult');
        return false; // A chave não foi encontrada
      }
    } finally {
      // Libere memória e feche o registro
      calloc.free(subKey);
      if (hKey.value != 0) RegCloseKey(hKey.value);
      calloc.free(hKey);
    }
  }
}
