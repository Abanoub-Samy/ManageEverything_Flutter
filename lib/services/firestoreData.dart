import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:manage_everything/models/churchModel.dart';
import 'package:manage_everything/models/userModel.dart';

class FireStoreData {
  final String userID;
  final CollectionReference _churchCollection =
      Firestore.instance.collection('church');


  FireStoreData({this.userID});


  Future createNewChurch(String churchName) async {
    return await _churchCollection.document().setData({
      'churchName': churchName,
    });
  }

  Future createNewManager(String churchName) async {
    return await _churchCollection.document().collection('collectionPath').add({

    });
  }

  List<ChurchModel> _churchListSnapShot(QuerySnapshot snapshot){
    return snapshot.documents.map((doc){
      return ChurchModel(
        churchName: doc.data['churchName'] ?? ''
      );
    }).toList();
  }

  Stream<List<ChurchModel>> get churchData{
    return _churchCollection.snapshots()
    .map(_churchListSnapShot);
  }

  Stream<UserModel> get userData{
    return _churchCollection.document(userID).snapshots().map(_data);
  }

  UserModel _data(DocumentSnapshot snapshot){
    return UserModel(
      '','','','','','',false,false
    );
  }
}
