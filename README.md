# ZYImagePickerAndBrower

`ZYImagePickerAndBrower` 是一个模仿微信相册多选照片的一个控件。注意了微信相册的一些细节，比如序号，最大选择之后照片变灰，浏览缩略图等等。

![image](https://github.com/RainManGO/ZYImagePickerAndBrower/blob/master/imagePickerDemo1.jpeg)

## Requirements

`ZYImagePickerAndBrower`   支持iOS8+

* Photo.framework
* UIKit.framework

## 功能支持
==============
- **相册视频序号多选**: 微信样式多选


## 使用

设置主题颜色

```swift 
ZYPhotoAlbumSkinColor = UIColor.orange
```

选照片

```swift 
 let photoAlbumVC = ZYPhotoNavigationViewController(photoAlbumDelegate: self, photoAlbumType: .selectPhoto)    //初始化需要设置代理对象
        photoAlbumVC.maxSelectCount = 9   //最大可选择张数
        self.navigationController?.present(photoAlbumVC, animated: true, completion: nil)
```

ZYPhotoAlbumProtocol回调

```swift 
 func photoAlbum(selectPhotos: [ZYPhotoModel]) {
        //选择的照片之后去layoutView显示
        let imageArray = selectPhotos.map { (model) -> UIImage in
            return model.thumbnailImage!
        }
        imagePickerView.dataSource = imageArray
        imagePickerView.numberOfLine = 4
        imagePickerView.reloadView()
        imagePickerView.addCallBack = { () in
            self.goPickerController()
        }
 }
```