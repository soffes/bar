import SwiftUI

struct MenuView: View {
    let menu: [MenuSection]
    var body: some View {
        List {
            Section(header: Text("Sam’s Favorite")) {
                CocktailCell(title: "Old Fashioned", description: "Classic Bourbon cocktail with 10-year old Eagle Rare, bitters, and hints of orange.")
            }
        }
    }
}

#if DEBUG
struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
#endif
