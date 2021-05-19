import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:perumahan/core/controllers/swath.dart';

class SearchDialogBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final SwathController swathCtlr = Get.find();
    return GetX<SwathController>(
      builder: (_) => Positioned(
        bottom: 0,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
            color: Colors.white,
          ),
          height:
              swathCtlr.isSearch.value ? MediaQuery.of(context).size.height : MediaQuery.of(context).size.height * 0.25,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(vertical: swathCtlr.isSearch.value ? 64 : 32, horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Pilih rumah idaman anda",
                style: GoogleFonts.notoSans(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              TextField(
                onTap: () {
                  swathCtlr.isSearch.value = true;
                },
                autofocus: false,
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.zero,
                  prefixIcon: Icon(Icons.search, color: Colors.black),
                  fillColor: Colors.grey[200],
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    borderSide: BorderSide(color: Color(0xFF757575), width: 2.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    borderSide: BorderSide(color: Color(0xFF757575), width: 2.0),
                  ),
                  hintText: 'Masukkan kode rumah',
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
