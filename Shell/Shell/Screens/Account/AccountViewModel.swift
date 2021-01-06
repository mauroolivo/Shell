import Foundation
import Localize_Swift

class AccountViewModel {
    func langs() {
        print(Localize.availableLanguages())
    }
    
    func setLang(_ lang: String) {
        Localize.setCurrentLanguage(lang)
    }
}
