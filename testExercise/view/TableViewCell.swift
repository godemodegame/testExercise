import UIKit


class TableViewCell: UITableViewCell, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var urlImageView: UIImageView!
    @IBOutlet weak var pickerView: UIPickerView!
    
    var title: String = ""
    var numberOfRows: Int = 0
    var arrayForPickerView: [String]?
    
    var viewModel: TableViewCellViewModelType? {
        willSet(viewModel) {
            guard let viewModel = viewModel else { return }
            nameLabel.text = viewModel.name
            if let data = viewModel.imageData {
                urlImageView.image = UIImage(data: data)
            }
            numberOfRows = viewModel.rowsCount
            if let array = viewModel.arrayForPickerView {
                arrayForPickerView = array
            }
            title = viewModel.title
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        guard let array = arrayForPickerView else { return nil }
        return array[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return numberOfRows
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
}
