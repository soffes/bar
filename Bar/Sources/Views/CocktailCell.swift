import SwiftUI

struct CocktailCell: View {

    // MARK: - Properties

    private let cocktail: Cocktail

    // MARK: - Initializers

    init(_ cocktail: Cocktail) {
        self.cocktail = cocktail
    }

    // MARK: - View

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(cocktail.title).font(.headline)
            Text(cocktail.subtitle).font(.callout)
        }.padding(EdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 0))
    }
}

#if DEBUG
struct CocktailCell_Previews: PreviewProvider {
    static var previews: some View {
        List {
            CocktailCell(.oldFashioned)
        }.listStyle(GroupedListStyle())
    }
}
#endif
