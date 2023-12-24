import router from '@ohos.router'
import web_webview from '@ohos.web.webview'
@Entry
@Component
struct WebTest {
  private webViewController: web_webview.WebviewController = new web_webview.WebviewController()

  // 生命需要注册的对象 用于网页掉web
  testObj = {
    test: () => {
      return 'ArkTS Hello World'
    }
  }

  build() {
    Column() {
      Button('点击返回')
        .onClick(() => {
          router.back()
        })

      // 想要加载网络资源，需要配置网络权限 module.json5 文件里的 requestPermissions 添加 ohos.permission.INTERNET 获取网络权限
      // 本地网页需要将.html文件放到resource/rawfile下，使用时通过 $rawfile('a.html')
      // 加载html格式的文本数据
      /*
       * try {
            // 点击按钮时，通过loadData，加载HTML格式的文本数据
            this.controller.loadData(
              '<html><body bgcolor=\"white\">Source:<pre>source</pre></body></html>',
              'text/html',
              'UTF-8'
            );
          } catch (error) {
            console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
          }
       * */
      Web({ src: 'www.baidu.com', controller: this.webViewController })
        .width('100%')
        .height(300)
        // 深色模式
        .darkMode(WebDarkMode.On)
        // 强制深色模式 不跟随前端页面和系统, 需要将darkMode设置成on
        .forceDarkAccess(true)
        // 上传文件
        .onShowFileSelector((event) => {
          // 开发者设置要上传的文件路径
          // <input type="file" value="file">
          let fileList: Array<string> = [
            'xxx/test.png'
          ]
          event.result.handleFileList(fileList)
          return true
        })
        // 新矿口中打开页面
        // 允许网页在新窗口打开
        /*
         * function OpenNewWindow()
          {
              let openedWindow = window.open("about:blank", "", "location=no,status=no,scrollvars=no");
              if (openedWindow) {
                  openedWindow.document.body.write("<p>这是我的窗口</p>");
              } else {
                  log.innerHTML = "window.open failed";
              }
          }
         * */
        .multiWindowAccess(true)
        .onWindowNew((event) => {
          var popController: web_webview.WebviewController = new web_webview.WebviewController()
          // 开发者需要在此处新建窗口,跟popController关联，并且将popController返回给Web组件。如果不需要打开新窗口请将返回值设置为event.handler.setWebController(null);
          event.handler.setWebController(popController);
        })
        // 管理位置权限 需要申请定位权限
        /*
         * <script>
            var locationInfo=document.getElementById("locationInfo");
            function getLocation(){
              if (navigator.geolocation) {
                <!-- 前端页面访问设备地理位置 -->
                navigator.geolocation.getCurrentPosition(showPosition);
              }
            }
            function showPosition(position){
              locationInfo.innerHTML="Latitude: " + position.coords.latitude + "<br />Longitude: " + position.coords.longitude;
            }
          </script>
         * */
        .onGeolocationShow((event) => {
          AlertDialog.show({
            title: '位置权限请求',
            message: '是否允许获取位置信息',
            primaryButton: {
              value: 'cancel',
              action: () => {
                event.geolocation.invoke(event.origin, false, false);   // 不允许此站点地理位置权限请求
              }
            },
            secondaryButton: {
              value: 'ok',
              action: () => {
                event.geolocation.invoke(event.origin, true, false);    // 允许此站点地理位置权限请求
              }
            },
            cancel: () => {
              event.geolocation.invoke(event.origin, false, false);   // 不允许此站点地理位置权限请求
            }
          })
        })
        // 网页掉web, 将对象注入到web
        /*
         * <script>
              function callArkTS() {
                  let str = objName.test();
                  document.getElementById("demo").innerHTML = str;
                  console.info('ArkTS Hello World! :' + str);
              }
          </script>
         * */
        .javaScriptProxy({
          object: this.testObj,
          name: 'testObjName',
          methodList: ["test"],
          controller: this.webViewController
        })


      Button('点击加载新的网页')
        .onClick(() => {
          this.webViewController.loadUrl('www.qq.com')

          // 调用网页JS
          /*
           * <script>
                function htmlTest() {
                    console.info('JavaScript Hello World! ');
                }
            </script>
           * */
          this.webViewController.runJavaScript('htmlTest()')
          
          // 根据点击事件在注册
          try {
            this.webViewController.registerJavaScriptProxy(this.testObj, "objName", ['test'])
          } catch (error) {
            console.error(`ErrorCode: ${error.code}, Message: ${error.message}`)
          }

          // 使用registerJavaScriptProxy()接口注册方法时，注册后需调用refresh()接口生效。
          this.webViewController.refresh()
        })
    }
  }
}