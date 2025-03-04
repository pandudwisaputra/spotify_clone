import 'package:dartz/dartz.dart';
import 'package:spotify/data/models/create_user_req.dart';
import 'package:spotify/data/models/signin_user_req.dart';
import 'package:spotify/data/sources/auth/auth_firebase_service.dart';

import '../../../domain/repository/auth/user.dart';
import '../../../service_locator.dart';

class AuthRepositoryImpl implements AuthRepository {
  @override
  Future<Either> signin(SigninUserReq signinUserReq) async {
    return await sl<AuthFirebaseService>().signin(signinUserReq);
  }

  @override
  Future<Either > signup(CreateUserReq createUserReq) async {
    return await sl<AuthFirebaseService>().signup(createUserReq); 
  }
}
