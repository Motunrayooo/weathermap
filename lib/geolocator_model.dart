// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

List<Welcome> welcomeFromJson(String str) => List<Welcome>.from(json.decode(str).map((x) => Welcome.fromJson(x)));

String welcomeToJson(List<Welcome> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Welcome {
  Welcome({
    this.name,
    this.localNames,
     this.lat,
     this.lon,
    this.country,
    this.state,
  });

  String? name;
  LocalNames? localNames;
  double? lat;
  double? lon;
  String? country;
  String? state;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
    name: json["name"],
    localNames: LocalNames.fromJson(json["local_names"]),
    lat: json["lat"].toDouble(),
    lon: json["lon"].toDouble(),
    country: json["country"],
    state: json["state"] == null ? null : json["state"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "local_names": localNames?.toJson(),
    "lat": lat,
    "lon": lon,
    "country": country,
    "state": state == null ? null : state,
  };
}

class LocalNames {
  LocalNames({
    this.af,
    this.ar,
    this.ascii,
    this.az,
    this.bg,
    this.ca,
    this.da,
    this.de,
    this.el,
    this.en,
    this.eu,
    this.fa,
    this.featureName,
    this.fi,
    this.fr,
    this.gl,
    this.he,
    this.hi,
    this.hr,
    this.hu,
    this.id,
    this.it,
    this.ja,
    this.la,
    required this.lt,
    this.mk,
    this.nl,
    this.no,
    this.pl,
    this.pt,
    this.ro,
    this.ru,
    this.sk,
    this.sl,
    this.sr,
    this.th,
    this.tr,
    this.vi,
    this.zu,
  });

  String? af;
  String? ar;
  String? ascii;
  String? az;
  String? bg;
  String? ca;
  String? da;
  String? de;
  String? el;
  String? en;
  String? eu;
  String? fa;
  String? featureName;
  String? fi;
  String? fr;
  String? gl;
  String? he;
  String? hi;
  String? hr;
  String? hu;
  String? id;
  String? it;
  String? ja;
  String? la;
  String? lt;
  String? mk;
  String? nl;
  String? no;
  String? pl;
  String? pt;
  String? ro;
  String? ru;
  String? sk;
  String? sl;
  String? sr;
  String? th;
  String? tr;
  String? vi;
  String? zu;

  factory LocalNames.fromJson(Map<String, dynamic> json) => LocalNames(
    af: json["af"] == null ? null : json["af"],
    ar: json["ar"] == null ? null : json["ar"],
    ascii: json["ascii"],
    az: json["az"] == null ? null : json["az"],
    bg: json["bg"] == null ? null : json["bg"],
    ca: json["ca"] == null ? null : json["ca"],
    da: json["da"] == null ? null : json["da"],
    de: json["de"] == null ? null : json["de"],
    el: json["el"] == null ? null : json["el"],
    en: json["en"],
    eu: json["eu"] == null ? null : json["eu"],
    fa: json["fa"] == null ? null : json["fa"],
    featureName: json["feature_name"],
    fi: json["fi"] == null ? null : json["fi"],
    fr: json["fr"] == null ? null : json["fr"],
    gl: json["gl"] == null ? null : json["gl"],
    he: json["he"] == null ? null : json["he"],
    hi: json["hi"] == null ? null : json["hi"],
    hr: json["hr"] == null ? null : json["hr"],
    hu: json["hu"] == null ? null : json["hu"],
    id: json["id"] == null ? null : json["id"],
    it: json["it"] == null ? null : json["it"],
    ja: json["ja"] == null ? null : json["ja"],
    la: json["la"] == null ? null : json["la"],
    lt: json["lt"] == null ? null : json["lt"],
    mk: json["mk"] == null ? null : json["mk"],
    nl: json["nl"] == null ? null : json["nl"],
    no: json["no"] == null ? null : json["no"],
    pl: json["pl"] == null ? null : json["pl"],
    pt: json["pt"] == null ? null : json["pt"],
    ro: json["ro"] == null ? null : json["ro"],
    ru: json["ru"] == null ? null : json["ru"],
    sk: json["sk"] == null ? null : json["sk"],
    sl: json["sl"] == null ? null : json["sl"],
    sr: json["sr"] == null ? null : json["sr"],
    th: json["th"] == null ? null : json["th"],
    tr: json["tr"] == null ? null : json["tr"],
    vi: json["vi"] == null ? null : json["vi"],
    zu: json["zu"] == null ? null : json["zu"],
  );

  Map<String, dynamic> toJson() => {
    "af": af == null ? null : af,
    "ar": ar == null ? null : ar,
    "ascii": ascii,
    "az": az == null ? null : az,
    "bg": bg == null ? null : bg,
    "ca": ca == null ? null : ca,
    "da": da == null ? null : da,
    "de": de == null ? null : de,
    "el": el == null ? null : el,
    "en": en,
    "eu": eu == null ? null : eu,
    "fa": fa == null ? null : fa,
    "feature_name": featureName,
    "fi": fi == null ? null : fi,
    "fr": fr == null ? null : fr,
    "gl": gl == null ? null : gl,
    "he": he == null ? null : he,
    "hi": hi == null ? null : hi,
    "hr": hr == null ? null : hr,
    "hu": hu == null ? null : hu,
    "id": id == null ? null : id,
    "it": it == null ? null : it,
    "ja": ja == null ? null : ja,
    "la": la == null ? null : la,
    "lt": lt == null ? null : lt,
    "mk": mk == null ? null : mk,
    "nl": nl == null ? null : nl,
    "no": no == null ? null : no,
    "pl": pl == null ? null : pl,
    "pt": pt == null ? null : pt,
    "ro": ro == null ? null : ro,
    "ru": ru == null ? null : ru,
    "sk": sk == null ? null : sk,
    "sl": sl == null ? null : sl,
    "sr": sr == null ? null : sr,
    "th": th == null ? null : th,
    "tr": tr == null ? null : tr,
    "vi": vi == null ? null : vi,
    "zu": zu == null ? null : zu,
  };
}
