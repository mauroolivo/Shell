import Foundation
import Localize_Swift

class LanguageViewModel {
    
    func langs() -> [String] {
        Localize.availableLanguages()
    }
    
    func setLang(_ lang: String) {
        Localize.setCurrentLanguage(lang)
    }
    
    func currentLang() -> String {
        Localize.currentLanguage()
    }
    
    func langName(_ lang: String) -> String {
        
        if lang == "en" {
            return "language.en".localized()
        }
        if lang == "it" {
            return "language.it".localized()
        }
        return ""
    }
}
