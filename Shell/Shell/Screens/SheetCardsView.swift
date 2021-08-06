import SwiftUI

struct SheetCardsView: View {
  var body: some View {
    
    ZStack {
      Color.init("bg").edgesIgnoringSafeArea(.all)
      ScrollView {
        VStack {
          VStack {
            Card(title: "Card Title", hint: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi vitae ipsum odio. Curabitur nunc libero, congue a nisl id, tincidunt aliquet tortor. Proin bibendum nunc a orci gravida, vel maximus nisi tempus.", type: .plain, icon: Image(systemName: "mic.circle.fill")) {
              print("tap")
            }
            Card(title: "Card very long title on two lines", hint: nil, type: .plain, icon: Image(systemName: "sun.max.fill")) {
              print("tap")
            }
            Card(title: "Card disabled", hint: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi vitae ipsum odio.", type: .plain, icon: Image(systemName: "person.circle")) {
              print("tap")
            }.disabled(true)
          }
          .padding([.horizontal])
        }
      }
    }
  }
}

struct SheetCardsView_Previews: PreviewProvider {
  static var previews: some View {
    ForEach(ColorScheme.allCases.reversed(), id: \.self) {
      SheetCardsView().preferredColorScheme($0)
    }
  }
}
