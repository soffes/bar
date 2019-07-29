import SwiftUI

struct CocktailCell: View {
    @State var title: String
    @State var description: String

    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.headline)
            Text(description)
                .font(.subheadline)
                .lineLimit(2)
        }
    }
}

#if DEBUG
struct CocktailCell_Previews: PreviewProvider {
    static var previews: some View {
        CocktailCell(title: "Old Fashioned", description: "Classic Bourbon cocktail with 10-year old Eagle Rare, bitters, and hints of orange.")
    }
}
#endif
