//
//  PhotosGridController.swift
//  LikeFbApp
//
//  Created by 柿沼儀揚 on 2020/07/23.
//  Copyright © 2020 柿沼儀揚. All rights reserved.
//

import UIKit
import SwiftUI
import LBTATools

class PhotosGridCell: LBTAListCell <String> {
    
    override var item: String!{
        didSet{
            imageView.image = UIImage(named: item)
        }
    }
    
    let imageView = UIImageView(image: UIImage(named: "pic1"), contentMode: .scaleAspectFill)
    override func setupViews() {
        backgroundColor = .yellow
        //pic test code
        //        addSubview(imageView)
        //        imageView.fillSuperview()
        
        stack(imageView)
    }
}

class PhotosGridController: LBTAListController<PhotosGridCell, String> , UICollectionViewDelegateFlowLayout {
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .lightGray
        
        self.items = ["pic1","pic2","pic3","pic1","pic2"]
        
    }
    
    let cellSpacing: CGFloat = 4
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if self.items.count == 4{
//            do 4 grid cell layout
        }
        
        if indexPath.item == 0 || indexPath.item == 1{
            let width = (view.frame.width - 3 * cellSpacing) / 2
            return .init(width: width, height: width)
        }
        let width = (view.frame.width - 4 * cellSpacing) / 3
        return .init(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return cellSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return cellSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 0, left: cellSpacing, bottom: 0, right: cellSpacing)
    }
    
}

import SwiftUI
struct PhotoGridPreview: PreviewProvider {
    static var previews: some View {
        //                Text("PhotoGrid")
        ContainerView()
    }
    struct ContainerView: UIViewControllerRepresentable{
        
        func makeUIViewController(context: Context) -> UIViewController {
            return PhotosGridController()
        }
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
            
        }
    }
    
}


