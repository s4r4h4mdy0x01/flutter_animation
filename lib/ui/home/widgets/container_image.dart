import 'package:flutter/material.dart';

class ContainerImage extends StatefulWidget {
  const ContainerImage({
    super.key,
    required this.imagesPath,
  });

  final String imagesPath;

  @override
  State<ContainerImage> createState() => _ContainerImageState();
}

class _ContainerImageState extends State<ContainerImage> {
  bool _flag = true;
  double _opactiy = 1;

  @override
  Widget build(BuildContext context) {
    return AnimatedPadding(
      duration: const Duration(milliseconds: 800),
      curve: Curves.bounceOut,
      padding: EdgeInsets.symmetric(horizontal: _flag ? 0 : 20, vertical: 10),
      child: SizedBox(
        height: 200,
        child: GestureDetector(
          onTap: () {
            _flag = !_flag;
            _opactiy = _opactiy == 1 ? 0.2 : 1;
            setState(() {});
          },
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 800),
            opacity: _opactiy,
            child: Image.asset(
              widget.imagesPath,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
