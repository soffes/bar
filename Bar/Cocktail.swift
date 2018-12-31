import Foundation

struct Cocktail {

	// MARK: - Properties

	let title: String
	let subtitle: String


	// MARK: - Initializers

	init?(dictionary: [String: String]) {
		guard let title = dictionary["title"], let subtitle = dictionary["subtitle"] else { return nil }
		self.title = title
		self.subtitle = subtitle
	}
    
    
    // MARK: - Loading Recipies
    
    func loadRecipe() -> String? {
        let path = Bundle.main.path(forResource: title, ofType: "txt", inDirectory: "Data")
        return path.flatMap { try? String(contentsOfFile: $0, encoding: .utf8) }
    }
}
