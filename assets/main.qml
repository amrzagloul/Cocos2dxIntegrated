// Default empty project template
import bb.cascades 1.0

// creates one page with a label
Page {
    Container {
        layout: DockLayout {}
        
        Label {
            text: qsTr("cocos2dx in Cascades!")
            textStyle.base: SystemDefaults.TextStyles.BigText
            verticalAlignment: VerticalAlignment.Top
            horizontalAlignment: HorizontalAlignment.Center
        }

        ForeignWindowControl {
            id: myForeignWindow
            objectName: "myForeignWindow"
            windowId: "MyForeignWindowId"
            preferredHeight: 700
            preferredWidth: 700
            horizontalAlignment: HorizontalAlignment.Center
            verticalAlignment: VerticalAlignment.Center            
        }       
    }
}

