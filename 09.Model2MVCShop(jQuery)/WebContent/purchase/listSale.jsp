<%@ page contentType="text/html; charset=euc-kr"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<html>
<head>
<title>구매상품 목록조회</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

<!-- CDN(Content Delivery Network) 호스트 사용 -->
<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>

<script type="text/javascript">
	function fncGetList(currentPage) {
		$("#currentPage").val(currentPage);
		$("form[name=detailForm]").attr("method","POST").attr("action","/purchase/listSale?menu=${param.menu}").submit();
	}
	
	$(function(){
		//검색창 포커싱처리
		$("input[name=searchKeyword]").focus();
	 	
		$("input[name=searchKeyword]").keydown(function(key){
	    	if(key.keyCode == 13){
	    		fncGetList(1);
	    	}
	    } );
	 
		$( "td.ct_btn01:contains('검색')" ).on("click" , function() {
			fncGetList(1);
			console.log($( "td.ct_btn01:contains('검색')" ).html());
		});
		 
		$( ".ct_list_pop td:nth-child(3)" ).on("click" , function() {
				var prodNo = $(this).children("input:hidden").val();
					 self.location ="/product/getProduct?prodNo=" + prodNo + "&menu=${param.menu}";  
					 console.log("prodNo : "+ prodNo); 
		});
			
		//==> UI 수정 추가부분  :  userId LINK Event End User 에게 보일수 있도록 
		$( ".ct_list_pop td:nth-child(3)" ).css("color" , "red");
		$("h7").css("color" , "red");
		
		
		//==> 아래와 같이 정의한 이유는 ??
		//==> 아래의 주석을 하나씩 풀어 가며 이해하세요.					
		$(".ct_list_pop:nth-child(4n+6)" ).css("background-color" , "whitesmoke");
		//console.log ( $(".ct_list_pop:nth-child(1)" ).html() );
		//console.log ( $(".ct_list_pop:nth-child(2)" ).html() );
		//console.log ( $(".ct_list_pop:nth-child(3)" ).html() );
		console.log ( $(".ct_list_pop:nth-child(4)" ).html() ); //==> ok
		//console.log ( $(".ct_list_pop:nth-child(5)" ).html() ); 
		//console.log ( $(".ct_list_pop:nth-child(6)" ).html() ); //==> ok
		//console.log ( $(".ct_list_pop:nth-child(7)" ).html() ); 
		
		$( "#tranUpdate" ).on("click" , function() {
			self.location ="/purchase/updateTranCode?tranNo=${product.proTranCode}&tranCode=2&currentPage=${resultPage.currentPage}"+$(this).text().trim();
		});
		
	});
</script>


</head>

<body bgcolor="#ffffff" text="#000000">

	<div style="width: 98%; margin-left: 10px;">

		<form name="detailForm">

			<table width="100%" height="37" border="0" cellpadding="0"
				cellspacing="0">
				<tr>
					<td width="15" height="37"><img src="/images/ct_ttl_img01.gif"
						width="15" height="37" /></td>
					<td background="/images/ct_ttl_img02.gif" width="100%"
						style="padding-left: 10px;">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
									<td width="93%" class="ct_ttl01">구매상품 목록조회</td>
							</tr>
						</table>
					</td>
					<td width="12" height="37"><img src="/images/ct_ttl_img03.gif"
						width="12" height="37" /></td>
				</tr>
			</table>

			<table width="100%" border="0" cellspacing="0" cellpadding="0"
				style="margin-top: 10px;">
				<tr>
					<td align="right"><select name="searchCondition"
						class="ct_input_g" style="width: 80px">
							
						<option value="0" ${!empty search.searchCondition && search.searchCondition == "0" ? "selected" : ""} >상품번호</option>
						
						<option value="1" ${!empty search.searchCondition && search.searchCondition == "1" ? "selected" : ""} >상품명</option>
					
						<option value="2" ${!empty search.searchCondition && search.searchCondition == "2" ? "selected" : ""} >상품가격</option>

					</select> <input type="text" name="searchKeyword"
						value="${searchKeyword}" class="ct_input_g"
						style="width: 200px; height: 19px" /></td>


					<!-- null 유효성체크하는 부분을 메소드로 빼서 지웠음. -->
					<td align="right" width="70">
						<table border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td width="17" height="23"><img
									src="/images/ct_btnbg01.gif" width="17" height="23"></td>
								<td background="/images/ct_btnbg02.gif" class="ct_btn01"
									style="padding-top: 3px;"><a
									href="javascript:fncGetList('1');">검색</a></td>
								<td width="14" height="23"><img
									src="/images/ct_btnbg03.gif" width="14" height="23"></td>
							</tr>
						</table>
					</td>
				</tr>
			</table>


			<table width="100%" border="0" cellspacing="0" cellpadding="0"
				style="margin-top: 10px;">
				<tr>
					<td colspan="11">전체 ${resultPage.totalCount} 건수, 현재 ${resultPage.currentPage} 페이지
					</td>
				</tr>
				<tr>
					<td class="ct_list_b" width="100">No</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b" width="150">상품명</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b" width="150">가격</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b">등록일</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b">현재상태</td>
				</tr>
				<tr>
					<td colspan="11" bgcolor="808285" height="1"></td>
				</tr>
				
				<c:set var="i" value="0" />
				<c:forEach var="purchase" items="${list}">
					<c:set var="i" value="${i + 1}" />
						<tr class="ct_list_pop">
						<td align="center">${i}</td>
						<td></td>
	
						<td align="left">
							<%-- <a
							href="/product/getProduct?prodNo=${purchase.purchaseProd.prodNo}&menu=${param.menu}">${purchase.purchaseProd.prodName}</a> --%>
							<input type="hidden" value="${purchase.purchaseProd.prodNo}"/>
							${purchase.purchaseProd.prodName}
						</td>
						
						<!-- sale이 아니라면  -->
					
						<td></td>
						<td align="left">${purchase.purchaseProd.price}</td>
						<td></td>
						<td align="left">${purchase.purchaseProd.regDate}</td>
						<td></td>
						<td align="left">
						
						<!-- 어드민이 아직 구매를 하지않은 물품을 보는 경우 -->
						<c:if test="${purchase.tranCode == 'sale'}">
							판매중
						</c:if>
						
						<!-- 어드민이 구매를 한 user에게 [배송을 보내기전] 첫번째 -->
						<c:if test="${fn:trim(purchase.tranCode) == '1'}">
							구매 완료 <a href="/purchase/updateTranCode?tranNo=${purchase.tranNo}&tranCode=2&currentPage=${resultPage.currentPage}"> 배송하기 </a>
						</c:if>
						
						<!-- user에게 배송을 보낸 후 [수령확인]을 기다리는 중 -->
						<c:if test="${fn:trim(purchase.tranCode) == '2'}">
							배송중, 구매자 수령대기
						</c:if>
						
						<!-- user가 [구매확정]을 누른경우  -->
						<c:if test="${fn:trim(purchase.tranCode) == '3'}">
							구매완료
						</c:if>
						
					</td>
				</tr>
				<tr>
					<td colspan="11" bgcolor="D6D7D6" height="1"></td>
				</tr>
				
			</c:forEach>
			</table>

			<table width="100%" border="0" cellspacing="0" cellpadding="0"
				style="margin-top: 10px;">
				<tr>
					<td align="center"><input type="hidden" id="currentPage"
						name="currentPage" value="" /> <!-- page navigation의 반복적인 c&p로 공통모듈로 빼놓음 -->
						<jsp:include page="../common/pageNavigator.jsp" />
				</tr>
			</table>

		</form>

	</div>
</body>
</html>
