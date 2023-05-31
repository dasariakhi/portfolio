import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class NewPortfolio extends StatefulWidget {
  const NewPortfolio({super.key});

  @override
  State<NewPortfolio> createState() => _NewPortfolioState();
}

class _NewPortfolioState extends State<NewPortfolio> {
  late Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.red,
          height: size.height * 0.2,
          width: size.width * 0.2,
        ),
      ),
    );
  }
}
