import Foundation

protocol TableViewViewModelType {
    func numberOfRows() -> Int
    func cellViewModel(forIndexPath indexPath: IndexPath) -> TableViewCellViewModelType?
}
