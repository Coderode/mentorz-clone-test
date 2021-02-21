

import UIKit

class CollectionCellVC: UICollectionViewCell {
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var label: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        image.contentMode = .scaleAspectFit
    }
}
