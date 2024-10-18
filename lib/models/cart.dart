import 'package:new_app/models/catalog.dart';

import 'catalog.dart';

class CartModel{
  late CatalogModel _catalog;
  final List<int> _itesmIds=[];

  CatalogModel get catalog => _catalog;

  set catalog(CatalogModel newCatalog){
    assert(newCatalog!=null);
    _catalog = newCatalog;
  }
  List<Item> get items => _itesmIds.map((id) => _catalog.geById(id)).toList();

  num get totalPrice=>items.fold(0, (total,current)=>total+current.price);

  void add(Item item){
      _itesmIds.add(item.id);
  }


  void remove(Item item){
    _itesmIds.remove(item.id);
  }

}


