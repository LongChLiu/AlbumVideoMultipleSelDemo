# AlbumVideoMultipleSelDemo

`AlbumVideoMultipleSelDemo` 是一个视频多选控件。源自优秀源码`ZYImagePickerAndBrower。`加以个人修改而成。

![image](https://github.com/LongChLiu/AlbumVideoMultipleSelDemo/blob/master/imagePicker.jpeg){:height="607" width="358"}

## Requirements

`AlbumVideoMultipleSelDemo`   支持iOS8+

* Photo.framework
* UIKit.framework

## 功能支持
==============
- **相册视频序号多选**


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
