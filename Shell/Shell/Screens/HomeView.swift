import SwiftUI

struct HomeView: View {
  
  init(){
      UITableView.appearance().backgroundColor = Color(.bg).uiColor()
    UITableViewCell.appearance().backgroundColor = Color(.bg).uiColor()
      UITableView.appearance().tableFooterView = UIView()
  }
  
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
    }
  }
}

struct HomeView_Previews: PreviewProvider {
  static var previews: some View {
    ForEach(ColorScheme.allCases.reversed(), id: \.self) {
      HomeView().preferredColorScheme($0)
    }
  }
}
