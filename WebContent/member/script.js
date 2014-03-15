		
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
											alert("아이디를 입력하지 않았습니다.");
										    document.form.id.focus();
										    return false;
										  }
										if(!document.form.pw.value){
										    alert("비밀번호를 입력하지 않았습니다.");
											document.form.pw.focus();
											return false;
										   }
									}
			
			 function checkForm(){
											 var userinput = eval("document.userinput");
											 if(!userinput.id.value) {
										     alert("ID를 입력하세요");
										     userinput.id.focus();
										     return false;
										 }
										 
											 if(!userinput.pw.value ) {
											     alert("비밀번호를 입력하세요");
											     userinput.pw.focus();
											     return false;
											 }
											 if(userinput.pw.value != userinput.pw2.value)
											 {
											     alert("비밀번호를 동일하게 입력하세요");
											     userinput.pw2.focus();
											     return false;
											 }
											
											 if(!userinput.num1.value)
											 {
											     alert("주민번호 앞자리 6자리를 입력해주세요");
											     userinput.num1.focus();
											     return false;
											 }
											 if(!userinput.num2.value)
											 {
											     alert("주민번호 뒷자리 7자리를 입력해주세요");
											     userinput.num2.focus();
											     return false;
											 }
											 if(!userinput.adr1.value)
											 {
											     alert("주소를 입력해주세요");
											     userinput.adr1.focus();
											     return false;
											 }
											 if(!userinput.adr2.value)
											 {
											     alert("상세주소를 입력해주세요");
											     userinput.adr2.focus();
											     return false;
											 }
											 
											 if(!userinput.pnum1.value)
											 {
											     alert("중간번호를 입력해주세요");
											     userinput.pnum1.focus();
											     return false;
											 }
											 if(!userinput.pnum2.value)
											 {
											     alert("뒷번호를 입력해주세요");
											     userinput.pnum2.focus();
											     return false;
											 }
											 if(!userinput.em1.value)
											 {
											     alert("이메일을 입력해주세요");
											     userinput.em1.focus();
											     return false;
											 }
											 if(!userinput.em2.value)
											 {
											     alert("이메일을 입력해주세요");
											     userinput.em2.focus();
											     return false;
											 }
											 if(userinput.emr.value)
											 {
											     alert("이메일 수신 동의를 체크해주세요");
											     return false;
											 }
								}
			 	function openConfirmid(id) 
			 				{
				  
					 			if (id == "" ) {    
					 						alert("아이디를 입력하세요");
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
			 							//confirmIdAction의 값을 어떻게
			 							//opener.document.userinput.id.value="<%=id%>";   "${}"; 으로 하면 된다
			 							self.close();
	
			 						  }