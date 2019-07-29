import SwiftUI

struct CocktailCell: View {
    @State var cocktail: Cocktail

    var body: some View {
        VStack(alignment: .leading) {
            Text(cocktail.title)
                .font(.headline)
            Text(cocktail.description)
                .font(.subheadline)
                .lineLimit(2)
        }
    }
}

#if DEBUG
struct CocktailCell_Previews: PreviewProvider {
    static var previews: some View {
        CocktailCell(cocktail: .sample)
    }
}
#endif
