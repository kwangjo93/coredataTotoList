![‎코디네이터 다이어그램 ‎001](https://github.com/kwangjo93/coredataTotoList/assets/125628009/9de0a0c4-eb4c-4d44-bc09-582e549ea0e7)# 내일배움캠프 스파르타코딩클럽 개인과제 - CoreData TodoList App



## 과제 설명

1. Figma로 주어진 디자인 가이드에 맞춰 UI를 구성해봅시다.  --> 인스타 페이지
2. 간단한 MVVM 구조를 적용해 구현해봅니다.  --> 일단 ProfilePage 한정
3. Core Data를 사용하여 관계형 데이터 베이스 구조에 대해서 구현해보고 이해해봅니다.

   ** 지켜야 할 사항
    1. `UICollectionView` , `UILabel` , `UIImageView`, `UIButton` , `UIView` 요소들을 반드시 사용해주세요.
    2. 각 구성요소의 비율, 크기, 여백 등을 최대한 똑같이 구현해보세요.
    3. 이미지는 Dummy Image를 사용하여 만들어보세요.
        1. 피그마에서 이미지 export해서 사용해주세요.

  ### 예시 사진
  <img src="https://github.com/kwangjo93/coredataTotoList/assets/125628009/14570231-b67e-4137-bb30-18db4759a5ce" alt="Image Description" width="200"> <img src="https://github.com/kwangjo93/coredataTotoList/assets/125628009/0480becd-2cbd-4615-92a1-eb088bb1777c" alt="Image Description" width="200">
### 나의 완성 UI 화면
<img src="https://github.com/kwangjo93/coredataTotoList/assets/125628009/ea2a56c1-9d9e-4c2f-ac9c-cf7dc3b84a34" alt="Image Description" width="200"> <img src="https://github.com/kwangjo93/coredataTotoList/assets/125628009/7d534b47-ce0f-47ed-831f-1380facb5dff" alt="Image Description" width="200"> <img src="https://github.com/kwangjo93/coredataTotoList/assets/125628009/361a7231-e599-42af-afa1-b26332ac338a" alt="Image Description" width="200">
<img src="https://github.com/kwangjo93/coredataTotoList/assets/125628009/25c59e4d-acbc-4117-b3f1-87758e690096" alt="Image Description" width="200">  <img src="https://github.com/kwangjo93/coredataTotoList/assets/125628009/0481a8a0-8c3d-4835-b9bb-a26dfff708bd" alt="Image Description" width="200">  <img src="https://github.com/kwangjo93/coredataTotoList/assets/125628009/2bd7a440-0550-443f-b815-ef60aa865447" alt="Image Description" width="200">


### 디자인 패턴 : MVVM 패턴
![‎투두 앱 MVVM 다이어그램 ‎001](https://github.com/kwangjo93/coredataTotoList/assets/125628009/84d9e6b5-70a9-43b9-8093-f6970812d57a)

### 코디네이터 패턴 설명
![‎코디네이터 다이어그램 ‎001](https://github.com/kwangjo93/coredataTotoList/assets/125628009/4eff7113-ef37-4b9c-8289-e5cb20f3ca64)
* 앱 코디네이터(처음 셋팅)을 만들어 SceneDelegate 에서 생성 후 내부 매서드 실행
* 내부 매서드에는 메인 코디네이터의 인스턴스를 만들고, 내부 매서드를 실행
* 메인 큐 컨트롤러로 진입 (두투 페이지 -> 디테일 페이지)
* init 생성자를 통해서는 코디네이터 클래스의 인스턴스를 만들도록 하고, 해당 코디네이터 내부 메서드에서는 실행 시 화면전환을 하기 위한 뷰 컨트롤러의 인스턴스를 만들어 전환
* 함수로 만들어 화면전환을 하기 때문에 pop으로 back한 경우 메모리 해제
* 해당 뷰컨의 coordinator 프로퍼티에 대해서 weak var 강한 순환 참조 주의!!

## UserDefault 와 CoreData 의 차이점
 * UserDefault
    - 간단하고 가벼운 데이터를 저장하기 위한 영구 저장소 (앱 설정, 로그인 여부 - 보안관련 X)
    - 키 벨류 값으로 저장, 불러오기
    - 적은 양의 데이터를 저장하기에 적합하고, 대용량을 불러올 때 성능 문제 발생 가능성이 높다.
    - 저장된 데이터가 암호화되지 않아 보안의 문제가 있어 개인정보 등의 데이터는 저장하지 않는 것이 좋다.
  
 * CoreData
   - 복잡한 데이터를 다루는데 사용. 여러 엔티티를 만들어 관계를 만들어 형성.
   - 대용량 데이터를 다루기에 적합하기는 하나 앱 자체의 용량이 많아지는 단점이 있다.
   - 데이터 모델링을 할 때 용이하다.
   - request 를 통해 검색 쿼리 기능을 제공해 원하는 쿼리를 이용하여 정렬이 가능하다.
   - SQLite와 같은 데이터베이스 엔진을 사용하여 데이터를 저장하므로 보안기능 활용.
  
## MVC 와 MVVM 패턴의 차이점

  * MVC
    - 모델, 뷰, 컨트롤러가 각각 맡은 역할을 나누어 처리한다.
    - 직접적으로 데이터를 만들어 사용하기 때문에 직관성이 좋다.
    - 컨트롤러와 다른 모델, 뷰에 의존성이 높다.
    - 뷰컨트롤러기 비대해지기 때문에 유지보수에 좋지 않다.

  * MVVM
    - 모델, 뷰(뷰+뷰컨트롤러) ,뷰모델로 이루어져 있고, MVC보다 코드와 역할을 더 분리하여 맡은 역할을 처리한다.
    - 뷰와 뷰컨트롤러를 모두 뷰로 칭한다.(뷰컨트롤러는 뷰를 표시하는 역할.)
    - 뷰는 뷰모델을 가지고, 뷰모델은 모델을 가진다.
    - 뷰컨트롤러는 뷰 모델을 가지면서 뷰모델의 로직만을 이용하여 (뷰컨에는 코드가 분리되어 로직X) 데이터 표시
    - 뷰모델은 모델을 가지고 로직 구성
    - 의존성역전으로 외부에서 데이터를 주입하여 결합도를 낮춘다. -> 추후 test code 가능
    - 데이터 바인딩을 통해 뷰모델의 변경된 데이터를 뷰에 반영하도록 (굳이 RX가 아니더라도 반응형 코드 형성)
    - 던점은 MVC 의 뷰컨이 비대해지는 것처럼 뷰모델도 로직의 수가 커질 수 있고, 처음 설계가 MVC에 비해 어렵다.
    

