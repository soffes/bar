import Foundation

struct Cocktail: Codable {

	// MARK: - Properties

    let id: String
	let title: String
	let subtitle: String
    
    // MARK: - Loading Recipies
    
    func loadRecipe() -> String? {
        let path = Bundle.main.path(forResource: id, ofType: "txt", inDirectory: "Data")
        return path.flatMap { try? String(contentsOfFile: $0, encoding: .utf8) }
    }
}
