import 'package:flutter/material.dart';
import 'package:folio/sections/about/about.dart';
import 'package:folio/sections/contact/contact.dart';
import 'package:folio/sections/home/home.dart';
import 'package:folio/sections/portfolio/portfolio.dart';
import 'package:folio/sections/services/services.dart';
import 'package:folio/widget/footer.dart';

import '../sections/portfolio/new_portfolio.dart';

class StaticUtils {
  static const String hi = 'assets/hi.gif';

  // photos
  static const String mobilePhoto = 'photos/mine1.png';
  static const String coloredPhoto = 'photos/mine1.png';
  static const String blackWhitePhoto = 'photos/mine1.png';

  // work

  static const String university = 'photos/clg.jpg';
  static const String fullterIsb = 'photos/Techtonic-Enterprises.jpg';

  // services

  static const String appDev = 'assets/services/app.png';

  static const String openSource = 'assets/services/open.png';
  static const String web = 'services/web.png';

  static const List<String> socialIconURL = [
    "https://img.icons8.com/metro/208/ffffff/facebook-new--v2.png",
    "https://img.icons8.com/ios-glyphs/480/ffffff/instagram-new.png",
    "https://img.icons8.com/metro/308/ffffff/linkedin.png",
    "https://img.icons8.com/material-rounded/384/ffffff/github.png",
  ];

  static const List<String> socialLinks = [
    "https://www.facebook.com/ahkil.teja/",
    "https://www.instagram.com/akhil_tothewall/",
    "https://www.linkedin.com/in/akhil-teja-dasari-31914b24b/",
    "https://github.com/dasariakhi?tab=repositories",
  ];

  static const String resume =
      'https://docs.google.com/document/d/1uKmb55_MbZZzzv3Qh7iMqp6o3Z6g-8yK/edit?usp=drive_link&ouid=103278416659480341265&rtpof=true&sd=true';

  static const String gitHub = 'https://github.com/dasariakhi?tab=repositories';
}

class BodyUtils {
  static const List<Widget> views = [
    HomePage(),
    About(),
    Services(),
    Portfolio(),
    Contact(),
    Footer(),
  ];
}
