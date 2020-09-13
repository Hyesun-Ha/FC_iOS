# Ch13. TodoList App

강의를 듣고 TodoList App을 혼자 다시 만들어보며 복습하였습니다.   

완성본 영상입니다.   

[![완성본 영상](https://user-images.githubusercontent.com/59822540/93021125-13cde800-f61c-11ea-8e5c-155e75e8ef15.png)](https://serviceapi.nmv.naver.com/flash/convertIframeTag.nhn?vid=2805D5E087706E58014709CF2E896F0DA065&outKey=V1293eeb0b86000f557e566fb526a2c868b1e8ae3bc7f03e2f49866fb526a2c868b1e&width=544&height=306)      

주요 기능 및 구성은 다음과 같습니다.
- tab bar를 통해 Tasks tab과 Settings tab 간의 이동이 가능합니다.
1. Tasks tab
    - textfield를 통해 할 일을 직접 입력할 수 있고, + 모양의 add button을 통해 할일의 추가가 가능합니다.
    - today button을 누르면 Today section에 추가되며, default는 Upcoming section입니다.
      (keyboard가 감지되면 입력되는 view는 keyboard 위쪽으로 이동합니다.
    - 각 cell의 맨 앞에 있는 done button을 누르면 cell의 text의 색상이 연하게 바뀌며, 줄이 그어집니다.
      (is done 상태일 경우 cell의 삭제가 가능합니다.)
2. Settings tab
    - Inset Grouped Style을 적용해 보았습니다.
- 추가된 data들은 local에 저장되며, cell의 상태 변화가 있을 시 변경 사항들이 update됩니다. App을 재실행 할 경우 이전의 data를 불러옵니다.
---
블로그에도 공부한 내용들을 기록해 보았습니다.  
- [TodoList App 복습6 + Codable = Encodable + Decodable](https://blog.naver.com/hahye3/222082709394).
- [TodoList App 복습5 + Methods: mutating](https://blog.naver.com/hahye3/222080583886).
- [TodoList App 복습4 + Equatable](https://blog.naver.com/hahye3/222078795345).
- [TodoList App 복습3 + NotificationCenter](https://blog.naver.com/hahye3/222077178914).
- [TodoList App 복습2 + Enumeration: CaseIterable](https://blog.naver.com/hahye3/222076718774).  
- [TodoList App 복습1 + HIG: Tab Bars, Tables](https://blog.naver.com/hahye3/222074506200).
