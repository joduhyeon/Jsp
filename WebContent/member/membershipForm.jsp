<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<title>ȸ��������</title>
<script src="script.js"></script>
<center>
<h2>&nbsp;ȸ������</h2>

<body onLoad="begin2()">
<form action="/Jsp/member/mformPro.nhn" name="userinput" onSubmit="return checkForm()">
<table border=1>

            <tr>
               <td width="120"> &nbsp;*���̵�</td>
               <td width="500"><input type="text" name="id"/>
                               <input type="button" value="�ߺ�üũ" OnClick="openConfirmid(this.form.id.value)"/>
                        </td>
            </tr>
            <tr>
            <td> &nbsp;*��й�ȣ</td>
            <td><input type="password" name="pw"/></td>
            </tr>
            <tr>
            <td> &nbsp;*��й�ȣȮ��</td>
            <td><input type="password" name="pw2"/></td>
            </tr>
            <tr>
            <td> &nbsp;*�ֹι�ȣ</td>
            <td><input type="text" name="num1" size="10"/>-<input type="text" name="num2" size="11"/></td>
            </tr>
            <tr>
            <td> &nbsp;*�ּ�</td>
            <td><input type="text" name="adr1"/><input type="button" value="�ּҰ˻�"/></td>
            </tr>
            <tr>
            <td> &nbsp;*���ּ�</td>
            <td><input type="text" name="adr2" size="35"/></td>
            </tr>
            <tr>
            <td>&nbsp;*�޴���</td>
            <td><select name="sel1"><option>010</option><option>011</option><option>017</option></select>
                <input type="text" name="pnum1" size="8"/>-<input type="text" name="pnum2" size="8"/></td>
            </tr>
            <tr>
            <td> &nbsp;*�̸���</td>
            <td><input type="text" name="em1"/>@<input type="text" name="em2"/>
                <select name="sel2">
                <option>�����Է�</option>
                <option>naver.com</option>
                        <option>gmail.com</option>
                        <option>hanmail.com</option>
                         
                 </select>
            </td>
            </tr>
            <tr>
            <td> &nbsp;*�̸��ϼ���</td>
            <td><input type=radio name="emr" value="����"/>����
                  <input type=radio name="emr" value="��������"/>��������
                  </td>
            </tr>
           
            
</table>
<input type="submit" value="ȸ������"/>
<input type="reset" value="�ٽ��ۼ�"/>
</form>
</body>
</center>
