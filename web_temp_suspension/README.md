# web_temp_suspension

Flutter Web 사용전 예제 프로젝트

### 사용된 기술
1. splash
2. meta

### Splash 적용 방법

 index.html에 \<body> 부분에 코드 추가 
 
 보여질 이미지 파일 등록 
```html
<img src="icons/512x512.png" alt="..." class="center"/>
<script src="main.dart.js" type="application/javascript"></script>
```
 index.html 의 \<head> 부분에 코드 추가
 ```html
<link rel="stylesheet" type="text/css" href="styles.css">
```

web 경로에 styles.css 파일 추가

파일에 코드 작성
```css
.center{
    margin: 0;
    position: absolute;
    top: 50%;
    left: 50%;
    margin-right: -50%;
    transform: translate(-50%, -50%);
}
```



### meta Tag

Web README.md 폴더에 정리가 되어져 있음.

