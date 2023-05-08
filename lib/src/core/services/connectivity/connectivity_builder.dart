import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:articles/src/core/core.dart';

class ConnectivityBuilder extends StatefulWidget {
  const ConnectivityBuilder(
      {Key? key,
      required this.child,
      this.disconnectedWidget,
      required this.connectedCallback,
      required this.noInternetString,
      required this.tryAgainString})
      : super(key: key);

  final Widget child;
  final Widget? disconnectedWidget;
  final Function() connectedCallback;
  final String noInternetString;
  final String tryAgainString;

  @override
  _ConnectivityBuilderState createState() => _ConnectivityBuilderState();
}

class _ConnectivityBuilderState extends State<ConnectivityBuilder> {
  final ConnectivityBloc _connectivityBloc = ConnectivityBloc();

  @override
  void initState() {
    super.initState();
    _connectivityBloc.add(CheckConnectivity());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
      bloc: _connectivityBloc,
      listener: (context, state) {
        if (state is NotConnected) {}
        if (state is Connected) {
          widget.connectedCallback();
        }
      },
      builder: (context, state) {
        if (state is NotConnected) {
          return Stack(
            children: [
              widget.child,
              Container(
                height: double.infinity,
                width: double.infinity,
                color: Colors.black26,
                child: Center(
                  child: AlertDialog(
                      backgroundColor: Colors.white,
                      content: SizedBox(
                        height: MediaQuery.of(context).size.height * .32,
                        child: Column(mainAxisSize: MainAxisSize.min, children: [
                          Expanded(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                "assets/noInternet.png",
                                height: 200,
                              ),
                            ],
                          )),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("  ${widget.noInternetString}",
                                  style: TextStyle(
                                      color: Colors.black, fontWeight: FontWeight.bold, fontSize: MediaQuery.of(context).size.width * 0.04)),
                            ],
                          ),
                        ]),
                      )),
                ),
              )
            ],
          );
        }
        return widget.child;
      },
    );
  }
}
