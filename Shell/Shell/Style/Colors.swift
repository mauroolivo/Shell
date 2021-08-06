import SwiftUI
enum Colors: String {
  case bg = "bg"
  case tintAccent = "tintAccent"
  case tintSecondary = "tintSecondary"
  case outlineSecondaryText = "outlineSecondaryText"
  case tintDestructive = "tintDestructive"
  case tintCard = "tintCard"
  case mainText = "mainText"
  case secondaryText = "secondaryText"
}

extension Color {
  init(_ color: Colors) {
    self = Color.init(color.rawValue)
  }
}
