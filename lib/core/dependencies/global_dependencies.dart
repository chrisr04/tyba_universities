import 'package:tyba_universities/core/network/http_client.dart';
import 'package:provider/provider.dart';

class GlobalDependencies {
  GlobalDependencies._();

  static final providers = [
    Provider<HttpClient>(create: (context) => HttpClient()..createClient()),
  ];
}
