enum LanguageType { ENGLISH, PORTUGUESE_BR }

const String ENGLISH = "en";
const String PORTUGUESE_BR = "pt-BR";

extension LanguageTypeExtension on LanguageType {
  String getValue() {
    switch (this) {
      case LanguageType.ENGLISH:
        return ENGLISH;
      case LanguageType.PORTUGUESE_BR:
        return PORTUGUESE_BR;
    }
  }
}
