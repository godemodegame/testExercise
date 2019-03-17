import Foundation

class TableViewModel: TableViewViewModelType{
    
    // Decode json
    var json: Json? {
        guard let data = try? Data(contentsOf: urlToData),
            let json = try? JSONDecoder().decode(Json.self, from: data) else { return nil }
        return json
    }
    
    var itemNames: [String] {
        var array: [String] = []
        guard let json = json else { return [] }
        for name in json.view {
            array.append(name)
        }
        return array
    }
    
    var items: [Item] {
        var array: [Item] = []
        guard let json = json else { return [] }
        for name in json.view {
            for item in json.data {
                if item.name == name {
                    array.append(item)
                }
            }
        }
        return array
    }
    
    // Count how many elements in array to display
    func numberOfRows() -> Int {
        return items.count
    }
    
    // Making cells with cell view model
    func cellViewModel(forIndexPath indexPath: IndexPath) -> TableViewCellViewModelType? {
        let item = items[indexPath.row]
        return TableViewCellViewModel(item: item)
    }
}
