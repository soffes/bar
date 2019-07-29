import Foundation

struct Cocktail: Codable {

	// MARK: - Properties

    let identifier: String
	let title: String
	let description: String

    var recipe: String? {
        let cache = type(of: self).cache
        let key = NSString(string: identifier)

        if let recipe = cache.object(forKey: key) {
            return String(recipe)
        }

        if let url = Bundle.main.url(forResource: identifier, withExtension: "txt"),
            let recipe = try? String(contentsOf: url)
        {
            cache.setObject(NSString(string: recipe), forKey: key)
            return recipe
        }

        return nil
    }

    private static let cache = NSCache<NSString, NSString>()
    
    // MARK: - Loading Recipies
    
    func loadRecipe() -> String? {
        let path = Bundle.main.path(forResource: identifier, ofType: "txt", inDirectory: "Data")
        return path.flatMap { try? String(contentsOfFile: $0, encoding: .utf8) }
    }
}

#if DEBUG
extension Cocktail {
    static let sample = Cocktail(identifier: "OldFashioned", title: "Old Fashioned", description: "Classic Bourbon cocktail with 10-year old Eagle Rare, bitters, and hints of orange.")
}
#endif
