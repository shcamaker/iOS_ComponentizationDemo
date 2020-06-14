# iOS_ComponentizationDemo
iOS组件化的实践，组件间通信的实践，有详细的博客：https://www.jianshu.com/nb/30097317 ，有帮助到你的话，求给个小心心哦❤️。


# 组件化实现方案

## 什么是组件化

组件化就是将APP拆分成各个组件，同时解除这些模块之间的耦合，然后通过主工程将项目所需要的组件组合起来。这样组件化过后的项目就变成了很多小模块，如果新项目中有类似的需求，直接将模块引入稍作修改就能使用了。这种设计类似引入三方库，其实制作组件的过程就相当于做三方库。因此常见的组件化方案大多都是使用cocoapods做依赖管理。

## 为什么要组件化

主要有4个原因：

- 模块间解耦

- 模块重用

- 提高团队协作开发效率

- 单元测试

当项目越来越大的时候，各个模块之间如果是直接互相引用，就会产生许多耦合，导致接口滥用，当某天需要进行修改时，就会牵一发而动全身，难以维护，所以要组件化。

## 组件化整个流程图


![](流程图.png)

## 组件分类

- 基础组件： 基础配置(宏，常量)， 分类，网络(AFN, SDW二次封装)、工具类(日期时间的处理， 文件处理， 设备处理)。

- 功能组件：支付，三方登录，分享，常用控件(弹幕，轮播器，选项卡)；功能(断点续传，音频处理)。

- 业务组件：登录，首页。

分层可以最大限度的避免复杂的耦合，减少组件化时的困难，而且在分层设计时要保持上层对下层的单项依赖。

![](1477238-31bf6b01c62c4082.png)


分层要求：

1.基础库应当做到互相独立，除了依赖于系统框架和一些非常主流的三方框架外，不对其他代码做任何依赖，每个库都可以独立通过单元测试。

2.业务库也就是功能组件虽然包含一定对业务逻辑，但是其中的业务逻辑应当是较大范围内都通用的业务逻辑，比如三方登陆、分享、支付库的调用业务。也就是说这一块的库应当是可以在同公司多个app中通用的。

3.业务组件则是对业务模块的封装，所谓的组件化颗粒度一般指的就是这一层的封装颗粒度，理论上颗粒度做到每个页面是最理想的情况，但实际情况总是千变万化的，某些页面的耦合度可能会非常高，拆分的代价太大，得不偿失。那么我们完全可以将颗粒度稍微放粗一些，将有紧密业务联系的页面组成一个组件，然后暴露使用这个组件的接口即可。


## 组件间通信

本Demo采用XCoordinator和CTMediator来实现通信的。这样做的好处是：各组件间相互隔离解耦，而且与中间件也没有耦合关系，组件里需要跳转的部分被coordinator接管，coordinator中跳转的地方只需要调用中间件的方法，通过runtime来完成真正的调用。

![](1477238-040d35104366977f.png)



CTMediator+Login：

```
import CTMediator

private let loginKitName = "SFCloudMusicLoginKit"
private let loginTargetName = "Login"
private let loginViewControllerActionName = "loginViewController"

public extension CTMediator {
    func loginViewController(loginBlock: Any) -> UIViewController? {
        let params = ["callback" : loginBlock,
        kCTMediatorParamsKeySwiftTargetModuleName:loginKitName] as [AnyHashable:Any]
         let viewController = self.performTarget(loginTargetName, action: loginViewControllerActionName, params: params, shouldCacheTarget: false) as? UIViewController
        return viewController
    }
}
```
需要注意的是：kCTMediatorParamsKeySwiftTargetModuleName 对应的value是调用的组件名，比如我要调用登录组件，从而获取其中的登录控制器loginViewController，那这里的组件名就是SFCloudMusicLoginKit。写错了会调用不成功，oc的用法不需要这个，可以参考CTMediator提供的Demo。

组件中的跳转逻辑通过block抽到了coordinator中:

![](1477238-a0a8489a681e5551.png)



## 组件化实践(抽取基础组件)

#### 一. 创建远程索引库

每创建一个组件都会带有一个 xxx.podspec 的索引文件。专门用来存放这些索引文件的库就叫做索引库。我们需要将这些索引文件上传到远程索引库才能保证其他的同事能够拿来用。

![](1477238-1378cb3cfe12a9eb.png)

#### 二. 创建本地索引库

通过pod repo add '本地索引库的名字' '远程索引库的地址' ，来创建本地索引库并和远程索引库做关联，建议本地索引库的名字和远程索引库保持一致。

![](1477238-f736a747b55f4f02.png)

#### 三. 创建远程代码库

创建远程代码库来存放组件代码，与创建远程索引库的方式一样。

#### 四. 创建本地模版库

我们可以专门新建个本地目录用来存放各组件，作为模版库。将组件都放到LocalLibs目录下。

![](1477238-a6f850e5b1795d2c.png)

cd到LocalLibs目录下，通过pod lib create '组件名' 来创建本地模版库。

根据自身需求对下面的提示信息做选择:

![](1477238-1d0c8bb905874558.png)

本地模版库已经创建成功后，将组件代码抽到Classes文件中：

![](1477238-f098068b8c5abb10.png)

#### 五. 修改spec文件：

![](1477238-f1b55d2a9f72eb4c.png)

提交上面修改并推送到远程代码仓库, 打上与spec文件中相同的tag：

```
git add .
git commit -m 'message'
git remote add origin 组件远程代码仓库地址
git push origin master
git tag 'tag号'
git push --tags
```
本地验证:

```
pod lib lint --verbose --allow-warnings
```
远程验证：

```
pod spec lint --verbose --allow-warnings
```

提交本地spec文件:

```
pod repo push <本地索引库名> <带后缀索引文件名> --verbose --allow-warnings
```
 
提交本地spec文件会自动将spec文件推送到远程，所以此时组件已经上传成功，可以在宿主工程中使用了！


## 组件化遇到的问题总结


#### 1. XiB和storyboard的依赖问题

XiB和storyboard被抽成组件放到Pods文件夹中后，就不在mainBundle中了，需要找到当前类所在bundle来加载：

![](1477238-dcbed4c2fb161f70.png)


#### 2. 图片资源依赖问题

图片资源也是一样，抽到组件中后就不在mainBundle中了，不能从mainBundle中加载出来了，也存在图片资源依赖问题，解决此问题步骤如下：

###### 2.1 将图片资源拖到本地模版库与Classes同级的文件夹Assets中：

![](1477238-4bfe4b72eb71c604.png)

###### 2.2 修改spec文件，设置资源加载路径，到测试工程中install安装。

###### 2.3 改变加载方式：

```
func imagePath(imageName: String, imageFormat: String) -> UIImage{
        let bundle = Bundle(for: SFDiscoverCycleScrollCell.self)
        let fullImageName = "\(imageName)@2x.\(imageFormat)"
        guard let path  = bundle.path(forResource: fullImageName, ofType: nil, inDirectory: "SFCloudMusicDiscoverKit.bundle"), let image  = UIImage(contentsOfFile: path) else {
            return UIImage()
        }
        return image
}
```

要注意的是：mainBundle会识别图片的尺寸和格式，而自定义bundle不会，所以这里图片的全名要包含尺寸和后缀，而且path也要指定图片所在bundle包名。

#### 3. 对其他组件的依赖

如果某个业务组件对其他组件有依赖，在验证本地模版库时会报以下错误：

![](1477238-d561ae0718203bb0.png)

这是因为验证podspec文件时默认只会到官方索引库 (https://github.com/CocoaPods/Specs.git）中去校验，而我们的业务组件中依赖了的其他组件，需要同时指定自己创建的远程索引库地址库中校验。解决办法如下：

```
pod lib lint --verbose --allow-warnings --sources='https://github.com/shcamaker/SFCloudMusicBaseKitSpec.git,https://github.com/CocoaPods/Specs.git'
```

#### 4.分支

有时某个组件库中可以开多个分支，方便我们导入使用时，不用集成那些我们不需要的分支内容，开分支的写法可参考如下：

```
# s.source_files = 'SFCloudMusicBaseKit/Classes/**/*'

  s.subspec 'Extensions' do |e|
      e.source_files = 'SFCloudMusicBaseKit/Classes/Extensions/**/*'
  end

  s.subspec 'Utils' do |u|
       u.source_files = 'SFCloudMusicBaseKit/Classes/Utils/**/*'
       u.dependency 'SDWebImage'
  end
  ```


