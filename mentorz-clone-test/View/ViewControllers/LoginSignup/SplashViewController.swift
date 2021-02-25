import UIKit
public class SplashViewController: UIViewController {
    @IBOutlet weak var orLeft: UIView!
    @IBOutlet weak var orRight: UIView!
    @IBOutlet weak var orLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var signupButton: ButtonView!
    @IBOutlet weak var loginPageSwitchButton: BottomSwitchButton!
    @IBOutlet weak var bottomLinkButton: BottomLinkButton!
    @IBOutlet weak var facebookButton: SocialLoginButton!
    @IBOutlet weak var linkedinButton: SocialLoginButton!
    @IBOutlet weak var appleButton: SocialLoginButton!
    var imageCollection : [UIImage] = [UIImage(named: "logo-1")!,UIImage(named: "2_img")!,UIImage(named: "3_img")!,UIImage(named: "4_img")!]
    var labelCollection : [String] = ["Expand your horizons","Match with mentors with the expertise you need","Become a mentor and help others grow","Connect and learn"]
    
    
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        orLeft.addTopBorderWithColor(color: .white, width: 1)
        orRight.addTopBorderWithColor(color: .white, width: 1)
        orLabel.textColor = .white
        self.setSocialButtonType()
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        //let width = collectionView.frame.size.width
        //let height = collectionView.frame.size.height
        //layout.sectionInset = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
        //layout.itemSize = CGSize(width: width, height: height)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        layout.scrollDirection = .horizontal
        collectionView!.collectionViewLayout = layout
        
        collectionView.register(UINib(nibName: "BottomLabelCollectionCell", bundle: .main), forCellWithReuseIdentifier: "BottomLabelCollectionCell")
        
        collectionView.register(UINib(nibName: "TopLabelCollectionCell", bundle: .main), forCellWithReuseIdentifier: "TopLabelCollectionCell")

        
        collectionView.delegate = self
        collectionView.dataSource = self
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
        
        //actions
        loginPageSwitchButton.addTarget(self, action: #selector(loginPageSwitchButtonTapped), for: .touchUpInside)
        signupButton.addTarget(self, action: #selector(signupButtonTapped), for: .touchUpInside)
        
        setTimer()
    }
    
    // add timer for auto scrolling
    func setTimer() {
        let _ = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.autoScroll), userInfo: nil,
  repeats: true)
    }
    
    // create auto scroll
    @objc func autoScroll() {
        
        if pageControl.currentPage == pageControl.numberOfPages-1 {
            pageControl.currentPage = 0
            let indexPath = IndexPath(item: 0, section: 0)
            self.collectionView.scrollToItem(at: indexPath, at: .right, animated: true)
        } else {
            pageControl.currentPage += 1
            let indexPath = IndexPath(item : pageControl.currentPage, section: 0)
            self.collectionView.scrollToItem(at: indexPath, at: .left, animated: true)
        }
    }
    
    @objc func loginPageSwitchButtonTapped(){
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "LoginPageVC") as! LoginPageVC
        nextViewController.modalPresentationStyle = .fullScreen
        self.present(nextViewController, animated: false, completion: nil)
    }
    
    @objc func signupButtonTapped(){
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "SignupPageVC") as! SignupPageVC
        nextViewController.modalPresentationStyle = .fullScreen
        self.present(nextViewController, animated: false, completion: nil)
    }
    
    
    func setSocialButtonType(){
        self.facebookButton.type = .facebook
        self.linkedinButton.type = .linkedin
        self.appleButton.type = .apple
    }
    
    
}


extension SplashViewController : UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        print(indexPath.row)
        if indexPath.row == 0 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BottomLabelCollectionCell", for: indexPath) as? BottomLabelCollectionCell else { return UICollectionViewCell() }
            cell.setData(imageCollection[indexPath.row], labelCollection[indexPath.row])
            return cell
        }else{
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TopLabelCollectionCell", for: indexPath) as? TopLabelCollectionCell else { return UICollectionViewCell() }
            cell.setData(imageCollection[indexPath.row], labelCollection[indexPath.row])
            return cell
        }
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    }

    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width-10, height: collectionView.frame.size.height-10)
    }

    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 4
    }
    
}

