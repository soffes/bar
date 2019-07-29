struct MenuSection: Codable {
    var title: String
    var cocktails: [Cocktail]
}

#if DEBUG
extension MenuSection {
    static let sample = MenuSection(title: "Sam’s Favorite", cocktails: [.sample])
}
#endif
