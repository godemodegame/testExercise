import Foundation

class TableViewCellViewModel: TableViewCellViewModelType {
    
    private var item: Item
    
    var imageData: Data? {
        guard let url = item.data.url,
            let data = try? Data(contentsOf: url) else { return nil }
        return data
    }
    
    var name: String {
        guard let text = item.data.text else { return "" }
        return text
    }
    
    var rowsCount: Int {
        guard let options = item.data.variants else { return 0 }
        return options.count
    }
    
    var arrayForPickerView: [String]? {
        guard let options = item.data.variants else { return nil }
        var textArray: [String] = []
        for option in options {
            textArray.append(option.text)
        }
        return textArray
    }
    
    var title: String {
        return item.name
    }
    
    init(item: Item) {
        self.item = item
    }
}

