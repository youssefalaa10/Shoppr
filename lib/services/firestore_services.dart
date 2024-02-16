import 'package:shoppr/core/utils/consts.dart';

class FirestoreServices {
  //get user data ------------------------
  static getUser(uid){
    return fireStore.collection(usersCollection).where('id',isEqualTo: uid).snapshots();
  }
}