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
