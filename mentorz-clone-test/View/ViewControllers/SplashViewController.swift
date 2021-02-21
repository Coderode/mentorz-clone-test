import UIKit
class SplashViewController: UIViewController {
    @IBOutlet weak var orLeft: UIView!
    
    @IBOutlet weak var orRight: UIView!
    
    @IBOutlet weak var orLabel: UILabel!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    var imageCollection : [UIImage] = [UIImage(named: "logo-1")!,UIImage(named: "2_img")!,UIImage(named: "3_img")!,UIImage(named: "4_img")!]
    var labelCollection : [String] = ["Expand your horizons","Match with mentors with the expertise you need","Become a mentor and help others grow","Connect and learn"]
    var x = 1
    override func viewDidLoad() {
        super.viewDidLoad()
        orLeft.addTopBorderWithColor(color: .white, width: 1)
        orRight.addTopBorderWithColor(color: .white, width: 1)
        orLabel.textColor = .white
        collectionView.delegate = self
        collectionView.backgroundColor = UIColor.clear
        collectionView.isScrollEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isPagingEnabled = true
        collectionView.contentMode = .scaleToFill
        
        pageControl.numberOfPages = 4
        pageControl.backgroundStyle = .automatic
        pageControl.currentPage = 0
        pageControl.currentPageIndicatorTintColor = .white
        pageControl.pageIndicatorTintColor = .lightGray
        setTimer()
    }
    
    // add timer for auto scrolling
    func setTimer() {
        let _ = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.autoScroll), userInfo: nil,
  repeats: true)
    }
    
    // create auto scroll
    @objc func autoScroll() {
        self.pageControl.currentPage = x
        if self.x < 4 {
            let indexPath = IndexPath(item: x, section: 0)
            self.collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            self.x = self.x + 1
        } else {
            self.x = 0
            self.collectionView.scrollToItem(at: IndexPath(item: 0, section: 0), at: .centeredHorizontally, animated: true)
        }
    }
    
    
}
extension SplashViewController : UICollectionViewDelegate, UICollectionViewDataSource{
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as? CollectionCellVC
        cell?.image.image = imageCollection[indexPath.row]
        cell?.label.text = labelCollection[indexPath.row]
        return cell!
    }
    
}

