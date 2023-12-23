import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:prayerapp/models/UserDB.dart';


const String USER_COLLECTON_REF = "User";

class DatabaseService {
  final _firestore = FirebaseFirestore.instance;

  late final CollectionReference _userRef;

  DatabaseService() {
    _userRef = _firestore.collection(USER_COLLECTON_REF).withConverter<UserDB>(
        fromFirestore: (snapshots, _) => UserDB.fromJson(
              snapshots.data()!,
            ),
        toFirestore: (user, _) => user.toJson());
  }

  Stream<QuerySnapshot> getUser() {
    return _userRef.snapshots();
  }

  void addUser(UserDB user) async {
    _userRef.add(user);
  }

  void updateUser(String userID, UserDB user) {
    _userRef.doc(userID).update(user.toJson());
  }

  void deleteUser(String userID) {
    _userRef.doc(userID).delete();
  }
}
