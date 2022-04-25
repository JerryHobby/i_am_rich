enum Language { English, Spanish, Tagalog, French, SIZE }

class AppText {
  // set this once and the getter handles it from there.
  var _language = Language.English;

  List<String> _hello =
      List.filled(Language.SIZE.index, "unset", growable: false);
  List<String> _title =
      List.filled(Language.SIZE.index, "unset", growable: false);
  List<String> _copyright =
      List.filled(Language.SIZE.index, "unset", growable: false);
  List<String> _body =
      List.filled(Language.SIZE.index, "unset", growable: false);

  AppText() {
    _hello[Language.English.index] = "Hello";
    _hello[Language.Spanish.index] = "Hola";
    _hello[Language.French.index] = "Bonjour";
    _hello[Language.Tagalog.index] = "Hello";

    _title[Language.English.index] = "I am Rich";
    _title[Language.Spanish.index] = "Soy Rico";
    _title[Language.French.index] = "Je Suis Riche";
    _title[Language.Tagalog.index] = "Ako ay Mayaman";

    _copyright[Language.English.index] = "Copyright Jerry Hobby";
    _copyright[Language.Spanish.index] = "Derechos de autor Jerry Hobby";
    _copyright[Language.French.index] = "Droit d'auteur Jerry Hobby";
    _copyright[Language.Tagalog.index] = "Copyright Jerry Hobby";

    _body[Language.English.index] =
        "This app does absolutely nothing.  Well, that's not really true. It allows you to show off that you actually spent \$999 USD to buy it.";
    _body[Language.Spanish.index] =
        "Esta aplicación no hace absolutamente nada. Bueno, eso no es realmente cierto. Le permite presumir de que realmente gastó \$999 USD para comprarlo.";
    _body[Language.French.index] =
        "Cette application ne fait absolument rien. Eh bien, ce n'est pas vraiment vrai. Il vous permet de montrer que vous avez réellement dépensé \$999 USD pour l'acheter.";
    _body[Language.Tagalog.index] =
        "Walang anuman ang app na ito. Hindi iyan totoo. Ito ay nagpapahintulot sa iyo na ipakita off na ikaw ay talagang ginugol \$999 USD upang bilhin ito.";
  }

  String get hello {
    return (_hello[_language.index]);
  }

  String get title {
    return (_title[_language.index]);
  }

  String get copyright {
    return (_copyright[_language.index]);
  }

  String get body {
    return (_body[_language.index]);
  }

  Language get language {
    return (_language);
  }

  set language(Language newLanguage) {
    this._language = newLanguage;
  }
}
