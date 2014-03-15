<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<title>회원가입폼</title>
<script src="script.js"></script>
<center>
<h2>&nbsp;회원가입</h2>

<body onLoad="begin2()">
<form action="/Jsp/member/mformPro.nhn" name="userinput" onSubmit="return checkForm()">
<table border=1>

            <tr>
               <td width="120"> &nbsp;*아이디</td>
               <td width="500"><input type="text" name="id"/>
                               <input type="button" value="중복체크" OnClick="openConfirmid(this.form.id.value)"/>
                        </td>
            </tr>
            <tr>
            <td> &nbsp;*비밀번호</td>
            <td><input type="password" name="pw"/></td>
            </tr>
            <tr>
            <td> &nbsp;*비밀번호확인</td>
            <td><input type="password" name="pw2"/></td>
            </tr>
            <tr>
            <td> &nbsp;*주민번호</td>
            <td><input type="text" name="num1" size="10"/>-<input type="text" name="num2" size="11"/></td>
            </tr>
            <tr>
            <td> &nbsp;*주소</td>
            <td><input type="text" name="adr1"/><input type="button" value="주소검색"/></td>
            </tr>
            <tr>
            <td> &nbsp;*상세주소</td>
            <td><input type="text" name="adr2" size="35"/></td>
            </tr>
            <tr>
            <td>&nbsp;*휴대폰</td>
            <td><select name="sel1"><option>010</option><option>011</option><option>017</option></select>
                <input type="text" name="pnum1" size="8"/>-<input type="text" name="pnum2" size="8"/></td>
            </tr>
            <tr>
            <td> &nbsp;*이메일</td>
            <td><input type="text" name="em1"/>@<input type="text" name="em2"/>
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
            <td><input type=radio name="emr" value="받음"/>받음
                  <input type=radio name="emr" value="받지않음"/>받지않음
                  </td>
            </tr>
           
            
</table>
<input type="submit" value="회원가입"/>
<input type="reset" value="다시작성"/>
</form>
</body>
</center>
