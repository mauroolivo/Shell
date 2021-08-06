import SwiftUI

struct HomeView: View {
  
  @State var isSettings: Bool = false
  @State var theColorScheme: ColorScheme
  var systemColorScheme: ColorScheme
  
  var body: some View {
    NavigationView {
      List {
        NavigationLink(destination: SheetButtonsView()) {
          Text("Buttons")
        }
        .listRowBackground(Color.clear)
        NavigationLink(destination: SheetCardsView()) {
          Text("Cards")
        }
        .listRowBackground(Color.clear)
      }
      .navigationBarTitle(Text("Shell"))
      .navigationBarItems(trailing: Button(action: {
          isSettings = true
      }) {
          Image(systemName: "wrench")
      })
      .sheet(isPresented: $isSettings) {
          NavigationView {
            SettingsView(theColorScheme: $theColorScheme, systemColorScheme: systemColorScheme)
              .navigationBarItems(trailing: Button(action: {
                isSettings = false
            }) {
//                Image(systemName: "xmark")
            })
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

struct HomeView_Previews: PreviewProvider {
  static var previews: some View {
    Group{
      HomeView(theColorScheme: .dark, systemColorScheme: .dark)
      HomeView(theColorScheme: .light, systemColorScheme: .light)
    }
      
    
  }
}
