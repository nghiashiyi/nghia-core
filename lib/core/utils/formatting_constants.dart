import 'package:flutter/material.dart';

/// All formatting constants are stored here
/// Reference : 0.1

const kWhiteTextonBlackBody =
    TextStyle(color: Colors.white, fontSize: 15.0, fontFamily: 'Montserrat');
const kBlackTextonWhiteBody =
    TextStyle(color: Colors.black, fontSize: 15.0, fontFamily: 'Montserrat');

const kWhiteTextonBlackHeader = TextStyle(
    color: Colors.white,
    fontSize: 37.0,
    fontWeight: FontWeight.w900,
    fontFamily: 'Montserrat Bold');
const kBlackTextonWhiteHeader = TextStyle(
    color: Colors.black,
    fontSize: 37.0,
    fontWeight: FontWeight.w900,
    fontFamily: 'Montserrat Bold');

const kWhiteTextonBlackSubHeader = TextStyle(
    color: Colors.white,
    fontSize: 22.0,
    fontWeight: FontWeight.w800,
    fontFamily: 'Montserrat Bold');
const kBlackTextonWhiteSubHeader = TextStyle(
    color: Colors.black,
    fontSize: 22.0,
    fontWeight: FontWeight.w800,
    fontFamily: 'Montserrat Bold');

const kBlueTextonWhiteButton = TextStyle(
  color: Color(0xff108BD0),
  fontSize: 15.0,
  fontFamily: 'Montserrat Bold',
  fontWeight: FontWeight.w900,
);

const kGrayTextonWhiteItalicDescriptionHeader = TextStyle(
    color: Color(0xffb5b5b5),
    fontSize: 15.0,
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.italic,
    fontFamily: 'Montserrat');

const kGrayTextonWhiteDescriptionHeader = TextStyle(
    color: Color(0xffb5b5b5),
    fontSize: 15.0,
    fontWeight: FontWeight.w600,
    fontFamily: 'Montserrat');

const kWhiteTextonBlackBodyTileHeader = TextStyle(
    color: Colors.white,
    fontSize: 22.0,
    fontWeight: FontWeight.bold,
    fontFamily: 'Montserrat Bold');

const kBlackTextTag = TextStyle(
    color: Colors.black,
    fontSize: 15.0,
    fontWeight: FontWeight.bold,
    fontFamily: 'Montserrat Bold');

const kWhiteTextTag = TextStyle(
    color: Colors.white,
    fontSize: 15.0,
    fontWeight: FontWeight.bold,
    fontFamily: 'Montserrat Bold');

const kLoginTextFieldDecoration = InputDecoration(
  hintText: '',
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);
