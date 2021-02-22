
import UIKit

class BottomLabelCollectionCell: UICollectionViewCell {

    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var image: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        label.font = UIFont.boldSystemFont(ofSize: CGFloat(27))
        label.textColor = UIColor.white
        label.textAlignment = .center
        label.numberOfLines = 0
    }
    
    func setData(_ imageName : UIImage,_ labelName : String){
        self.label.text = labelName
        self.image.image = imageName
    }
}
