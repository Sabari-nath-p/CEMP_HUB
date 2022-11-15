import 'package:cemp_hub/structure/gpmodel.dart';
import 'package:cemp_hub/widgets/grpmessaga.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

MessagetoObject(QueryDocumentSnapshot m) {
  String id = m.get('ID');
  String content = m.get('CONTENT');
  String key = m.get('KEY');
  String dt = m.get('DT');
  List rt = [];
  grMessage gr =
      new grMessage(id, content, key.split('#')[1], key.split('#')[0], dt);
  rt.add(gr);
  var message = grpmessageright(key.split('#')[0], content, key.split('#')[1],dt);
  rt.add(message);
  return rt;
}
