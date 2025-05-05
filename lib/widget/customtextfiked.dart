import 'package:flutter/material.dart';

class CustomTextFiled extends StatefulWidget {
  const CustomTextFiled({
    super.key,
    required this.hittext,
    this.prefixIcon,
    this.controller,
    this.validator,
    this.hitcolor,
  });

  final Icon? prefixIcon;
  final String hittext;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Color? hitcolor;
  @override
  State<CustomTextFiled> createState() => _CustomTextFiledState();
}

class _CustomTextFiledState extends State<CustomTextFiled> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: widget.validator,

      decoration: InputDecoration(
        hintText: widget.hittext,
        hintStyle: TextStyle(color: widget.hitcolor),
        prefixIcon: widget.prefixIcon,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
      ),
    );
  }
}

// Image.asset('assets/images/Group 683.png', width: 200),
//             Container(
//               padding: EdgeInsets.all(4),
//               decoration: BoxDecoration(
//                 color: Color(0xFF001026),
//                 borderRadius: BorderRadius.circular(16),
//               ),
//               child: Column(
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         'Today',
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       Text(
//                         '12,MAR',
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 4),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         '29°C',
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       Text(
//                         '26°C',
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       Text(
//                         '24°C',
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       Text(
//                         '20°C',
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 4),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Image.asset(
//                         'assets/images/Group 647.png',
//                         width: 20,
//                         height: 20,
//                       ),
//                       Image.asset(
//                         'assets/images/Group 647.png',
//                         width: 20,
//                         height: 20,
//                       ),
//                       Image.asset(
//                         'assets/images/Group 647.png',
//                         width: 20,
//                         height: 20,
//                       ),
//                       Image.asset(
//                         'assets/images/Group 647.png',
//                         width: 20,
//                         height: 20,
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 4),
//                 ],
//               ),
//             ),
          