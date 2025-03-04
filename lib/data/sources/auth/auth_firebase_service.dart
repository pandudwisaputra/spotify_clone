import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spotify/data/models/signin_user_req.dart';

import '../../models/create_user_req.dart';

abstract class AuthFirebaseService {
  Future<Either> signup(CreateUserReq createUserReq);

  Future<Either> signin(SigninUserReq signinUserReq);
}

class AuthFirebaseServiceImpl implements AuthFirebaseService {
  @override
  Future<Either> signin(SigninUserReq signinUserReq) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: signinUserReq.email,
        password: signinUserReq.password,
      );

      return const Right("Signup was Succesfull");
    } on FirebaseAuthException catch (e) {
      return left(e.message);
    }
  }

  @override
  Future<Either> signup(CreateUserReq createUserReq) async {
    try {
      UserCredential data = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: createUserReq.email, password: createUserReq.password);

      FirebaseFirestore.instance.collection('Users').add({
        'name' : data.user?.displayName,
        'email' : data.user?.email,
      }); 

      return const Right("Signup was Succesfull");
    } on FirebaseAuthException catch (e) {
      return left(e.message);
    }
  }
}
