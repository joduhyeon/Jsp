<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
															<title>회원정보수정</title>
<script src="script.js"></script>


<center>

<h2>&nbsp;회원정보수정</h2>
<body onLoad="begin3()">
<form action="/Jsp/member/modifyPro.nhn" name="userinput" onSubmit="return checkForm()">
<table border=1>

            <tr>
               <td width="120"> &nbsp;*아이디</td>
               <td width="500"><input type="text" name="id" value="${id}" readonly /></td>
            </tr>
            <tr>
            <td> &nbsp;*비밀번호</td>
            <td><input type="password" name="pw" value="${pw}"/></td>
            </tr>
            <tr>
            <td> &nbsp;*비밀번호확인</td> 
            <td><input type="password" name="pw2" value="${pw2}"/></td>   <!-- 왜 네글자만 나오냐? -->
            </tr>
            <tr>
            <td> &nbsp;*주소</td>
            <td><input type="text" name="adr1" value="${adr1}" />
            <input type="button" value="주소검색"/></td>
            </tr>
            <tr>
            <td> &nbsp;*상세주소</td>
            <td><input type="text" name="adr2" size="35" value="${adr2}"/></td>
            </tr>
            <tr>
            <td>&nbsp;*휴대폰</td>
            <td><select name="sel1"><option>010</option><option>011</option><option>017</option></select>
                <input type="text" name="pnum1" size="8" value="${pnum1}"/>
                -<input type="text" name="pnum2" size="8" value="${pnum2}"/></td>
            </tr>
            <tr>
            <td> &nbsp;*이메일</td>
            <td><input type="text" name="em1" value="${em1}"/>
            	@<input type="text" name="em2" value="${em2}"/>
                 	<select name="sel2">
	                		<option>직접입력</option>
	               			<option>naver.com</option>
	                        <option>gmail.com</option>
	                        <option>hanmail.com</option>
         		   </select>
            </td>
            </tr>
            <tr>
            <td> &nbsp;*이메일수신</td>
            <td><input type=radio name="emr" value="받음" checked="checked"  />받음
                  <input type=radio name="emr" value="받지않음" checked="checked" />받지않음
                  </td>
            </tr>
</table>
				<input type="submit" value="수정"/>
				<input type="button" value="돌아가기" onclick="login()"/>
</form>
</body>
</center>