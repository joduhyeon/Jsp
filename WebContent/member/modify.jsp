<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
															<title>ȸ����������</title>
<script src="script.js"></script>


<center>

<h2>&nbsp;ȸ����������</h2>
<body onLoad="begin3()">
<form action="/Jsp/member/modifyPro.nhn" name="userinput" onSubmit="return checkForm()">
<table border=1>

            <tr>
               <td width="120"> &nbsp;*���̵�</td>
               <td width="500"><input type="text" name="id" value="${id}" readonly /></td>
            </tr>
            <tr>
            <td> &nbsp;*��й�ȣ</td>
            <td><input type="password" name="pw" value="${pw}"/></td>
            </tr>
            <tr>
            <td> &nbsp;*��й�ȣȮ��</td> 
            <td><input type="password" name="pw2" value="${pw2}"/></td>   <!-- �� �ױ��ڸ� ������? -->
            </tr>
            <tr>
            <td> &nbsp;*�ּ�</td>
            <td><input type="text" name="adr1" value="${adr1}" />
            <input type="button" value="�ּҰ˻�"/></td>
            </tr>
            <tr>
            <td> &nbsp;*���ּ�</td>
            <td><input type="text" name="adr2" size="35" value="${adr2}"/></td>
            </tr>
            <tr>
            <td>&nbsp;*�޴���</td>
            <td><select name="sel1"><option>010</option><option>011</option><option>017</option></select>
                <input type="text" name="pnum1" size="8" value="${pnum1}"/>
                -<input type="text" name="pnum2" size="8" value="${pnum2}"/></td>
            </tr>
            <tr>
            <td> &nbsp;*�̸���</td>
            <td><input type="text" name="em1" value="${em1}"/>
            	@<input type="text" name="em2" value="${em2}"/>
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
            <td><input type=radio name="emr" value="����" checked="checked"  />����
                  <input type=radio name="emr" value="��������" checked="checked" />��������
                  </td>
            </tr>
</table>
				<input type="submit" value="����"/>
				<input type="button" value="���ư���" onclick="login()"/>
</form>
</body>
</center>