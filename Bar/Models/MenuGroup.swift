import Foundation

struct MenuGroup: Decodable {

    // MARK: - Properties

    var title: String
    var cocktails: [Cocktail]

    static var all: [MenuGroup] = {
        guard let path = Bundle.main.path(forResource: "Cocktails", ofType: "json", inDirectory: "Data"),
            let data = try? Data(contentsOf: URL(fileURLWithPath: path)),
            let sections = try? JSONDecoder().decode([MenuGroup].self, from: data) else
        {
            assertionFailure("Failed to load cocktails")
            return []
        }

        return sections
    }()
}
