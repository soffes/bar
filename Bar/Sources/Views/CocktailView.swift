import SwiftUI

struct CocktailView: View {
    @State var title: String
    @State var recipe: String

    var body: some View {
        Text(recipe)
            .lineLimit(0)
            .multilineTextAlignment(.leading)
            .font(.body)
            .navigationBarTitle(title)
    }
}

#if DEBUG
struct CocktailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CocktailView(title: "Old Fashioned", recipe: "Hello")
        }
    }
}
#endif
