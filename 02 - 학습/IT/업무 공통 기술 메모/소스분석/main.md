---
별칭:
  - "학습 - main"
tags:
  - type/study
  - context/studies
  - theme/dev
  - status/in-progress
  - domain/백엔드
생성일: 
수정일: 2026-11-04
노션원본: https://www.notion.so/fb5e2045901e4583a57e42f74a09d65d
주제:
  - "[[00 - 대시보드/주제/Java|Java]]"
  - "[[00 - 대시보드/주제/JSP·Servlet|JSP·Servlet]]"
---

# 학습: main

## 세부 내용

```java
@RequiredArgsConstructor
@Controller
@RequestMapping("/intro/main")
@Slf4j
public class MainController {
    @Value("${apiUrl}")
    private String apiUrl;

    private final JwtUtil jwtUtil;

    /**
     * main view
     */
    @RequestMapping("/mainView")
    public ModelAndView mainView(@AuthenticationPrincipal SessionData userInfo, HttpServletRequest request) {
        ModelAndView mav = new ModelAndView();
        String viewName = "fsms/intro/portalView";
        String schDateSt,schDateEd;

        // 기본 조회일자 설정
        Calendar cal = Calendar.getInstance();
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");

        schDateEd = format.format(cal.getTime());
        schDateSt = format.format(cal.getTime());

        if(userInfo != null) {
            String userId = userInfo.getUsrId();
            log.info("userId={} " + userId);
            String token = jwtUtil.createToken(userId, "push");
            log.info("token={} " + token);
            JSONObject response = ApiUtil.get(token, apiUrl+"/web/account");
            log.info("response={} " + response);
            if(response != null) {
                if(response.getBoolean("success")) {
                    String webAdminType = response.getJSONObject("body").getString("webAdminType");
                    switch (webAdminType) {
                        // 본사/발주처/감리/
                        case "TYPE_HEAD" : case "TYPE_SUPERVISION" :
                            viewName = "fsms/intro/mainBonsaView";
                            break;
                        // 원청/직영
                        case "TYPE_MAIN" : case "TYPE_DIRECT" :
                            viewName = "fsms/intro/mainSaupView";
                            break;
                        // 하도
                        case "TYPE_SUB" :
                            viewName = "fsms/intro/mainHadoView";
                            break;
                        default:
                            viewName = "fsms/intro/portalView";
                    }
                    mav.addObject("webAdminType", webAdminType);
                }
            }
            mav.addObject("webToken", token);
            mav.addObject("startDate", schDateSt);
            mav.addObject("endDate", schDateEd);
        }
        mav.setViewName(viewName);
        return mav;
    }
```

1. **`@Value("${apiUrl}")`**: 이 코드는 Spring의 **`@Value`** 어노테이션을 사용하여 **`apiUrl`**이라는 필드에 값을 주입하는 것을 의미합니다. **`apiUrl`**은 Spring 프로퍼티 파일에서 정의된 프로퍼티의 값을 받아옵니다.
2. **`private final JwtUtil jwtUtil;`**: 이 부분은 **`JwtUtil`**이라는 클래스의 객체를 필드로 선언합니다. **`final`** 키워드로 선언되어 있으므로, 해당 필드는 생성자를 통해 초기화되어 변경될 수 없는 상수 필드입니다.
3. **`@RequestMapping("/mainView")`**: 이 코드는 해당 메서드가 **`/mainView`** 엔드포인트에 매핑되도록 지정하는 어노테이션입니다. 즉, 사용자가 **`/mainView`**로 GET 요청을 보내면 이 메서드가 실행됩니다.
4. **`public ModelAndView mainView(@AuthenticationPrincipal SessionData userInfo, HttpServletRequest request)`**: 이 메서드는 **`/mainView`** 엔드포인트에 대한 요청을 처리하는 핸들러 메서드입니다. **`@AuthenticationPrincipal`** 어노테이션을 통해 인증된 사용자 정보가 **`userInfo`** 매개변수로 주입됩니다. 또한 **`HttpServletRequest`** 객체도 매개변수로 받아와 사용할 수 있습니다.
5. **`ModelAndView mav = new ModelAndView();`**: 이 코드는 뷰와 뷰에 전달될 데이터를 관리하는 **`ModelAndView`** 객체를 생성합니다.
6. **`String viewName = "fsms/intro/portalView";`**: 이 코드는 기본적으로 **`viewName`** 변수에 "fsms/intro/portalView"라는 뷰의 이름을 할당합니다. 이는 사용자가 특정 조건을 만족하지 않는 경우를 대비한 기본 뷰 이름입니다.
7. **`Calendar cal = Calendar.getInstance();`**: 이 코드는 현재 시간을 기준으로한 **`Calendar`** 객체를 생성합니다.
8. **`SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");`**: 이 코드는 "yyyy-MM-dd" 형식의 날짜를 파싱하고 포맷하는 **`SimpleDateFormat`** 객체를 생성합니다.
9. **`schDateEd = format.format(cal.getTime()); schDateSt = format.format(cal.getTime());`**: 이 코드는 현재 시간을 기준으로한 날짜를 "yyyy-MM-dd" 형식으로 변환하여 **`schDateEd`**와 **`schDateSt`** 변수에 저장합니다.
10. **`if(userInfo != null) { ... }`**: 이 코드는 사용자가 인증된 경우에만 내부의 로직을 수행합니다. **`userInfo`**가 **`null`**이 아닌 경우에만 조건문이 실행됩니다.
11. **`String userId = userInfo.getUsrId();`**: 이 코드는 인증된 사용자 정보로부터 사용자의 ID를 가져옵니다.
12. **`String token = jwtUtil.createToken(userId, "push");`**: 이 코드는 **`jwtUtil`** 객체를 사용하여 사용자 ID와 "push"라는 문자열을 이용하여 JWT 토큰을 생성합니다.
13. **`JSONObject response = ApiUtil.get(token, apiUrl+"/web/account");`**: 이 코드는 **`ApiUtil`** 클래스의 **`get`** 메서드를 사용하여 서버에 HTTP GET 요청을 보내고, 그에 대한 JSON 응답을 **`JSONObject`**로 받아옵니다.
14. **`if(response != null) { ... }`**: 이 코드는 서버로부터 응답이 온 경우에만 내부의 로직을 수행합니다.
15. **`if(response.getBoolean("success")) { ... }`**: 이 코드는 JSON 응답에서 "success"라는 키의 값이 **`true`**인 경우에만 내부의 로직을 수행합니다.
16. **`String webAdminType = response.getJSONObject("body").getString("webAdminType");`**: 이 코드는 JSON 응답에서 "body"라는 키의 값을 가져온 후, 그 안에서 "webAdminType"이라는 키의 값인 **`webAdminType`**을 추출합니다.
17. **`switch (webAdminType) { ... }`**: 이 코드는 **`webAdminType`**의 값에 따라 다른 경우에 따라서 **`viewName`**을 설정합니다. 즉, 해당 값에 따라 다른 뷰로 이동하는 데 사용됩니다.
18. **`mav.addObject("webAdminType", webAdminType);`**: 이 코드는 **`ModelAndView`** 객체에 "webAdminType"이라는 이름으로 **`webAdminType`** 변수의 값을 추가합니다.
19. **`mav.addObject("webToken", token); mav.addObject("startDate", schDateSt); mav.addObject("endDate", schDateEd);`**: 이 코드는 **`ModelAndView`** 객체에 "webToken", "startDate", "endDate"라는 이름으로 각각 **`token`**, **`schDateSt`**, **`schDateEd`** 변수의 값을 추가합니다.
20. **`mav.setViewName(viewName);`**: 이 코드는 **`mav`** 객체의 뷰 이름을 **`viewName`**으로 설정합니다.
21. **`return mav;`**: 이 코드는 최종적으로 **`ModelAndView`** 객체를 반환합니다. 해당 뷰와 함께 클라이언트에게 응답이 전송됩니다.

이렇게 해당 자바 코드는 요청에 따라 다른 뷰를 반환하며, 뷰에 필요한 데이터를 전달하는 기능을 수행합니다.

#### JSONObject

- JSONObject는 Java에서 JSON(JavaScript Object Notation) 데이터를 다루기 위한 클래스입니다.
- JSON은 경량의 데이터 교환 형식으로, 키-값 쌍으로 구성된 객체와 배열을 지원합니다.
- Java에서 JSONObject를 사용하면 JSON 데이터를 쉽게 생성, 분석 및 조작할 수 있습니다.

JSONObject의 간단한 예제 코드

```java
import org.json.JSONObject;

public class JSONObjectExample {
    public static void main(String[] args) {
        // JSON 데이터 생성
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("이름", "홍길동");
        jsonObject.put("나이", 30);
        jsonObject.put("성별", "남성");
        jsonObject.put("결혼여부", false);

        // JSON 데이터 출력
        System.out.println(jsonObject.toString());

        // JSON 데이터 파싱
        String jsonData = "{\"제품명\":\"스마트폰\",\"가격\":500000,\"재고\":true}";
        JSONObject parsedObject = new JSONObject(jsonData);

        // 파싱된 JSON 데이터 사용
        String productName = parsedObject.getString("제품명");
        int price = parsedObject.getInt("가격");
        boolean inStock = parsedObject.getBoolean("재고");

        System.out.println("제품명: " + productName);
        System.out.println("가격: " + price);
        System.out.println("재고 여부: " + inStock);
    }
}

// {"이름":"홍길동","나이":30,"성별":"남성","결혼여부":false}
// 제품명: 스마트폰
// 가격: 500000
// 재고 여부: true
```

- 위의 예제에서는 **`org.json.JSONObject`** 클래스를 사용하여 JSON 데이터를 생성하고 파싱합니다.
    1. 첫 번째 예제에서는 새로운 JSONObject를 만들고 여러 키-값 쌍을 추가한 다음 **`toString()`** 메서드를 호출하여 JSON 문자열로 출력합니다. 
    2. 두 번째 예제에서는 JSON 형식의 문자열을 파싱하여 JSONObject로 변환하고, 그 안에서 특정 키에 해당하는 값을 가져와 출력합니다.

JSONObject는 JSON 데이터를 Java에서 쉽게 다룰 수 있도록 도와주는 유용한 클래스입니다.

```java
@PostMapping(value = "/networkInfo")
    public ModelAndView networkInfo(@AuthenticationPrincipal SessionData userInfo, @RequestParam HashMap<String,Object> param) {
        ModelAndView mav = new ModelAndView();
        param.put("usrId", userInfo.getUsrId());
        param.put("usrTypeCd", userInfo.getUsrTypeCd());
        String fieldId = userInfo.getPobId();
        String viewName = "";
        // 본사, 발주처, 감리 조회
        JSONObject response = ApiUtil.get((String)param.get("webToken"), apiUrl+"/field/biz");
        // 원청사업장 - 하도사업장 연동 승인 완료 조회
        JSONObject hadoPobResponse = ApiUtil.get((String)param.get("webToken"), apiUrl+"/low/apply/field/"+fieldId);
        // 하도사업장 - 원청사업장 연동 조회
        JSONObject hadoUpOrgPobResponse = ApiUtil.get((String)param.get("webToken"), apiUrl+"/up/field");
        // 본사/사업장 정보 조회
        JSONObject fieldAndUserInfoResponse = ApiUtil.get((String)param.get("webToken"), apiUrl+"/web/account");

        log.info("response={}", response);
        log.info("hadoPobResponse={}", hadoPobResponse);
        log.info("hadoUpOrgPobResponse={}", hadoUpOrgPobResponse);

        switch ((String)param.get("webAdminType")) {
            // 본사/발주처/감리/
            case "TYPE_HEAD" : case "TYPE_SUPERVISION" :
                if(fieldAndUserInfoResponse != null) {
                    if(!fieldAndUserInfoResponse.isNull("body")) {
                        JSONObject fieldAndUserInfoJson = fieldAndUserInfoResponse.getJSONObject("body");
                        List<FieldAndUserInfoResponse> fieldAndUserList = new ArrayList<>();

                        FieldAndUserInfoResponse fieldAndUserInfo = FieldAndUserInfoResponse.builder()
                                        .fieldName((String) fieldAndUserInfoJson.get("fieldName"))
                                        .userName((String) fieldAndUserInfoJson.get("userName"))
                                        .fieldId((String) fieldAndUserInfoJson.get("fieldId"))
                                        .webAdminType((String) fieldAndUserInfoJson.get("webAdminType"))
                                        .build();
                        if(!StringUtil.isEmpty(fieldAndUserInfo.getFieldId())) {
                            fieldAndUserList.add(fieldAndUserInfo);
                        }

                        mav.addObject("fieldAndUserList", fieldAndUserList);
                        log.info("fieldAndUserList={}",fieldAndUserList);
                    }

                }
                viewName = "fsms/intro/mainBonsaView :: #networkInfo";
                break;
            // 원청/직영
            case "TYPE_MAIN" : case "TYPE_DIRECT" :
                if(response != null) {
                    JSONArray bizArr = response.getJSONArray("body");
                    List<BizResponse> bizList = new ArrayList<>();
                    List<OrdPlResponse> ordPlList = new ArrayList<>();
                    List<MthdsResponse> mthdsList = new ArrayList<>();

                    for(Object arr : bizArr) {
                        JSONObject obj = (JSONObject) arr;
                        log.info("obj={}", obj);

                        if(obj.get("supplyCd").equals("H")) {
                            BizResponse biz = BizResponse.builder()
                                    .supplyCd((String) obj.get("supplyCd"))
                                    .supplyName((String) obj.get("supplyName"))
                                    .bizName((String) obj.get("bizName"))
                                    .status((String) obj.get("status"))
                                    .managerName((String) obj.get("managerName"))
                                    .bizId((String) obj.get("bizId"))
                                    .build();
                            if(!StringUtil.isEmpty(biz.getBizId())) {
                                bizList.add(biz);
                            }
                        }else if(obj.get("supplyCd").equals("S")){
                            OrdPlResponse ordPl = OrdPlResponse.builder()
                                    .supplyCd((String) obj.get("supplyCd"))
                                    .supplyName((String) obj.get("supplyName"))
                                    .bizName((String) obj.get("bizName"))
                                    .status((String) obj.get("status"))
                                    .managerName((String) obj.get("managerName"))
                                    .bizId((String) obj.get("bizId"))
                                    .build();
                            if(!StringUtil.isEmpty(ordPl.getBizId())) {
                                ordPlList.add(ordPl);
                            }
                        }else {
                            MthdsResponse mthds = MthdsResponse.builder()
                                    .supplyCd((String) obj.get("supplyCd"))
                                    .supplyName((String) obj.get("supplyName"))
                                    .bizName((String) obj.get("bizName"))
                                    .status((String) obj.get("status"))
                                    .managerName((String) obj.get("managerName"))
                                    .bizId((String) obj.get("bizId"))
                                    .build();
                            if(!StringUtil.isEmpty(mthds.getBizId())) {
                                mthdsList.add(mthds);
                            }
                        }

                    }
                    mav.addObject("bizList", bizList);
                    mav.addObject("ordPlList", ordPlList);
                    mav.addObject("mthdsList", mthdsList);
                    log.info("bizList={}", bizList);
                    log.info("ordPlList={}", ordPlList);
                    log.info("mthdsList={}", mthdsList);

                }

                if(fieldAndUserInfoResponse != null) {
                    if(!fieldAndUserInfoResponse.isNull("body")) {
                        JSONObject orgPobJson = fieldAndUserInfoResponse.getJSONObject("body");
                        List<FieldAndUserInfoResponse> orgPobList = new ArrayList<>();

                        FieldAndUserInfoResponse orgPob = FieldAndUserInfoResponse.builder()
                                .fieldName((String) orgPobJson.get("fieldName"))
                                .userName((String) orgPobJson.get("userName"))
                                .fieldId((String) orgPobJson.get("fieldId"))
                                .webAdminType((String) orgPobJson.get("webAdminType"))
                                .build();
                        if(!StringUtil.isEmpty(orgPob.getFieldId())) {
                            orgPobList.add(orgPob);
                        }

                        mav.addObject("orgPobList", orgPobList);
                        log.info("orgPobList={}",orgPobList);
                    }

                }

                if(hadoPobResponse != null) {
                    JSONArray hadoPobArr = hadoPobResponse.getJSONArray("body");
                    List<HadoPobResponse> hadoPobList = new ArrayList<>();
                    for(Object arr : hadoPobArr) {
                        JSONObject obj = (JSONObject) arr;
                        HadoPobResponse hadoPob = HadoPobResponse.builder()
                                .fieldName((String) obj.get("fieldName"))
                                .fieldManager((String) obj.get("fieldManager"))
                                .fieldId((String) obj.get("fieldId"))
                                .build();
                        if(!StringUtil.isEmpty(hadoPob.getFieldId())) {
                            hadoPobList.add(hadoPob);
                        }

                    }
                    mav.addObject("hadoPobList", hadoPobList);
                }
                viewName = "fsms/intro/mainSaupView :: #networkInfo";
                break;
            // 하도
            case "TYPE_SUB" :
                if(response != null) {
                    JSONArray bizArr = response.getJSONArray("body");
                    List<BizResponse> bizList = new ArrayList<>();

                    for(Object arr : bizArr) {
                        JSONObject obj = (JSONObject) arr;
                        log.info("obj={}", obj);
                        BizResponse biz = BizResponse.builder()
                                .supplyCd((String) obj.get("supplyCd"))
                                .supplyName((String) obj.get("supplyName"))
                                .bizName((String) obj.get("bizName"))
                                .status((String) obj.get("status"))
                                .managerName((String) obj.get("managerName"))
                                .bizId((String) obj.get("bizId"))
                                .build();
                        if(!StringUtil.isEmpty(biz.getBizId())) {
                            bizList.add(biz);
                        }

                    }
                    mav.addObject("bizList", bizList);
                    log.info("bizList={}", bizList);

                }

                if(hadoUpOrgPobResponse != null) {

                    if(!hadoUpOrgPobResponse.isNull("body")) {
                        JSONObject hadoUpOrgPobJson = hadoUpOrgPobResponse.getJSONObject("body");
                        List<HadoUpOrgPobResponse> hadoUpOrgPobList = new ArrayList<>();
                        HadoUpOrgPobResponse hadoUpOrgPob = HadoUpOrgPobResponse.builder()
                                .fieldName((String) hadoUpOrgPobJson.get("fieldName"))
                                .fieldManager((String) hadoUpOrgPobJson.get("fieldManager"))
                                .fieldId((String) hadoUpOrgPobJson.get("fieldId"))
                                .status((String) hadoUpOrgPobJson.get("status"))
                                .build();
                        if(!StringUtil.isEmpty(hadoUpOrgPob.getFieldId())) {
                            hadoUpOrgPobList.add(hadoUpOrgPob);
                        }

                        mav.addObject("hadoUpOrgPobList", hadoUpOrgPobList);
                        log.info("hadoUpOrgPobList={}",hadoUpOrgPobList);
                    }

                }

                if(fieldAndUserInfoResponse != null) {
                    if(!fieldAndUserInfoResponse.isNull("body")) {
                        JSONObject fieldAndUserInfoJson = fieldAndUserInfoResponse.getJSONObject("body");
                        List<FieldAndUserInfoResponse> fieldAndUserList = new ArrayList<>();

                        FieldAndUserInfoResponse fieldAndUserInfo = FieldAndUserInfoResponse.builder()
                                .fieldName((String) fieldAndUserInfoJson.get("fieldName"))
                                .userName((String) fieldAndUserInfoJson.get("userName"))
                                .fieldId((String) fieldAndUserInfoJson.get("fieldId"))
                                .webAdminType((String) fieldAndUserInfoJson.get("webAdminType"))
                                .build();
                        if(!StringUtil.isEmpty(fieldAndUserInfo.getFieldId())) {
                            fieldAndUserList.add(fieldAndUserInfo);
                        }

                        mav.addObject("fieldAndUserList", fieldAndUserList);
                        log.info("fieldAndUserList={}",fieldAndUserList);
                    }

                }
                viewName = "fsms/intro/mainHadoView :: #networkInfo";
                break;
            default:
        }
        mav.setViewName(viewName);
        return mav;
    }
```

**`/networkInfo`** 엔드포인트로 들어오는 POST 요청을 처리합니다. 아래는 코드의 설명입니다:

1. 메서드 시그니처:
    - **`public ModelAndView networkInfo(@AuthenticationPrincipal SessionData userInfo, @RequestParam HashMap<String,Object> param)`**
    - 매개변수 설명
        - **`@AuthenticationPrincipal SessionData userInfo`**: 현재 인증된 사용자의 세션 데이터를 나타내는 객체입니다.
        - **`@RequestParam HashMap<String,Object> param`**: HTTP 요청 파라미터를 저장하는 HashMap입니다.
2. 처리 과정:
    - **`param`** HashMap에 **`userInfo`**에서 추출한 **`usrId`**와 **`usrTypeCd`**를 추가합니다.
    - **`fieldId`** 변수에 **`userInfo`**에서 추출한 **`pobId`**를 저장합니다.
    - **`viewName`** 변수에 빈 문자열을 할당합니다.
    - **`ApiUtil`** 클래스를 사용하여 네트워크 호출을 수행하고 그 결과를 **`JSONObject`**로 받아옵니다.
    - 각 경우(**`TYPE_HEAD`**, **`TYPE_SUPERVISION`**, **`TYPE_MAIN`**, **`TYPE_DIRECT`**, **`TYPE_SUB`**)에 따라 **`response`**, **`hadoPobResponse`**, **`hadoUpOrgPobResponse`**, **`fieldAndUserInfoResponse`**의 데이터를 분석하고, 적절한 정보를 추출하여 **`mav`** (ModelAndView)에 추가합니다.
    - 최종적으로 **`viewName`**에 따라 적절한 뷰를 설정하고, **`mav`**를 반환합니다.

## 관련 노트

- 상위: [[02 - 학습/IT/업무 공통 기술 메모/공통 기술 메모 (Spring·타임리프·DB·SSL 등)|공통 기술 메모 (Spring·타임리프·DB·SSL 등)]]
