import Foundation

protocol TableViewCellViewModelType: class {
    var name: String { get }
    var imageData: Data? { get }
    var rowsCount: Int { get }
    var arrayForPickerView: [String]? { get }
    var title: String { get }
}
