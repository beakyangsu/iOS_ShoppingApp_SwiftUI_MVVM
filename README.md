Reference: https://www.youtube.com/watch?v=jp2PbpzdZ9A&t=4323s

# Shopping App Style UI Making Project with SwitfUI and MVVM 


<img width="40%" src="https://github.com/beakyangsu/iOS_ShoppingApp_SwiftUI_MVVM/assets/12162598/d7c652a5-82eb-4a31-9a4b-07df99e7dc10">

SwiftUI와 MVVM패턴을 활용하여 Shopping App Style 앱 디자인을 직접 만들어보는 프로젝트입니다. 현업에선 최소 iOS target이 14.0인 앱을 서비스하고있기때문에 Storyboard로만 프로젝트를 진행했었기 때문에 iOS 15.0 부터 사용할 수 있는 SwiftUI Skill을 쌓기 위해 시작한 프로젝트 입니다. 이를 통해 <span style="color:yellow">SwiftUI와 Storyboard를 비교</span> 해보고 어떤 Framework가 현업에 더 유리할지 분석해봤습니다. 


# Skills
![badge](https://img.shields.io/badge/SwiftUI%2B-green)
SwiftUI, Swift, MVVM, @EnvironmentObject

# What is My Role 
+ ViewModel과 data Model, View로 구성된 MVVM계층 구조를 설계하고 구현
+ 화면을 구성하는 UI Componets를 만들고 이를 조합하는 방식으로 View 구현. SwiftUI가 View구현을 효율적으로 만들어주는 가장 큰 이유이기도 합니다. Speed-up이 가능해집니다.


# What I learn? 
+ ### SwitfUI vs Storyboard
  + Storyboard와 SwiftUI는 눈으로 보면서 UI를 구현할 수 있다는 점은 동일했지만 Storyboard의 AutoLayout과 ViewController와 연결된 @IBOutlet은 UI업데이트가 잦은경우 수정
    중 기존@IBOutlet의 연결이 끊어져 APP Crash가 발생하거나 새로운 UI Components 추가시 기존 View들의 계층구조가 깨져서 AutoLayout를 새로 작업해야하는 상황이 종종 발생했습니다.
    또한 여러사람이 함께하는 프로젝트의 경우 AutoLayout구성여부를 코드로 작성한 부분과 Storyboard로 기입한 부분을 한눈에 catch-up하기 어려운 부분이 있어 별도의 설명없이 다른 사람이 바
    로 이어서 개발을 하기에 어려움이 있었습니다.
  + 반면 SwiftUI는 UI에 변경이 있더라도 기존뷰의 계층구조를 깨지않고 손쉽게 추가가 가능하고, @State, @ObservedObject등을 이용해 View와 Object의 상태변화를 Binding할 수 있어,
    Object 변화에 따른 별도 UI Update 코드가 필요하지않아 코드가 훨씬 깔끔하고, 가독성이 좋았습니다.

+ ### @EnvironmetObject vs @ObservedObject
  + @EnvironmetObject와 @ObservedObject는 둘다 여러 뷰에서 공통 data를 공유한다는점에서 동일합니다.
  + @EnvironmetObject는 최상위 뷰에서 변수를 선언하고 이후 의존성 주입(Dependency Injection)하면 이후 별도의 코드 추가 없이 모든 하위뷰에서 동일한 변수에 접근할수있으므로
    여러 뷰에서 공통적으로 사용되는 경우 @EnvironmetObject는사용하는것이 유리합니다. 이는 이번 프로젝트에서 ViewModel 변수를 여러뷰로 의존성 주입할때 @EnvironmetObject를 사용
    한 이유이기도 합니다.
  + @EnvironmetObject를 사용해 최상위뷰에서 의존성 주입할경우 WindowGroup이나 최상위 NavigationStack에서 이루어 질 수 있도록 주의해야합니다. 여러 pod로 구성된 대형 앱에서
    NavigationStack을 이용해 화면이 전환될경우 최상위 NavigationStack에서 @EnvironmetObject주입이 되어있지 않다면 하위뷰에서 해당변수를 찾을 수없기때문에 App Crash가 발생합
    니다.
  + @ObservedObject는 사용하는 뷰마다 변수를 전달해줘야해서 @EnvironmetObject보다 코드 구현이 길어지거나 복잡해보일 수 있습니다. 하지만 사용하는 뷰가 한정적일 경우
    ObservedObject로 전달하는것이 Data 흐름을 좀 더 명확하게 표현해줍니다.
  + 프로젝트의 설계상황에 맞게 적절한 사용이 필요합니다. 


