import 'package:flutter/material.dart';
import '../../presentation/bloc/details_bloc.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  final DetailsBloc _bloc = DetailsBloc();

  @override
  void initState() {
    _bloc.add(DetailsDataEvent(id: 1321));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const SizedBox();
  }
}
