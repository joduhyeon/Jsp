<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<title>ȸ��������</title>
<h2>&nbsp;ȸ������</h2>
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
            alert("ID�� �Է��ϼ���");
            return false;
        }
        
        if(!userinput.pw.value ) {
            alert("��й�ȣ�� �Է��ϼ���");
            return false;
        }
        if(userinput.pw.value != userinput.pw2.value)
        {
            alert("��й�ȣ�� �����ϰ� �Է��ϼ���");
            return false;
        }
       
        if(!userinput.num1.value  || !userinput.num2.value )
        {
            alert("�ֹε�Ϲ�ȣ�� �Է��ϼ���");
            return false;
        }
        if(!userinput.adr1.value  || !userinput.adr2.value )
        {
            alert("�ּҸ� �Է����ּ���");
            return false;
        }
        if(!userinput.pnum1.value || !userinput.pnum2.value )
        {
            alert("�ڵ��� ��ȣ�� �Է����ּ���");
            return false;
        }
        if(!userinput.em1.value || !userinput.em2.value )
        {
            alert("�̸����� �Է����ּ���");
            return false;
        }
        if(userinput.emr.value)
        {
            alert("�̸��� ���� ���Ǹ� üũ���ּ���");
            return false;
        }
        
    }
function openConfirmid(userinput) {
    // ���̵� �Է��ߴ��� �˻�
    if (userinput.id.value == "") {    //�˻��ϴ� ��
        alert("���̵� �Է��ϼ���");
        return;
    }
    // url�� ����� �Է� id�� �����մϴ�.
    url = "confirmId.jsp?id=" + userinput.id.value ;
    
    // ���ο� �����츦 ���ϴ�.
    open(url, "confirm", //â�� ���°��̰� ���ٰ����� ��ġ�� ���� ����� �ɼ��̴�.
    "toolbar=no, location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=300, height=200");
   //������ �ȵǴ°� ���������� ȯ���� �޶� �̴�.
}
</script>
<form action="formPro.jsp" name="userinput" onSubmit="return checkIt()">
<table border=1>

            <tr>
               <td width="120"> &nbsp;*���̵�</td>
               <td width="500"><input type="text" name="id"/>
                               <input type="button" value="�ߺ�üũ" OnClick="openConfirmid(this.form)"/>
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
 <div class="bt">
 <input type="submit" name="confirm" value="ȸ������"/>
 <input type="reset" value="�ٽ��ۼ�"/>
 </div>

</form>