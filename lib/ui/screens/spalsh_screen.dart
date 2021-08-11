import 'package:bloc_custom_firebase/constants.dart';
import 'package:bloc_custom_firebase/logic/bloc/splash/splashscreen_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashscreenCubit, SplashscreenState>(
      listener: (context, state) {
       if(state is Loggedin)
         Navigator.pushReplacementNamed(context,HOME_ROUTE);
       else if(state is UnAuthenticated)
         Navigator.pushReplacementNamed(context, LOGIN_ROUTE);
      },
      child: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      Text("SPLASH SCREEN"),

                      SizedBox(height: 100,),

                      BlocBuilder<SplashscreenCubit,SplashscreenState>
                        (
                          builder:
                              (context,state) {
                                if (state is SplashscreenLoading)
                                  return SpinKitCubeGrid(color: Colors.black);
                                else if (state is ConnectivityError)
                                  return Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "There was an error connecting to Internet",
                                        style: TextStyle(fontSize: 20,
                                            fontWeight: FontWeight.bold),),
                                      SizedBox(height: 10,),
                                      Text("Please check Connection and Restart",
                                        style: TextStyle(fontSize: 20,
                                            fontWeight: FontWeight.bold),),
                                    ],
                                  );
                                else
                                  return Container();
                              }
                      ),


                    ],

                  ),
                )
            ),
          ),
        ),
      ),
    );
  }
}
