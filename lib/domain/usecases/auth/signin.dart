import 'package:dartz/dartz.dart';
import 'package:spotify/core/usecase/usecase.dart';
import 'package:spotify/data/models/signin_user_req.dart';
import 'package:spotify/domain/repository/auth/user.dart';

import '../../../service_locator.dart';

class SigninUseCase implements Usecase<Either , SigninUserReq> {

  @override
  Future<Either> call({SigninUserReq? params}){
    return sl<AuthRepository>().signin(params!);
  }
}