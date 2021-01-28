import 'package:abyl/workPage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

fetchNorm(String type,  done) async{
  var docs = await FirebaseFirestore.instance.collection('Norms').where('type', isEqualTo: '$type').get();
  normDocs = docs.docs;
  print(normDocs.length);
  done();
}