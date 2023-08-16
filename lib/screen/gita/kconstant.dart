import 'package:bhadwadgita/screen/gita/kconstant/chapter11.dart';
import 'package:flutter/services.dart';

import 'kconstant/chapter1.dart';
import 'kconstant/chapter10.dart';
import 'kconstant/chapter12.dart';
import 'kconstant/chapter13.dart';
import 'kconstant/chapter14.dart';
import 'kconstant/chapter15.dart';
import 'kconstant/chapter16.dart';
import 'kconstant/chapter17.dart';
import 'kconstant/chapter18.dart';
import 'kconstant/chapter2.dart';
import 'kconstant/chapter3.dart';
import 'kconstant/chapter4.dart';
import 'kconstant/chapter5.dart';
import 'kconstant/chapter6.dart';
import 'kconstant/chapter7.dart';
import 'kconstant/chapter8.dart';
import 'kconstant/chapter9.dart';

class GitaKconstant {
  static List<int> gitaChapter = List.generate(18, (i) => i + 1);
  static List<int> gitaChapter18 = List.generate(78, (i) => i + 1);
  static List<int> gitaChapter1 = List.generate(47, (i) => i + 1);
  static List<int> gitaChapter2 = List.generate(72, (i) => i + 1);
  static List<int> gitaChapter3 = List.generate(43, (i) => i + 1);
  static List<int> gitaChapter4 = List.generate(42, (i) => i + 1);
  static List<int> gitaChapter5 = List.generate(29, (i) => i + 1);
  static List<int> gitaChapter6 = List.generate(47, (i) => i + 1);
  static List<int> gitaChapter7 = List.generate(30, (i) => i + 1);
  static List<int> gitaChapter8 = List.generate(28, (i) => i + 1);
  static List<int> gitaChapter9 = List.generate(34, (i) => i + 1);
  static List<int> gitaChapter10 = List.generate(42, (i) => i + 1);
  static List<int> gitaChapter11 = List.generate(55, (i) => i + 1);
  static List<int> gitaChapter12 = List.generate(20, (i) => i + 1);
  static List<int> gitaChapter13 = List.generate(34, (i) => i + 1);
  static List<int> gitaChapter14 = List.generate(27, (i) => i + 1);
  static List<int> gitaChapter15 = List.generate(20, (i) => i + 1);
  static List<int> gitaChapter16 = List.generate(24, (i) => i + 1);
  static List<int> gitaChapter17 = List.generate(28, (i) => i + 1);

  static gitavariable(int chapter) {
    if (chapter == 1) {
      return {"slokList": gitaChapter1, "chapter": chapter1};
    } else if (chapter == 2) {
      return {"slokList": gitaChapter2, "chapter": chapter2};
    } else if (chapter == 3) {
      return {"slokList": gitaChapter3, "chapter": chapter3};
    } else if (chapter == 4) {
      return {"slokList": gitaChapter4, "chapter": chapter4};
    } else if (chapter == 5) {
      return {"slokList": gitaChapter5, "chapter": chapter5};
    } else if (chapter == 6) {
      return {"slokList": gitaChapter6, "chapter": chapter6};
    } else if (chapter == 7) {
      return {"slokList": gitaChapter7, "chapter": chapter7};
    } else if (chapter == 8) {
      return {"slokList": gitaChapter8, "chapter": chapter8};
    } else if (chapter == 9) {
      return {"slokList": gitaChapter9, "chapter": chapter9};
    } else if (chapter == 10) {
      return {"slokList": gitaChapter10, "chapter": chapter10};
    } else if (chapter == 11) {
      return {"slokList": gitaChapter11, "chapter": chapter11};
    } else if (chapter == 12) {
      return {"slokList": gitaChapter12, "chapter": chapter12};
    } else if (chapter == 13) {
      return {"slokList": gitaChapter13, "chapter": chapter13};
    } else if (chapter == 14) {
      return {"slokList": gitaChapter14, "chapter": chapter14};
    } else if (chapter == 15) {
      return {"slokList": gitaChapter15, "chapter": chapter15};
    } else if (chapter == 16) {
      return {"slokList": gitaChapter16, "chapter": chapter16};
    } else if (chapter == 17) {
      return {"slokList": gitaChapter17, "chapter": chapter17};
    } else if (chapter == 18) {
      return {"slokList": gitaChapter18, "chapter": chapter18};
    } else {
      return null;
    }
  }

  static var chapterTitle = {
    1: {
      "hi": "कुरूक्षेत्र के युद्धक्षेत्र का सैन्य निरीक्षण",
      "en": "Military inspection on the battlefield of Kurukshetra",
      "np": "कुरुक्षेत्रका युद्धभुमिमा सैन्य निरिक्षण"
    },
    2: {
      "hi": "गीता का सारांश",
      "en": "Summary of Gita",
      "np": "गीताको सारसंक्षेप"
    },
    3: {"hi": "कर्मयोग", "en": "karma yoga", "np": "कर्मयोग"},
    4: {"hi": "दिव्य ज्ञान", "en": "Divine knowledge", "np": "दिव्य ज्ञान"},
    5: {"hi": "कर्मयोग", "en": "karma yoga", "np": "कर्मयोग"},
    6: {"hi": "ध्यानयोग", "en": "Meditation", "np": "ध्यानयोग"},
    7: {"hi": "परमज्ञान", "en": "omniscience", "np": "परमज्ञान"},
    8: {
      "hi": "भगवत्प्राप्ति",
      "en": "Attainment of God",
      "np": "भगवत्प्राप्ति"
    },
    9: {
      "hi": "परमगोपनीय ज्ञान",
      "en": "Secret knowledge",
      "np": "परमगोपनीय ज्ञान"
    },
    10: {
      "hi": "भगवानको ऐश्वर्य",
      "en": "The splendor of God",
      "np": "भगवानको ऐश्वर्य"
    },
    11: {"hi": "विराट-स्वरूप", "en": "Virata-svarupa", "np": "विराट-स्वरूप"},
    12: {"hi": "भक्तियोग", "en": "bhakti yoga", "np": "भक्तियोग"},
    13: {
      "hi": "प्रकृति, पुरुष और चेतना",
      "en": "Prakriti, Purusha and Consciousness",
      "np": "प्रकृति, पुरुष र चेतना"
    },
    14: {
      "hi": "प्रकृति के तीन गुण",
      "en": "Virata-svarupa",
      "np": "प्रकृतिका तीन गुण"
    },
    15: {
      "hi": "पुरुषोत्तम-योग",
      "en": "Purushottam-yoga",
      "np": "पुरुषोत्तम-योग"
    },
    16: {
      "hi": "दैवी तथा असुरी स्वभाव",
      "en": "Divine and demonic nature",
      "np": "दैवी तथा असुरी स्वभाव"
    },
    17: {
      "hi": "श्राद्ध के प्रकार",
      "en": "Kinds of Shraddha",
      "np": "श्रद्धाका प्रकार"
    },
    18: {
      "hi": "उपसंहार: संन्यास की पूर्णता",
      "en": "Epilogue: The Perfection of Sannyasa",
      "np": "उपसंहार: संन्यासको पूर्णता"
    },
  };
}
