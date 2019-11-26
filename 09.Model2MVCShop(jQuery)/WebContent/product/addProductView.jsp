<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>



<html>
<head>
<title>상품등록</title>

<!-- 기존 -->
<link rel="stylesheet" href="/css/admin.css" type="text/css">
<!-- 버튼변경을 위해 아래 2개 추가 -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<!-- 기존 -->
<!-- <script src="http://code.jquery.com/jquery-2.1.4.min.js"></script> -->
<!-- 버튼변경을 위해 아래 2개 추가 -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script type="text/javascript" src="../javascript/calendar.js">
</script>
<style type="text/css">

	.widget{
	  background-color: #000000;
	  color: skyblue;
	  float: right;
	  padding: 5px;
	  border-radius: 10px;
	  -moz-border-radius: 10px;
	  -webkit-border-radius: 10px;
	}
	
</style>


<script type="text/javascript">

 $( function() {
	 
	
	
    $( ".widget button" ).button();
    $("td.ct_btn01:contains('등록')").on('click', function(){
    	fncAddProduct();
    } );
    
    $("button[name=add]").keydown(function(key){
    	if(key.keyCode == 13){
    		fncAddProduct();
    	}
    } );
    	
  } ); 
 
 $( function() {
	//들어오자마자 포커스를 첫번째 상품명 적는곳으로 위치
	$("input[name=prodName]").focus();
 	
    $( ".widget button" ).button();
    
    $("td.ct_btn01:contains('취소')").on('click', function(){
    	$(function (){
    		/* on = bind와 같은 효과의 펑션 */
    		$("td.ct_btn01:contains('취소')").on('click', function(){
    			$("form")[0].reset();
    		});
    		/* document.detailForm.reset(); */
    	});
    } );
  } ); 

function fncAddProduct(){
	
	

	//Form 유효성 검증
 	var name = $("input[name='prodName']").val();
	var detail = $("input[name='prodDetail']").val();
	var manuDate = $("input[name='manuDate']").val();
	var price = $("input[name='price']").val();
	var fileName = $("input[name='fileName']").val();
	console.log("name : " + name + "detail : " + detail + "manuDate : " + manuDate +"price : " + price );

	if(name == null || name.length<1){
		alert("상품명은 반드시 입력하여야 합니다.");
		return;
	}
	if(detail == null || detail.length<1){
		alert("상품상세정보는 반드시 입력하여야 합니다.");
		return;
	}
	if(manuDate == null || manuDate.length<1){
		alert("제조일자는 반드시 입력하셔야 합니다.");
		return;
	}
	if(price == null || price.length<1){
		alert("가격은 반드시 입력하셔야 합니다.");
		return;
	}
	/* if(fileName == null || fileName.length<1){
		alert("파일이름은 반드시 입력하셔야 합니다.");
		return;
	}
 */ 
 
    
 	/* $("form").attr("method","POST").attr("action","/product/addProduct").attr("enctype","multipart/form-data").submit(); */
 	$("form").attr("method","POST").attr("action","/product/addProduct").submit();
 		/* method="post" enctype="multipart/form-data" */
	//document.detailForm.action='/product/addProduct';
	//document.detailForm.submit();
}




	 /* $(function() {
	 	$("td.ct_btn01:contains('등록')").on('click', function(){
	 		fncAddProduct();
		});
	});	 
 */
	

</script>
</head>

<body bgcolor="#ffffff" text="#000000">

<form name="detailForm" >

<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37">
			<img src="/images/ct_ttl_img01.gif" width="15" height="37"/>
		</td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left: 10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">상품등록</td>
					<td width="20%" align="right">&nbsp;</td>
				</tr>
			</table>
		</td>
		<td width="12" height="37">
			<img src="/images/ct_ttl_img03.gif"	width="12" height="37"/>
		</td>
	</tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top: 13px;">
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write" >
			상품명 <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle">
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="105">
						<input type="text" name="prodName" class="ct_input_g" 
									style="width: 100px; height: 19px" maxLength="20">
									
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">
			상품상세정보 <img	src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<input type="text" name="prodDetail" class="ct_input_g" 
						style="width: 100px; height: 19px" maxLength="10" minLength="6"/>
		</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">
			제조일자 <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<input type="text" name="manuDate" readonly="readonly" class="ct_input_g"  
						style="width: 100px; height: 19px"	maxLength="10" minLength="6"/>
				&nbsp;<img src="../images/ct_icon_date.gif" width="15" height="15" 
										onclick="show_calendar('document.detailForm.manuDate', document.detailForm.manuDate.value)"/>
		</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">
			가격 <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<input type="text" name="price" 	class="ct_input_g" 
						style="width: 100px; height: 19px" maxLength="10">&nbsp;원
		</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">상품이미지</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<input	multiple="multiple"	type="file" name="fileName" class="ct_input_g" 
							style="width: 200px; height: 19px" maxLength="13"/>
		</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top: 10px;">
	<tr>
		<td width="53%"></td>
		<td align="right">
		<table border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td >
					<!-- <img src="/images/ct_btnbg01.gif" width="17" height="23"/> -->
				</td>
				<td class="ct_btn01">
				<!-- <td background="/images/ct_btnbg02.gif" class="ct_btn01"  style="padding-top: 3px;"> -->
					 <div class="widget">
						<button name="add">등록</button>
					<!-- <a href="javascript:fncAddProduct();">등록</a> -->
					</div>
				</td>
				<td >
					<!-- <img src="/images/ct_btnbg03.gif" width="14" height="23"/> -->
				</td>
				<td width="10"></td>
				<td >
<!-- 				<td width="17" height="23"> -->
					<!-- <img src="/images/ct_btnbg01.gif" width="17" height="23"/> -->
				</td>
				<td class="ct_btn01" >
<!-- 				<td background="/images/ct_btnbg02.gif" class="ct_btn01"	 style="padding-top: 3px;"> -->
					<!-- <a href="javascript:resetData();">취소</a> -->
					<div class="widget" >
						<button name="rollback">취소</button>
					<!-- <a href="javascript:fncAddProduct();">등록</a> -->
					</div>
					
				</td>
				<td width="14" height="35">
					<!-- <img src="/images/ct_btnbg03.gif" width="14" height="23"/> -->
				</td>
			</tr>
		</table>
		</td>
	</tr>
</table>

</form>
</body>
</html>