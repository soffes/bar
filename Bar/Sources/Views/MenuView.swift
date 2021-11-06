import SwiftUI

struct MenuView: View {

    // MARK: - Properties

    private let groups = MenuGroup.all

    // MARK: - View

    var body: some View {
        List {
            ForEach(groups) { group in
                Section(header: Text(group.title)) {
                    ForEach(group.cocktails) { cocktail in
                        NavigationLink(destination: CocktailView(cocktail)) {
                            CocktailCell(cocktail)
                        }
                    }
                }
            }
        }
        .listStyle(InsetGroupedListStyle())
        .navigationBarTitle("Menu")
    }
}

#if DEBUG
struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MenuView()
        }
    }
}
#endif
