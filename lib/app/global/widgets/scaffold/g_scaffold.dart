import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GScaffold extends StatelessWidget {
  final String? title;
  final Widget body;
  final Widget? floatingActionButton;
  final Widget? bottomNavigationBar;
  final List<Widget>? actions;

  const GScaffold({
    super.key,
    this.title,
    required this.body,
    this.floatingActionButton,
    this.bottomNavigationBar,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: title != null ? Text(title!, style: GoogleFonts.poppins(fontWeight: FontWeight.w500, fontSize: 22)) : null,
        actions: actions,
      ),
      body: SafeArea(child: body),
      floatingActionButton: floatingActionButton,
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
