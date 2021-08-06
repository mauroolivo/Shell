import SwiftUI

struct SettingsView: View {
  
  var defaults = UserDefaults.standard
  private var theme: Binding<Theme> { Binding (
    get: { return defaults.theme },
    set: { newValue in
      defaults.theme = newValue
    })
  }
  @Binding var theColorScheme: ColorScheme
  var systemColorScheme: ColorScheme
  @State var updater: Bool = false
  @State var appearance: Int?
  var body: some View {
    ZStack{
      Text("\(appearance ?? 0)").hidden()
      List {
        Section(header: Text("Appearance")) {
          
          Button (action: {
            theme.wrappedValue = Shell.Theme.device
            theColorScheme = systemColorScheme
            appearance = theme.wrappedValue.rawValue
          }) {
            HStack {
              Text("Use device appearance")
              Spacer()
              Image(systemName: "checkmark")
                .isHidden(theme.wrappedValue != Shell.Theme.device)
            }.padding([.vertical])
          }
          .listRowBackground(Color.clear)
          
          Button (action: {
            theme.wrappedValue = Shell.Theme.light
            theColorScheme = .light
            appearance = theme.wrappedValue.rawValue
          }) {
            HStack {
              Text("Light")
              Spacer()
              Image(systemName: "checkmark")
                .isHidden(theme.wrappedValue != Shell.Theme.light)
            }.padding([.vertical])
          }
          .listRowBackground(Color.clear)
          Button (action: {
            theme.wrappedValue = Shell.Theme.dark
            theColorScheme = .dark
            appearance = theme.wrappedValue.rawValue
          }) {
            HStack {
              Text("Dark")
              Spacer()
              Image(systemName: "checkmark")
                .isHidden(theme.wrappedValue != Shell.Theme.dark)
            }.padding([.vertical])
          }
          .listRowBackground(Color.clear)
        }
      }
    }
    .colorScheme(theColorScheme)
    .onAppear() {
      UITableView.appearance().backgroundColor = Color(.bg).uiColor()
      UITableViewCell.appearance().backgroundColor = Color(.bg).uiColor()
      UITableView.appearance().tableFooterView = UIView()
    }
  }
}

struct SettingsView_Previews: PreviewProvider {
  static var previews: some View {
    SettingsView(theColorScheme: .constant(.dark), systemColorScheme: .dark)
    SettingsView(theColorScheme: .constant(.light), systemColorScheme: .light)
  }
}
