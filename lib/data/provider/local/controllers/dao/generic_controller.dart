import 'dart:developer';

import 'package:fibotech/core/singleton/store_singleton.dart';
import 'package:fibotech/objectbox.g.dart';

class GenericController<T> implements IGenericController<T> {
  @override
  void addItem(T item) {
    StoreSingleton().store.box<T>().put(item);
  }

  @override
  void addItems(List<T> lsItems) {
    StoreSingleton().store.box<T>().putMany(
          lsItems,
        );
  }

  @override
  bool removeAll() {
    return StoreSingleton().store.box<T>().removeAll() > 0;
  }

  @override
  bool remove(int id) {
    return StoreSingleton().store.box<T>().remove(id);
  }

  @override
  List<T> getAll() {
    return StoreSingleton().store.box<T>().getAll();
  }

  @override
  T? getItemById(int id) {
    return StoreSingleton().store.box<T>().get(id);
  }

  @override
  bool isEmpty() {
    return StoreSingleton().store.box<T>().isEmpty();
  }

  @override
  int itemCount() {
    return StoreSingleton().store.box<T>().count();
  }

  @override
  Box<T> getbox() {
    return StoreSingleton().store.box<T>();
  }

  @override
  int addItemMode(T item, PutMode mode) {
    try{
      return StoreSingleton().store.box<T>().put(item, mode: mode);

    }catch(e){
      log(e.toString());
      return 0;
    }
  }
}

abstract class IGenericController<T> {
  void addItem(T item);
  int addItemMode(T item, PutMode mode);
  void addItems(List<T> lsItems);
  T? getItemById(int id);
  List<T> getAll();
  bool remove(int id);
  bool removeAll();
  int itemCount();
  bool isEmpty();
  Box<T> getbox();
}
