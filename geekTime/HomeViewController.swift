//
//  HomeViewController.swift
//  geekTime
//
//  Created by lsaac on 2022/3/6.
//

import UIKit
import Kingfisher

class HomeViewController: BaseViewController,BannerViewDelegte,BannerViewDateSource, CommonListDelegate {
    func didSelectBanner(_ bannerView: BannerView, index: Int) {
        
    }
    
    func didSelectedItem<Item>(_ item: Item) {
        if let product = item as? Product{
             let detailVC = DetailViewController()
            detailVC.product = product
            detailVC.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(detailVC, animated: true)
        }
    }
    
    
//    override func view(_ animated: Bool) {
//        super.viewDidAppear(animated)
//    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        hidesBottomBarWhenPushed = false
    }
    
    
    
    func didSelectProduct(product: Product) {
        let detailVC = DetailViewController()
        detailVC.product = product
        detailVC.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
    func numberOfBanners(_ bannerView: BannerView) -> Int {
        FakeData.createBanners().count
    }
    
    func viewForBanner(_ bannerView: BannerView, index: Int, convertView: UIView?) -> UIView {
        if let view = convertView as? UIImageView {
            view.kf.setImage(with: URL(string: FakeData.createBanners()[index]))
            return view
        }else{
            let imageView = UIImageView()
            imageView.contentMode = .scaleAspectFit
            imageView.clipsToBounds = true
            imageView.kf.setImage(with: URL(string: FakeData.createBanners()[index]))
            return imageView
        }
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        let bannerView = BannerView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 176))
        bannerView.autoScrollInterval = 2
        bannerView.dataSource = self
        bannerView.isInfiniteL = true
        view.addSubview(bannerView)
        let productList = CommonList<Product,ProductCell>(frame: .zero)
        productList.delegate = self
        productList.items = FakeData.createProducts()
        view.addSubview(productList)
        productList.snp.makeConstraints { make in
            make.left.right.bottom.equalToSuperview()
            make.top.equalTo(bannerView.snp_bottom).offset(5)
        }
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
