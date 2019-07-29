import SwiftUI

struct MenuView: View {
    @State var sections: [MenuSection]

    var body: some View {
        List {
            ForEach(sections, id: \.title) { section in
                Section(header: Text(section.title)) {
                    ForEach(section.cocktails, id: \.identifier) { cocktail in
                        NavigationLink(destination: CocktailView(cocktail: cocktail)) {
                            CocktailCell(cocktail: cocktail)
                        }
                    }
                }
            }
        }
        .listStyle(.grouped)
        .navigationBarTitle("Menu")
    }
}

#if DEBUG
struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MenuView(sections: [.sample])
        }
    }
}
#endif
