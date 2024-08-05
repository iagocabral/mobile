import 'package:user_repository/src/user_repo.dart';

class FirebaseUserRepo implements UserRepository{
  final FirebaseAuth _firebaseAuth;
  final usersCollection = FirebaseFirestore.instance.collection('users');
}