import SwiftUI

struct CocktailView: View {

    // MARK: - Properties

    private let cocktail: Cocktail
    private let recipe: String

    // MARK: - Initializers

    init(_ cocktail: Cocktail) {
        self.cocktail = cocktail
        self.recipe = cocktail.loadRecipe()!
    }

    // MARK: - View

    var body: some View {
        VStack {
            Text(recipe)
                .padding()
            Spacer()
        }.navigationBarTitle(Text(cocktail.title), displayMode: .inline)
    }
}

#if DEBUG
struct CocktailView_Previews: PreviewProvider {
    static var previews: some View {
        CocktailView(.oldFashioned)
    }
}
#endif
