		
			function begin(){
										document.form.id.focus();
								   }
			function begin2(){
										document.userinput.id.focus();
		   }	
			
			function begin3(){
										document.userinput.pw.focus();
			}

			function mem(){
										location.href="/Jsp/member/membershipForm.nhn";
			}
			
			function modify(){
										location.href="/Jsp/member/modify.nhn";
			}
			
			function login(){
										location.href="/Jsp/member/login.nhn";
			}
			function deleteForm(){
										location.href="/Jsp/member/deleteForm.nhn";
			}
			
			function list(){
				document.location.href="/Jsp/ch19/list.do";
			}
			
			
			
			function checkIt(){
										if(!document.form.id.value){
											alert("���̵� �Է����� �ʾҽ��ϴ�.");
										    document.form.id.focus();
										    return false;
										  }
										if(!document.form.pw.value){
										    alert("��й�ȣ�� �Է����� �ʾҽ��ϴ�.");
											document.form.pw.focus();
											return false;
										   }
									}
			
			 function checkForm(){
											 var userinput = eval("document.userinput");
											 if(!userinput.id.value) {
										     alert("ID�� �Է��ϼ���");
										     userinput.id.focus();
										     return false;
										 }
										 
											 if(!userinput.pw.value ) {
											     alert("��й�ȣ�� �Է��ϼ���");
											     userinput.pw.focus();
											     return false;
											 }
											 if(userinput.pw.value != userinput.pw2.value)
											 {
											     alert("��й�ȣ�� �����ϰ� �Է��ϼ���");
											     userinput.pw2.focus();
											     return false;
											 }
											
											 if(!userinput.num1.value)
											 {
											     alert("�ֹι�ȣ ���ڸ� 6�ڸ��� �Է����ּ���");
											     userinput.num1.focus();
											     return false;
											 }
											 if(!userinput.num2.value)
											 {
											     alert("�ֹι�ȣ ���ڸ� 7�ڸ��� �Է����ּ���");
											     userinput.num2.focus();
											     return false;
											 }
											 if(!userinput.adr1.value)
											 {
											     alert("�ּҸ� �Է����ּ���");
											     userinput.adr1.focus();
											     return false;
											 }
											 if(!userinput.adr2.value)
											 {
											     alert("���ּҸ� �Է����ּ���");
											     userinput.adr2.focus();
											     return false;
											 }
											 
											 if(!userinput.pnum1.value)
											 {
											     alert("�߰���ȣ�� �Է����ּ���");
											     userinput.pnum1.focus();
											     return false;
											 }
											 if(!userinput.pnum2.value)
											 {
											     alert("�޹�ȣ�� �Է����ּ���");
											     userinput.pnum2.focus();
											     return false;
											 }
											 if(!userinput.em1.value)
											 {
											     alert("�̸����� �Է����ּ���");
											     userinput.em1.focus();
											     return false;
											 }
											 if(!userinput.em2.value)
											 {
											     alert("�̸����� �Է����ּ���");
											     userinput.em2.focus();
											     return false;
											 }
											 if(userinput.emr.value)
											 {
											     alert("�̸��� ���� ���Ǹ� üũ���ּ���");
											     return false;
											 }
								}
			 	function openConfirmid(id) 
			 				{
				  
					 			if (id == "" ) {    
					 						alert("���̵� �Է��ϼ���");
					 						document.userinput.id.focus();
					 						return;
					 			}
					 			else {
					 						url = "confirmId.nhn?id=" + userinput.id.value ;
					 						open(url, "post",
					 						"toolbar=no, location=no,status=no,menubar=no,scrollbars=no," +
					 						"resizable=no,width=300, height=200");
					 			}
			 				}

			 	function setId(){	
			 							//confirmIdAction�� ���� ���
			 							//opener.document.userinput.id.value="<%=id%>";   "${}"; ���� �ϸ� �ȴ�
			 							self.close();
	
			 						  }