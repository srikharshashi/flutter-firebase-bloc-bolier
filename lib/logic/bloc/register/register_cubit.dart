import 'package:bloc/bloc.dart';
import 'package:bloc_custom_firebase/services/repository.dart';
import 'package:meta/meta.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  Repossitory repossitory;

  RegisterCubit({required this.repossitory}) : super(RegisterInitial());


void signin(String email,String password) async
{
  emit(RegisterLoad());

   repossitory.registerwithEmail(email, password).then(
       (value) {
         if (value)
           emit(RegisterSuccess());
         else
           emit(RegisterFail());
       }
   );

}
}