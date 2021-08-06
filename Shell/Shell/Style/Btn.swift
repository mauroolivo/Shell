import SwiftUI
enum ButtonType {
  case primary
  case primaryOutlined
  case secondary
  case secondaryOutlined
  case destructive
  case destructiveOutlined
}
struct Btn: View {
  let title: String
  let type: ButtonType
  let disclosure: Image?
  var action: () -> Void
  
  var body: some View {
    Button(action: action) {
      ZStack {
        HStack {
          Spacer()
          disclosure
            .padding([.horizontal])
        }
        Text(self.title)
          .padding([.vertical])
          .frame(maxWidth: .infinity)
      }
    }.buttonStyle(BtnStyle(type: type))
  }
}

struct BtnStyle: ButtonStyle {
  let type: ButtonType
  func makeBody(configuration: Self.Configuration) -> some View {
    BtnStyleView(configuration: configuration, type: type)
  }
}

private extension BtnStyle {
  struct BtnStyleView: View {
    // tracks if the button is enabled or not
    @Environment(\.isEnabled) var isEnabled
    // tracks the pressed state
    let configuration: BtnStyle.Configuration
    let type: ButtonType
    var color: Color {
      get {
        switch type {
        case .primary, .primaryOutlined:
          return Color.init(Colors.tintAccent.rawValue)
        case .secondary, .secondaryOutlined:
          return Color.init(Colors.tintSecondary.rawValue)
        case .destructive, .destructiveOutlined:
          return Color.init(Colors.tintDestructive.rawValue)
        }
      }
    }
    var body: some View {
      
      type != .primaryOutlined && type != .secondaryOutlined && type != .destructiveOutlined
        ?
        configuration.label
          .foregroundColor(isEnabled ? .white : .white)
          .background(RoundedRectangle(cornerRadius: 8).fill(isEnabled ? color : color))
          .overlay(RoundedRectangle(cornerRadius: 0.0).stroke(Color.clear, lineWidth: 0.0))
          .opacity(configuration.isPressed ? 0.8 : isEnabled ? 1.0 : 0.5)
          .scaleEffect(configuration.isPressed ? 0.98 : 1.0)
        :
        configuration.label
          .foregroundColor(isEnabled ? color : color)
          .background(RoundedRectangle(cornerRadius: 8).fill(isEnabled ? Color.clear : Color.clear))
          .overlay(RoundedRectangle(cornerRadius: 8.0).stroke(color, lineWidth: 2.0))
          .opacity(configuration.isPressed ? 0.8 : isEnabled ? 1.0 : 0.5)
          .scaleEffect(configuration.isPressed ? 0.98 : 1.0)
    }
    
  }
}

