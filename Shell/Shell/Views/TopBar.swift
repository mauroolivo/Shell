import SwiftUI

struct TopBar: View {
    
    var title: String = ""
    var hideLeft: Bool = true
    var hideRight: Bool = true
    var onLeft: (() -> Void) = {}
    var onRight: (() -> Void) = {}
    var imgLeft: Image = Image(systemName: "chevron.left")
    var imgRight: Image = Image(systemName: "questionmark.circle")
    
    //Image(systemName: "xmark")
    
    var body: some View {
        
        HStack(alignment: .top, spacing: 0) {
            Button(action: onLeft, label: {
                imgLeft
                    .resizable()
                    .frame(width: 10, height: 20, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.gray).padding()
            })
            .frame(minWidth: 44, maxWidth: 44, maxHeight: 44)
            .isHidden(hideLeft)
            Text(title)
                .fontWeight(.bold)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 44, maxHeight: 44)
            Button(action: onRight, label: {
                imgRight
                    .resizable()
                    .frame(width: 20, height: 20, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.gray).padding()
            })
            .frame(minWidth: 44, maxWidth: 44, maxHeight: 44)
            .isHidden(hideRight)
        }
    }
}

struct NavBar_Previews: PreviewProvider {
    static var previews: some View {
        TopBar(title: "Title", hideLeft: false
        ).previewLayout(.fixed(width: 414, height: 44))
    }
}
