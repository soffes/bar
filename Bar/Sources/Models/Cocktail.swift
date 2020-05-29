import Foundation

struct Cocktail: Decodable {

	// MARK: - Properties

	var title: String
	var subtitle: String    
    
    // MARK: - Loading Recipies
    
    func loadRecipe() -> String? {
        let path = Bundle.main.path(forResource: title, ofType: "txt", inDirectory: "Data")
        return path.flatMap { try? String(contentsOfFile: $0, encoding: .utf8) }
    }
}

extension Cocktail: Identifiable {
    var id: String {
        title
    }
}

#if DEBUG
extension Cocktail {
    static let oldFashioned = Cocktail(title: "Old Fashioned", subtitle: "Classic Bourbon cocktail with 10-year old Eagle Rare, bitters, and hints of orange.")
}
#endif
