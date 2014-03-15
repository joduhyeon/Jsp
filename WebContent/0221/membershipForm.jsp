<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<title>회원가입폼</title>
<h2>&nbsp;회원가입</h2>
<style type="text/css">
h2 { margin=3;padding=0;}
form { margin=4;  }
* {font-family :"nanumgothic"; }
div.bt { margin-left=230; padding=20; color=red;}
</style>
<script>
function checkIt(){
        var userinput = eval("document.userinput");
        if(!userinput.id.value) {
            alert("ID를 입력하세요");
            return false;
        }
        
        if(!userinput.pw.value ) {
            alert("비밀번호를 입력하세요");
            return false;
        }
        if(userinput.pw.value != userinput.pw2.value)
        {
            alert("비밀번호를 동일하게 입력하세요");
            return false;
        }
       
        if(!userinput.num1.value  || !userinput.num2.value )
        {
            alert("주민등록번호를 입력하세요");
            return false;
        }
        if(!userinput.adr1.value  || !userinput.adr2.value )
        {
            alert("주소를 입력해주세요");
            return false;
        }
        if(!userinput.pnum1.value || !userinput.pnum2.value )
        {
            alert("핸드폰 번호를 입력해주세요");
            return false;
        }
        if(!userinput.em1.value || !userinput.em2.value )
        {
            alert("이메일을 입력해주세요");
            return false;
        }
        if(userinput.emr.value)
        {
            alert("이메일 수신 동의를 체크해주세요");
            return false;
        }
        
    }
function openConfirmid(userinput) {
    // 아이디를 입력했는지 검사
    if (userinput.id.value == "") {    //검사하는 줄
        alert("아이디를 입력하세요");
        return;
    }
    // url과 사용자 입력 id를 조합합니다.
    url = "confirmId.jsp?id=" + userinput.id.value ;
    
    // 새로운 윈도우를 엽니다.
    open(url, "confirm", //창을 여는것이고 툴바가없고 위치도 없고 등등의 옵션이다.
    "toolbar=no, location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=300, height=200");
   //적용이 안되는건 브라우저마다 환경이 달라서 이다.
}
</script>
<form action="formPro.jsp" name="userinput" onSubmit="return checkIt()">
<table border=1>

            <tr>
               <td width="120"> &nbsp;*아이디</td>
               <td width="500"><input type="text" name="id"/>
                               <input type="button" value="중복체크" OnClick="openConfirmid(this.form)"/>
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
 <div class="bt">
 <input type="submit" name="confirm" value="회원가입"/>
 <input type="reset" value="다시작성"/>
 </div>

</form>