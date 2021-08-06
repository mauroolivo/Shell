import SwiftUI

struct SheetButtonsView: View {
  var body: some View {
    ZStack {
      Color(.bg).edgesIgnoringSafeArea(.all)
      ScrollView {
        VStack {
          VStack {
            Btn(title: "ButtonMain .primary", type: .primary, disclosure: Image(systemName: "chevron.right")) {
              print("tap")
            }.padding([.horizontal])
            
            Btn(title: "ButtonMain .secondary", type: .secondary, disclosure: nil) {
              print("tap")
            }.padding([.horizontal])
            
            Btn(title: "ButtonMain .destructive", type: .destructive, disclosure: nil) {
              print("tap")
            }.padding([.horizontal])
          }
          VStack {
            Btn(title: "ButtonMain .primary", type: .primary, disclosure: nil) {
              print("tap")
            }.padding([.horizontal]).disabled(true)
            
            Btn(title: "ButtonMain .secondary", type: .secondary, disclosure: nil) {
              print("tap")
            }
            .padding([.horizontal])
            .disabled(true)
            
            Btn(title: "ButtonMain .destructive", type: .destructive, disclosure: nil) {
              print("tap")
            }
            .padding([.horizontal])
            .disabled(true)
          }.padding([.vertical])
          HStack {
            Btn(title: "Button", type: .primaryOutlined, disclosure: nil) {
              print("tap")
            }.padding([.horizontal])
            
            Btn(title: "Button", type: .secondaryOutlined, disclosure: nil) {
              print("tap")
            }.padding([.horizontal])
            
            Btn(title: "Button", type: .destructiveOutlined, disclosure: nil) {
              print("tap")
            }.padding([.horizontal])
          }
          HStack {
            Btn(title: "Button", type: .primaryOutlined, disclosure: nil) {
              print("tap")
            }
            .padding([.horizontal])
            .disabled(true)
            
            Btn(title: "Button", type: .secondaryOutlined, disclosure: nil) {
              print("tap")
            }
            .padding([.horizontal])
            .disabled(true)
            
            Btn(title: "Button", type: .destructiveOutlined, disclosure: nil) {
              print("tap")
            }
            .padding([.horizontal])
            .disabled(true)
          }
        
        }
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ForEach(ColorScheme.allCases.reversed(), id: \.self) {
      SheetButtonsView().preferredColorScheme($0)
    }
  }
}
