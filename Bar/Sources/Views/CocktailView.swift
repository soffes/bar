import SwiftUI

struct CocktailView: View {
    @State var cocktail: Cocktail

    var body: some View {
        ScrollView {
            Text(cocktail.recipe ?? "Failed to load")
                .lineLimit(nil)
                .multilineTextAlignment(.leading)
                .font(.body)
                .padding()
        }
        .navigationBarTitle(cocktail.title)
    }
}

#if DEBUG
struct CocktailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CocktailView(cocktail: .sample)
        }
    }
}
#endif
