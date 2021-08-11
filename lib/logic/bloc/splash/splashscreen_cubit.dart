import 'package:bloc/bloc.dart';
import 'package:bloc_custom_firebase/services/repository.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:meta/meta.dart';

part 'splashscreen_state.dart';

class SplashscreenCubit extends Cubit<SplashscreenState> {

  Repossitory repossitory;

  SplashscreenCubit({required this.repossitory })
      : super(SplashscreenLoading())
  {
    print("In cubit constructor");
    initialize();
  }


  void initialize() async  {
    print("In splashscreen cubit");
     await repossitory.initializeFirebase();
     await Future.delayed(Duration(seconds: 3));
    var connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult == ConnectivityResult.none) {
      emit(ConnectivityError());
    }

    if(repossitory.checkSignin())
      emit(Loggedin());
    else
      emit(UnAuthenticated());

  }
}