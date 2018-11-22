//
//  ZYPhotoAlbumListViewController.swift
//  ZYImagePickerAndBrower
//
//  Created by Nvr on 2018/8/17.
//  Copyright © 2018年 ZY. All rights reserved.
//

import UIKit
import Photos

class ZYPhotoAlbumListViewController: ZYBaseViewController{
    
    weak var photoAlbumDelegate: ZYPhotoAlbumProtocol?
    
    private var albumsList: [(assetCollection:PHAssetCollection, assetsFetchResult: PHFetchResult<PHAsset>)] = []
    
    deinit {
        if ZYPhotoAlbumEnableDebugOn {
            print("=====================\(self)未内存泄露")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.initNavigation()
    }
    
    //  MARK: - private method
    private func initNavigation() {
        self.setNavTitle(title: "照片")
        self.setRightTextButton(text: "取消", color: UIColor.white)
        self.view.bringSubview(toFront: self.naviView)
    }
    
    override func rightButtonClick(button: UIButton) {
        self.navigationController?.dismiss(animated: true)
    }
    
}

private class ZYAlbumCell: UITableViewCell {
    
    var albumImage: UIImage? {
        didSet {
            albumImageView.asyncSetImage(albumImage)
        }
    }
    
    var albumName: String? {
        didSet {
            albumNameLabel.text = albumName
        }
    }
    
    private lazy var cutLine: UIView = {
        let line = UIView()
        line.backgroundColor = UIColor(white: 223/255.0, alpha: 1)
        return line
    }()
    
    private let albumImageView = UIImageView()
    private let albumNameLabel = UILabel()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.accessoryType = .disclosureIndicator
        albumImageView.contentMode = .scaleAspectFill
        albumImageView.clipsToBounds = true
        self.contentView.addSubview(albumImageView)
        self.contentView.addSubview(albumNameLabel)
        self.contentView.addSubview(cutLine)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let size = self.frame.size
        albumImageView.frame = CGRect(x: 0, y: 0, width: size.height, height: size.height)
        albumNameLabel.frame = CGRect(x: size.height+10, y: 0, width: 100, height: size.height)
        cutLine.frame = CGRect(x: 0, y: size.height-0.5, width: size.width, height: 0.5)
    }
}

