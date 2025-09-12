import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:squadra_pos/refactor/data/providers/models/network_exception.dart';
import 'package:squadra_pos/refactor/utils/constants.dart';

class NetworkExceptionHandling extends StatefulWidget {
  const NetworkExceptionHandling({super.key, required this.exception, this.refresh});

  final String exception;
  final void Function()? refresh;

  @override
  State<NetworkExceptionHandling> createState() => _NetworkExceptionHandlingState();
}

class _NetworkExceptionHandlingState extends State<NetworkExceptionHandling> {
  late Map<String, dynamic> response;

  @override
  void initState() {
    super.initState();

    switch (widget.exception) {
      case socketException:
        response = getContentErrorHTTP(NetworkException.socketException());
        break;
      case timeOutException:
        response = getContentErrorHTTP(NetworkException.timeOutException());
        break;
      case httpException:
        response = getContentErrorHTTP(NetworkException.httpException());
        break;
      case formatException:
        response = getContentErrorHTTP(NetworkException.formatException());
        break;
      default:
        response = getContentErrorHTTP(NetworkException.unknownException());
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(
        vertical: 40.dm
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(response["error_image"], width: size.height * 0.2),
          Text(response["error_title"],
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.center,
          ),
          Text(response["error_message"], textAlign: TextAlign.center),
          const SizedBox(height: 10),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                onPressed: widget.refresh, 
                style: ElevatedButton.styleFrom(
                  elevation: 0.0,
                  fixedSize: Size(double.infinity, 40),
                  backgroundColor: primaryColor,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                child: Center(
                  child: RichText(
                    text: TextSpan(
                      style: const TextStyle(fontSize: 16.0),
                      children: [
                        WidgetSpan(
                          alignment: PlaceholderAlignment.middle,
                          child: Icon(Icons.refresh, size: 20.0),
                        ),
                        const WidgetSpan(
                          child: SizedBox(width: 6.0),
                        ),
                        const TextSpan(
                          text: "Try again",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}