export 'package:ageiscme_data/services/registry_service/registry_service_stub.dart' // Stub por padrão, será usado para Web e outras plataformas não compatíveis.
    if (dart.library.io) 'registry_service_windows.dart'; // Se for uma plataforma compatível com io (como Windows), usa a implementação do Windows.
