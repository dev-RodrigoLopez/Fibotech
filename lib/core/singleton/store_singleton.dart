import 'package:fibotech/core/utils/env.dart';
import 'package:fibotech/objectbox.g.dart';
import 'package:objectbox/objectbox.dart' as objectbox;
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as path_provider;

class StoreSingleton {
  factory StoreSingleton() {
    _instance ??= StoreSingleton._();
    return _instance!;
  }

  StoreSingleton._();

  static StoreSingleton? _instance;

  late final objectbox.Store _store;

  late Admin admin;

  Future<void> initStore() async {
    final appDocumentsDirextory =
        await path_provider.getApplicationDocumentsDirectory();
  
    _store = Store(
      getObjectBoxModel(),
      directory: path.join(appDocumentsDirextory.path, EnvVariables.openStore),
    );

    if (Admin.isAvailable()) {
      admin = Admin(_store);
    }

    return;
  }

  Future<void> closeStore() async {
    admin.close();
  }

  objectbox.Store get store => _store;
}
