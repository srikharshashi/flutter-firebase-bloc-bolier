import 'package:bloc/bloc.dart';
import 'package:bloc_custom_firebase/services/repository.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState>
{
  Repossitory repository;

  LoginCubit({required this.repository}) : super(LoginInitial()) ;



  void signin(String email,String password)
  {
    emit(LoginLoad());
    repository.signin(email, password).then((value)
    {
      if(value)
        {
          emit(LoginSucesss());
        //  Else make it listen to the stream and make it navigate only if
        //  There is a user which is non null
        }
      else
        {
          emit(LoginFail());
        }
    });

  }

  void signinwithgoogle()
  {
    emit(LoginLoad());

    repository.signInWithGoogle().then((value)
    {
      if(value)
      {
        emit(LoginSucesss());
        //  Else make it listen to the stream and make it navigate only if
        //  There is a user which is non null
      }
      else
      {
        emit(LoginFail());
      }
    });
  }
}