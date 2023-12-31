import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mute_motion/core/utils/constant.dart';
import 'package:mute_motion/feature/OTP/presentation/view/OTP.dart';
import 'package:mute_motion/feature/resgisterscreen/model/regmodel.dart';
import 'package:mute_motion/models/OTP_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiProvide {
  static const String baseUrl =
      "https://gradution2024-production.up.railway.app/api/v1";
  UserLogin(
      {required BuildContext context,
        required TextEditingController emailCont,
        required TextEditingController passCont}) async {
    try {
      Map<String, dynamic> requestBody = {
        "email": emailCont.text,
        "password": passCont.text,
      };
      Response response =

      await Dio().post("$baseUrl/driverauth/login", data: requestBody);
      GoRouter.of(context).push('/navbar');
      print('Request successful');
      print('Response: ${response.data}');
      print(response.data["token"]);
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString("token", response.data["token"]);
      String? token = prefs.getString("token");
      print("Token is : $token");
    } catch (e) {
      if (e is DioException) {
        print(e.response?.data);
        _showErrorDialogLogin(context, 'Request failed! ', emailCont, passCont);
      }
    }
  }

  void _showErrorDialogLogin(
      BuildContext context,
      String message,
      TextEditingController emailCont,
      TextEditingController passCont,
      ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          buttonPadding: EdgeInsets.only(right: 20,bottom: 10),
          elevation: 20,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          backgroundColor: Colors.white,
          content: Text(
            message,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 25, fontFamily: 'Comfortaa', color: borderColor),
          ),
          actions: [
            TextButton(
              style: ButtonStyle(
                elevation:MaterialStatePropertyAll(30.0),
                backgroundColor: MaterialStateProperty.all<Color>(borderColor),
                shape: MaterialStateProperty.all<OutlinedBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        12.0), // Adjust the border radius as needed
                  ),
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                emailCont.clear();
                passCont.clear(); // Close the dialog
              },
              child: Text(
                'Try again',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 15, fontFamily: 'Comfortaa',fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
          ],
        );
      },
    );
  }

  UserRegisteration(
      { required BuildContext context,
        required String fullname,
        required String age,
        required String email,
        required String password,
        required String passwordConfirm,
        required String phone,
        required String cartype,
        required String color,
        required String model,
        required String carnum,
        required String cardescription,
        required String cardnum,
        required String exdate,
        required String cvv,
      }) async {
    try {
      FormData formData = FormData.fromMap(
          {
            "fullname": fullname,
            "email": email,
            "password": password,
            "passwordConfirm": passwordConfirm,
            "phone":phone,
            "age": age,
            "cartype": cartype,
            "color": color,
            "model": model,
            "carnum": carnum,
            "cardescription":cardescription,
            "CardNumber": cardnum,
            "ExpiryDate": exdate,
            "CVV": cvv,
          }
      );
      Response response =

      await Dio().post("$baseUrl/drivers", data: formData);

      await OTPprovider().sendcode(email: email);
      Navigator.of(context).push(MaterialPageRoute (
        builder: (BuildContext context) =>  OTP(rg: regmodel(email)),
      ),);
      print('Request successful');
      print('Response: ${response.data}');
    } catch (e) {
      if (e is DioException) {
        print(e.response?.data);
        _showErrorDialogReg(context, 'Attention!','this mail already taken');
      }
    }
  }


  void _showErrorDialogReg(
      BuildContext context,
      String title,
      String message,
      ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          buttonPadding: EdgeInsets.only(right: 20,bottom: 10),
          elevation: 20,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          backgroundColor: Colors.white,
          title: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 25, fontFamily: 'Comfortaa',fontWeight: FontWeight.bold,color: borderColor),
          ),
          content: Text(
            message,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, fontFamily: 'Comfortaa',color: borderColor),
          ),
          actions: [
            TextButton(
              style: ButtonStyle(
                elevation:MaterialStatePropertyAll(30.0),
                backgroundColor: MaterialStateProperty.all<Color>(borderColor),
                shape: MaterialStateProperty.all<OutlinedBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        12.0), // Adjust the border radius as needed
                  ),
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();// Close the dialog
              },
              child: Text(
                'Try again',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 15, fontFamily: 'Comfortaa',fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
          ],
        );
      },
    );
  }
}