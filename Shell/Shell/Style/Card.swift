import SwiftUI
enum CardType {
  case plain
}
struct Card: View {
  let title: String
  let hint: String?
  let type: CardType
  let icon: Image?
  var action: () -> Void
  
  var body: some View {
    Button(action: action) {
      VStack {
        HStack {
          icon
            .font(.system(size: 46.0))
            .foregroundColor(Color(.mainText))
          
          Text(self.title)
            .font(.title)
            .fontWeight(.bold)
            .foregroundColor(Color(.mainText))
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        Text(self.hint ?? "")
          .font(.body)
          .foregroundColor(Color(.secondaryText))
          .frame(maxWidth: .infinity, alignment: .leading)
      }
      .padding()
    }.buttonStyle(CardStyle(type: type))
  }
}

struct CardStyle: ButtonStyle {
  let type: CardType
  func makeBody(configuration: Self.Configuration) -> some View {
    CardStyleView(configuration: configuration, type: type)
  }
}

private extension CardStyle {
  struct CardStyleView: View {
    
    @Environment(\.isEnabled) var isEnabled
    
    let configuration: CardStyle.Configuration
    let type: CardType
    var color: Color {
      get {
        switch type {
        case .plain:
          return Color(.tintCard)
        }
      }
    }
    var body: some View {
      
      configuration.label
        .background(RoundedRectangle(cornerRadius: 8).fill(isEnabled ? color : color))
        .opacity(configuration.isPressed ? 0.8 : isEnabled ? 1.0 : 0.5)
        .scaleEffect(configuration.isPressed ? 0.98 : 1.0)
      
    }
    
  }
}

