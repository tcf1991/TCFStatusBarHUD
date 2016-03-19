# TCFStatusBarHUD
一个非常简单易用的状态栏指示器
## 显示成功信息
...objc
    [TCFStatusBarHUD showSuccess:@"加载成功!"];
...
## 显示失败信息
...objc
    [TCFStatusBarHUD showError:@"加载失败!"];
...

## 显示加载信息
...objc
    [TCFStatusBarHUD showLoading:@"正在加载..."];
...

## 隐藏HUD
...objc
   [TCFStatusBarHUD hide];
... 

## 显示加载信息
...objc
    [TCFStatusBarHUD showMessage:@"一切正常"];
...
