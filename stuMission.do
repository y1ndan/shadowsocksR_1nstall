
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>学生评价任务</title>
<link href="css/cssStyle.css" rel="stylesheet" type="text/css" />
<link href="css/main_content.css" rel="stylesheet" type="text/css">
<LINK href="css/themes.css" type=text/css rel=stylesheet>
<link rel="stylesheet" href="./css/ui.datepicker.css" />
<script language="JavaScript" src="./js/jq.js"></script>
<script language="JavaScript" src="./js/jq.date.js"></script> 
<script language='javascript' src='script/common/ValidatorPro.js'></script>
<script language='javascript' src="js/jquery/jquery-1.4.4.min.js"></script>


</link></link>

<script type="text/javascript">
function delSkrw(skid,courseid,courseCtype,teacherid)
{
	var stuid = $("#id").val();
    if(confirm("系统将删除该评教任务，同时记录你的删除记录并进行核查，如是不真实删除行为，你将在系统留下不诚信评教记录，请慎选！"))
    {
       
        $.ajax({
		cache: true,
		async: false,
		type: "POST",
		url: "stuDelSkrw.do",
		data:{"id":stuid,"skid":skid,"courseid":courseid,"courseCtype":courseCtype,"teacherid":teacherid},  
		success: function(msg) 
		{
			if(msg =="0")
			{
			  alert("该评教任务已删除，请勿重复操作");
       		  //alert("删除成功");
			}
			if(msg =="1")
			{
			  alert("当前学期您已经超出了允许删除的最大数量，请和评教教师联系");
			}
			if(msg =="2")
			{
			 alert("删除失败！请重新登录查看是否已经删除评教任务");
			}
		 }
	  	}); 
    }
	//window.history.back();//返回父页面
	window.location.reload();
}
</script>
<body>
<form action="stuMission.do" method="post" id="form1" name="form1">
<input type="hidden" name ="id" id ="id" value="8ae4b08b501c2c35015020fb2e260479"/>
<table width="100%" border="0" id="datatable" cellpadding="5" cellspacing="1" class="tableBorder">
	
	<!--  
  <tr>
    <td class="tr_title" colspan="2">&nbsp;</td>
   
  </tr>-->
  <tr>
    <td class="tr_title" colspan="2"><span class="f12h15_red" colspan="2">欢迎您：蓝素娴！</span></td>
  </tr>
  <tr>
    <td class="tr_title" colspan="2">
    本学期（2017_02-2017_07）您共有48个评价任务</td>
  </tr>
  <tr>
    <td class="tr_title" colspan="2">已经完成0个任务</td>
  </tr>
   <tr>
    <td class="tr_title" colspan="2">
    尚未完成的还有48
    个任务
    </td>
  </tr>
  <tr>
    <td class="tr_title" colspan="2"><div align="left">【<a href="doLogout.do" target="_parent" class="f12h17_blod_black">退出系统</a>】</div></td>
  </tr>
  <tr>
    <td bgcolor="#FFFFFF" colspan="2" >
    <div align="right" style="margin-right: 30px;">
    <!-- 
	    <select id="ispg" name="ispg">
		    <option value="-1">--查询全部--</option>
		    <option value="0">未评价</option>
		    <option value="1">已评价</option>
	    </select>
	     -->
	    &nbsp;&nbsp;&nbsp;&nbsp;
	    教师姓名:<input type="text" id="tname" name="tname" style="width: 100px;" value=""/>
	    &nbsp;&nbsp;&nbsp;&nbsp;
	    <input type="submit" value="查询"/>
    </div>
    </td>
  </tr>
  <tr>
    <td class="tr_title" align="center" class="f12h17_blod_black" colspan="2"> 本学期所有的评价任务</td>
  </tr>
</table>
</form>
<hr size='0' />

<table width="100%" height="25"  align="center" border="0" id="datatable" cellpadding="5" cellspacing="1" class="tableBorder">
  <tr >
    <th width="30%" align="center" class="tr_title" scope="col">课程</th>
   <!--  <th width="10%" align="center" class="tr_title" scope="col">内容</th> -->
    <th width="10%" align="center" class="tr_title" scope="col">课程类型</th>
    
    <th width="10%" align="center" class="tr_title" scope="col">任课教师</th>
   <th width="10%" align="center" class="tr_title" scope="col">是否已评价</th>
    <th width="20%" align="center" class="tr_title" scope="col">不评价</th>
  </tr>
  <tr  bgcolor="#FFFFFF" style="color:FFFFFF">
    <th align="center" scope="col" class="f12h15_black">预防医学</th>
    <!-- <th align="left" scope="col" class="f12h15_black">0000</th> -->
    <th align="center" scope="col" class="f12h15_black">
     	理论课
    </th>
    <th align="center" scope="col" class="f12h15_black">黄开勇
    </th>
    <th align="center" scope="col" class="f12h15_black">
    	
		    <span class="STYLE3">
		    <a href="stupg.do?courseid=8ae4b08b4c31a81c014c44a0e1ac64e4&ctype=1&skid=8ae4b08c5af41ca3015aff875b905195&contentid=8ae4b08b4c31a81c014c44a0e1ac6509&tcid=8ae4b08b4c31a81c014c44a0e1ac650a&cname=预防医学&tname=黄开勇&teacherid=8ae4b08b48c018260148c4aac35a29e3">未评价</a>
		   <!--  /<a href="stupg1.dq?courseid=8ae4b08b4c31a81c014c44a0e1ac64e4&ctype=1&skid=8ae4b08c5af41ca3015aff875b905195&contentid=8ae4b08b4c31a81c014c44a0e1ac6509&tcid=8ae4b08b4c31a81c014c44a0e1ac650a&cname=预防医学&tname=黄开勇&teacherid=8ae4b08b48c018260148c4aac35a29e3">I am a student</a>
		    </span>-->
		    
		  
		
	</th>
	
	 <th align="center" scope="col" class="f12h15_black">
	 
		 <a href="#" onclick="delSkrw('8ae4b08c5af41ca3015aff875b905195','8ae4b08b4c31a81c014c44a0e1ac64e4','1','8ae4b08b48c018260148c4aac35a29e3')">删除评教任务（该教师未上过课）</a>
	 </th>
	
  </tr>

  <tr bgcolor="#F2F2F2" style="color:FFFFFF">
    <th align="center" scope="col" class="f12h15_black">预防医学</th>
    <!-- <th align="left" scope="col" class="f12h15_black">0000</th> -->
    <th align="center" scope="col" class="f12h15_black">
     	理论课
    </th>
    <th align="center" scope="col" class="f12h15_black">万逢洁
    </th>
    <th align="center" scope="col" class="f12h15_black">
    	
		    <span class="STYLE3">
		    <a href="stupg.do?courseid=8ae4b08b4c31a81c014c44a0e1ac64e4&ctype=1&skid=8ae4b08c5af41ca3015aff8f69bf55af&contentid=8ae4b08b4c31a81c014c44a0e1ac650d&tcid=8ae4b08b4c31a81c014c44a0e1ac650e&cname=预防医学&tname=万逢洁&teacherid=8ae4b08b165584940116563fe34c0219">未评价</a>
		   <!--  /<a href="stupg1.dq?courseid=8ae4b08b4c31a81c014c44a0e1ac64e4&ctype=1&skid=8ae4b08c5af41ca3015aff8f69bf55af&contentid=8ae4b08b4c31a81c014c44a0e1ac650d&tcid=8ae4b08b4c31a81c014c44a0e1ac650e&cname=预防医学&tname=万逢洁&teacherid=8ae4b08b165584940116563fe34c0219">I am a student</a>
		    </span>-->
		    
		  
		
	</th>
	
	 <th align="center" scope="col" class="f12h15_black">
	 
		 <a href="#" onclick="delSkrw('8ae4b08c5af41ca3015aff8f69bf55af','8ae4b08b4c31a81c014c44a0e1ac64e4','1','8ae4b08b165584940116563fe34c0219')">删除评教任务（该教师未上过课）</a>
	 </th>
	
  </tr>

  <tr  bgcolor="#FFFFFF" style="color:FFFFFF">
    <th align="center" scope="col" class="f12h15_black">预防医学</th>
    <!-- <th align="left" scope="col" class="f12h15_black">0000</th> -->
    <th align="center" scope="col" class="f12h15_black">
     	理论课
    </th>
    <th align="center" scope="col" class="f12h15_black">何敏
    </th>
    <th align="center" scope="col" class="f12h15_black">
    	
		    <span class="STYLE3">
		    <a href="stupg.do?courseid=8ae4b08b4c31a81c014c44a0e1ac64e4&ctype=1&skid=8ae4b08c5af41ca3015aff95ec075ad5&contentid=8ae4b08b4c31a81c014c44a0e1ac64e5&tcid=8ae4b08b4c31a81c014c44a0e1ac64e6&cname=预防医学&tname=何敏&teacherid=8ae4b08b44d9b07c0144dd45a4db37b5">未评价</a>
		   <!--  /<a href="stupg1.dq?courseid=8ae4b08b4c31a81c014c44a0e1ac64e4&ctype=1&skid=8ae4b08c5af41ca3015aff95ec075ad5&contentid=8ae4b08b4c31a81c014c44a0e1ac64e5&tcid=8ae4b08b4c31a81c014c44a0e1ac64e6&cname=预防医学&tname=何敏&teacherid=8ae4b08b44d9b07c0144dd45a4db37b5">I am a student</a>
		    </span>-->
		    
		  
		
	</th>
	
	 <th align="center" scope="col" class="f12h15_black">
	 
		 <a href="#" onclick="delSkrw('8ae4b08c5af41ca3015aff95ec075ad5','8ae4b08b4c31a81c014c44a0e1ac64e4','1','8ae4b08b44d9b07c0144dd45a4db37b5')">删除评教任务（该教师未上过课）</a>
	 </th>
	
  </tr>

  <tr bgcolor="#F2F2F2" style="color:FFFFFF">
    <th align="center" scope="col" class="f12h15_black">预防医学</th>
    <!-- <th align="left" scope="col" class="f12h15_black">0000</th> -->
    <th align="center" scope="col" class="f12h15_black">
     	理论课
    </th>
    <th align="center" scope="col" class="f12h15_black">杨莉
    </th>
    <th align="center" scope="col" class="f12h15_black">
    	
		    <span class="STYLE3">
		    <a href="stupg.do?courseid=8ae4b08b4c31a81c014c44a0e1ac64e4&ctype=1&skid=8ae4b08c5af41ca3015b0055d44060d3&contentid=8ae4b08b4c31a81c014c44a0e1ac6513&tcid=8ae4b08b4c31a81c014c44a0e1ac6514&cname=预防医学&tname=杨莉&teacherid=8ae4b08b185f7a1401190e254df10b76">未评价</a>
		   <!--  /<a href="stupg1.dq?courseid=8ae4b08b4c31a81c014c44a0e1ac64e4&ctype=1&skid=8ae4b08c5af41ca3015b0055d44060d3&contentid=8ae4b08b4c31a81c014c44a0e1ac6513&tcid=8ae4b08b4c31a81c014c44a0e1ac6514&cname=预防医学&tname=杨莉&teacherid=8ae4b08b185f7a1401190e254df10b76">I am a student</a>
		    </span>-->
		    
		  
		
	</th>
	
	 <th align="center" scope="col" class="f12h15_black">
	 
		 <a href="#" onclick="delSkrw('8ae4b08c5af41ca3015b0055d44060d3','8ae4b08b4c31a81c014c44a0e1ac64e4','1','8ae4b08b185f7a1401190e254df10b76')">删除评教任务（该教师未上过课）</a>
	 </th>
	
  </tr>

  <tr  bgcolor="#FFFFFF" style="color:FFFFFF">
    <th align="center" scope="col" class="f12h15_black">预防医学</th>
    <!-- <th align="left" scope="col" class="f12h15_black">0000</th> -->
    <th align="center" scope="col" class="f12h15_black">
     	理论课
    </th>
    <th align="center" scope="col" class="f12h15_black">肖德强
    </th>
    <th align="center" scope="col" class="f12h15_black">
    	
		    <span class="STYLE3">
		    <a href="stupg.do?courseid=8ae4b08b4c31a81c014c44a0e1ac64e4&ctype=1&skid=8ae4b08c5af41ca3015b005ec0336391&contentid=8ae4b08b4c31a81c014c44a0e1ac64f7&tcid=8ae4b08b4c31a81c014c44a0e1ac64f8&cname=预防医学&tname=肖德强&teacherid=8ae4b08b185f7a1401190e284c5c0b7b">未评价</a>
		   <!--  /<a href="stupg1.dq?courseid=8ae4b08b4c31a81c014c44a0e1ac64e4&ctype=1&skid=8ae4b08c5af41ca3015b005ec0336391&contentid=8ae4b08b4c31a81c014c44a0e1ac64f7&tcid=8ae4b08b4c31a81c014c44a0e1ac64f8&cname=预防医学&tname=肖德强&teacherid=8ae4b08b185f7a1401190e284c5c0b7b">I am a student</a>
		    </span>-->
		    
		  
		
	</th>
	
	 <th align="center" scope="col" class="f12h15_black">
	 
		 <a href="#" onclick="delSkrw('8ae4b08c5af41ca3015b005ec0336391','8ae4b08b4c31a81c014c44a0e1ac64e4','1','8ae4b08b185f7a1401190e284c5c0b7b')">删除评教任务（该教师未上过课）</a>
	 </th>
	
  </tr>

  <tr bgcolor="#F2F2F2" style="color:FFFFFF">
    <th align="center" scope="col" class="f12h15_black">预防医学</th>
    <!-- <th align="left" scope="col" class="f12h15_black">0000</th> -->
    <th align="center" scope="col" class="f12h15_black">
     	理论课
    </th>
    <th align="center" scope="col" class="f12h15_black">黄志碧
    </th>
    <th align="center" scope="col" class="f12h15_black">
    	
		    <span class="STYLE3">
		    <a href="stupg.do?courseid=8ae4b08b4c31a81c014c44a0e1ac64e4&ctype=1&skid=8ae4b08c5af41ca3015b00665d30672a&contentid=8ae4b08b4c31a81c014c44a0e1ac64f3&tcid=8ae4b08b4c31a81c014c44a0e1ac64f4&cname=预防医学&tname=黄志碧&teacherid=8ae4b08b199d5f150119b196f9550170">未评价</a>
		   <!--  /<a href="stupg1.dq?courseid=8ae4b08b4c31a81c014c44a0e1ac64e4&ctype=1&skid=8ae4b08c5af41ca3015b00665d30672a&contentid=8ae4b08b4c31a81c014c44a0e1ac64f3&tcid=8ae4b08b4c31a81c014c44a0e1ac64f4&cname=预防医学&tname=黄志碧&teacherid=8ae4b08b199d5f150119b196f9550170">I am a student</a>
		    </span>-->
		    
		  
		
	</th>
	
	 <th align="center" scope="col" class="f12h15_black">
	 
		 <a href="#" onclick="delSkrw('8ae4b08c5af41ca3015b00665d30672a','8ae4b08b4c31a81c014c44a0e1ac64e4','1','8ae4b08b199d5f150119b196f9550170')">删除评教任务（该教师未上过课）</a>
	 </th>
	
  </tr>

  <tr  bgcolor="#FFFFFF" style="color:FFFFFF">
    <th align="center" scope="col" class="f12h15_black">预防医学</th>
    <!-- <th align="left" scope="col" class="f12h15_black">0000</th> -->
    <th align="center" scope="col" class="f12h15_black">
     	理论课
    </th>
    <th align="center" scope="col" class="f12h15_black">苏晶Sujing
    </th>
    <th align="center" scope="col" class="f12h15_black">
    	
		    <span class="STYLE3">
		    <a href="stupg.do?courseid=8ae4b08b4c31a81c014c44a0e1ac64e4&ctype=1&skid=8ae4b08c5af41ca3015b006d92576b93&contentid=8ae4b08b4c31a81c014c44a0e1ac6501&tcid=8ae4b08b4c31a81c014c44a0e1ac6502&cname=预防医学&tname=苏晶Sujing&teacherid=8ae4b08b199d5f150119b19ac2450176">未评价</a>
		   <!--  /<a href="stupg1.dq?courseid=8ae4b08b4c31a81c014c44a0e1ac64e4&ctype=1&skid=8ae4b08c5af41ca3015b006d92576b93&contentid=8ae4b08b4c31a81c014c44a0e1ac6501&tcid=8ae4b08b4c31a81c014c44a0e1ac6502&cname=预防医学&tname=苏晶Sujing&teacherid=8ae4b08b199d5f150119b19ac2450176">I am a student</a>
		    </span>-->
		    
		  
		
	</th>
	
	 <th align="center" scope="col" class="f12h15_black">
	 
		 <a href="#" onclick="delSkrw('8ae4b08c5af41ca3015b006d92576b93','8ae4b08b4c31a81c014c44a0e1ac64e4','1','8ae4b08b199d5f150119b19ac2450176')">删除评教任务（该教师未上过课）</a>
	 </th>
	
  </tr>

  <tr bgcolor="#F2F2F2" style="color:FFFFFF">
    <th align="center" scope="col" class="f12h15_black">预防医学</th>
    <!-- <th align="left" scope="col" class="f12h15_black">0000</th> -->
    <th align="center" scope="col" class="f12h15_black">
     	理论课
    </th>
    <th align="center" scope="col" class="f12h15_black">王晓敏
    </th>
    <th align="center" scope="col" class="f12h15_black">
    	
		    <span class="STYLE3">
		    <a href="stupg.do?courseid=8ae4b08b4c31a81c014c44a0e1ac64e4&ctype=1&skid=8ae4b08c5af41ca3015b0071ff436e24&contentid=8ae4b08b4c31a81c014c44a0e1ac651f&tcid=8ae4b08b4c31a81c014c44a0e1ac6520&cname=预防医学&tname=王晓敏&teacherid=8ae4b0e339e6db38013a0b09d8bc56d8">未评价</a>
		   <!--  /<a href="stupg1.dq?courseid=8ae4b08b4c31a81c014c44a0e1ac64e4&ctype=1&skid=8ae4b08c5af41ca3015b0071ff436e24&contentid=8ae4b08b4c31a81c014c44a0e1ac651f&tcid=8ae4b08b4c31a81c014c44a0e1ac6520&cname=预防医学&tname=王晓敏&teacherid=8ae4b0e339e6db38013a0b09d8bc56d8">I am a student</a>
		    </span>-->
		    
		  
		
	</th>
	
	 <th align="center" scope="col" class="f12h15_black">
	 
		 <a href="#" onclick="delSkrw('8ae4b08c5af41ca3015b0071ff436e24','8ae4b08b4c31a81c014c44a0e1ac64e4','1','8ae4b0e339e6db38013a0b09d8bc56d8')">删除评教任务（该教师未上过课）</a>
	 </th>
	
  </tr>

  <tr  bgcolor="#FFFFFF" style="color:FFFFFF">
    <th align="center" scope="col" class="f12h15_black">预防医学</th>
    <!-- <th align="left" scope="col" class="f12h15_black"></th> -->
    <th align="center" scope="col" class="f12h15_black">
     	理论课
    </th>
    <th align="center" scope="col" class="f12h15_black">黄美梦
    </th>
    <th align="center" scope="col" class="f12h15_black">
    	
		    <span class="STYLE3">
		    <a href="stupg.do?courseid=8ae4b08b4c31a81c014c44a0e1ac64e4&ctype=1&skid=8ae4b08c5af41ca3015b0075b095718d&contentid=8ae4b08c57f6bb830157f9bbb5293773&tcid=8ae4b08c57f6bb830157f9bbb5293774&cname=预防医学&tname=黄美梦&teacherid=8ae4b08c57b831130157d6c7b5672490">未评价</a>
		   <!--  /<a href="stupg1.dq?courseid=8ae4b08b4c31a81c014c44a0e1ac64e4&ctype=1&skid=8ae4b08c5af41ca3015b0075b095718d&contentid=8ae4b08c57f6bb830157f9bbb5293773&tcid=8ae4b08c57f6bb830157f9bbb5293774&cname=预防医学&tname=黄美梦&teacherid=8ae4b08c57b831130157d6c7b5672490">I am a student</a>
		    </span>-->
		    
		  
		
	</th>
	
	 <th align="center" scope="col" class="f12h15_black">
	 
		 <a href="#" onclick="delSkrw('8ae4b08c5af41ca3015b0075b095718d','8ae4b08b4c31a81c014c44a0e1ac64e4','1','8ae4b08c57b831130157d6c7b5672490')">删除评教任务（该教师未上过课）</a>
	 </th>
	
  </tr>

  <tr bgcolor="#F2F2F2" style="color:FFFFFF">
    <th align="center" scope="col" class="f12h15_black">预防医学</th>
    <!-- <th align="left" scope="col" class="f12h15_black">1</th> -->
    <th align="center" scope="col" class="f12h15_black">
     	实验、见习课 
    </th>
    <th align="center" scope="col" class="f12h15_black">肖德强
    </th>
    <th align="center" scope="col" class="f12h15_black">
    	
		    <span class="STYLE3">
		    <a href="stupg.do?courseid=8ae4b08b4c31a81c014c44b814e5654d&ctype=2&skid=8ae4b08c5af41ca3015b036ea7b87d89&contentid=8ae4b08b4c31a81c014c44b814e56560&tcid=8ae4b08b4c31a81c014c44b814e56561&cname=预防医学&tname=肖德强&teacherid=8ae4b08b185f7a1401190e284c5c0b7b">未评价</a>
		   <!--  /<a href="stupg1.dq?courseid=8ae4b08b4c31a81c014c44b814e5654d&ctype=2&skid=8ae4b08c5af41ca3015b036ea7b87d89&contentid=8ae4b08b4c31a81c014c44b814e56560&tcid=8ae4b08b4c31a81c014c44b814e56561&cname=预防医学&tname=肖德强&teacherid=8ae4b08b185f7a1401190e284c5c0b7b">I am a student</a>
		    </span>-->
		    
		  
		
	</th>
	
	 <th align="center" scope="col" class="f12h15_black">
	 
		 <a href="#" onclick="delSkrw('8ae4b08c5af41ca3015b036ea7b87d89','8ae4b08b4c31a81c014c44b814e5654d','2','8ae4b08b185f7a1401190e284c5c0b7b')">删除评教任务（该教师未上过课）</a>
	 </th>
	
  </tr>

  <tr  bgcolor="#FFFFFF" style="color:FFFFFF">
    <th align="center" scope="col" class="f12h15_black">预防医学</th>
    <!-- <th align="left" scope="col" class="f12h15_black">1</th> -->
    <th align="center" scope="col" class="f12h15_black">
     	实验、见习课 
    </th>
    <th align="center" scope="col" class="f12h15_black">陆彩玲
    </th>
    <th align="center" scope="col" class="f12h15_black">
    	
		    <span class="STYLE3">
		    <a href="stupg.do?courseid=8ae4b08b4c31a81c014c44b814e5654d&ctype=2&skid=8ae4b08c5af41ca3015b0373ad5c0187&contentid=8ae4b08b4c31a81c014c44b814e56588&tcid=8ae4b08b4c31a81c014c44b814e56589&cname=预防医学&tname=陆彩玲&teacherid=8ae4b08b1c977ee4011c9c51e29c08f3">未评价</a>
		   <!--  /<a href="stupg1.dq?courseid=8ae4b08b4c31a81c014c44b814e5654d&ctype=2&skid=8ae4b08c5af41ca3015b0373ad5c0187&contentid=8ae4b08b4c31a81c014c44b814e56588&tcid=8ae4b08b4c31a81c014c44b814e56589&cname=预防医学&tname=陆彩玲&teacherid=8ae4b08b1c977ee4011c9c51e29c08f3">I am a student</a>
		    </span>-->
		    
		  
		
	</th>
	
	 <th align="center" scope="col" class="f12h15_black">
	 
		 <a href="#" onclick="delSkrw('8ae4b08c5af41ca3015b0373ad5c0187','8ae4b08b4c31a81c014c44b814e5654d','2','8ae4b08b1c977ee4011c9c51e29c08f3')">删除评教任务（该教师未上过课）</a>
	 </th>
	
  </tr>

  <tr bgcolor="#F2F2F2" style="color:FFFFFF">
    <th align="center" scope="col" class="f12h15_black">预防医学</th>
    <!-- <th align="left" scope="col" class="f12h15_black">1</th> -->
    <th align="center" scope="col" class="f12h15_black">
     	实验、见习课 
    </th>
    <th align="center" scope="col" class="f12h15_black">农炳金
    </th>
    <th align="center" scope="col" class="f12h15_black">
    	
		    <span class="STYLE3">
		    <a href="stupg.do?courseid=8ae4b08b4c31a81c014c44b814e5654d&ctype=2&skid=8ae4b08c5af41ca3015b037cd96c087b&contentid=8ae4b08b4c31a81c014c44b814e5656e&tcid=8ae4b08b4c31a81c014c44b814e5656f&cname=预防医学&tname=农炳金&teacherid=8ae4b08b165584940116564ee60f024d">未评价</a>
		   <!--  /<a href="stupg1.dq?courseid=8ae4b08b4c31a81c014c44b814e5654d&ctype=2&skid=8ae4b08c5af41ca3015b037cd96c087b&contentid=8ae4b08b4c31a81c014c44b814e5656e&tcid=8ae4b08b4c31a81c014c44b814e5656f&cname=预防医学&tname=农炳金&teacherid=8ae4b08b165584940116564ee60f024d">I am a student</a>
		    </span>-->
		    
		  
		
	</th>
	
	 <th align="center" scope="col" class="f12h15_black">
	 
		 <a href="#" onclick="delSkrw('8ae4b08c5af41ca3015b037cd96c087b','8ae4b08b4c31a81c014c44b814e5654d','2','8ae4b08b165584940116564ee60f024d')">删除评教任务（该教师未上过课）</a>
	 </th>
	
  </tr>

  <tr  bgcolor="#FFFFFF" style="color:FFFFFF">
    <th align="center" scope="col" class="f12h15_black">预防医学</th>
    <!-- <th align="left" scope="col" class="f12h15_black">1</th> -->
    <th align="center" scope="col" class="f12h15_black">
     	实验、见习课 
    </th>
    <th align="center" scope="col" class="f12h15_black">万逢洁
    </th>
    <th align="center" scope="col" class="f12h15_black">
    	
		    <span class="STYLE3">
		    <a href="stupg.do?courseid=8ae4b08b4c31a81c014c44b814e5654d&ctype=2&skid=8ae4b08c5af41ca3015b038361b40db1&contentid=8ae4b08b4c31a81c014c44b814e56562&tcid=8ae4b08b4c31a81c014c44b814e56563&cname=预防医学&tname=万逢洁&teacherid=8ae4b08b165584940116563fe34c0219">未评价</a>
		   <!--  /<a href="stupg1.dq?courseid=8ae4b08b4c31a81c014c44b814e5654d&ctype=2&skid=8ae4b08c5af41ca3015b038361b40db1&contentid=8ae4b08b4c31a81c014c44b814e56562&tcid=8ae4b08b4c31a81c014c44b814e56563&cname=预防医学&tname=万逢洁&teacherid=8ae4b08b165584940116563fe34c0219">I am a student</a>
		    </span>-->
		    
		  
		
	</th>
	
	 <th align="center" scope="col" class="f12h15_black">
	 
		 <a href="#" onclick="delSkrw('8ae4b08c5af41ca3015b038361b40db1','8ae4b08b4c31a81c014c44b814e5654d','2','8ae4b08b165584940116563fe34c0219')">删除评教任务（该教师未上过课）</a>
	 </th>
	
  </tr>

  <tr bgcolor="#F2F2F2" style="color:FFFFFF">
    <th align="center" scope="col" class="f12h15_black">预防医学</th>
    <!-- <th align="left" scope="col" class="f12h15_black">1</th> -->
    <th align="center" scope="col" class="f12h15_black">
     	实验、见习课 
    </th>
    <th align="center" scope="col" class="f12h15_black">王剑
    </th>
    <th align="center" scope="col" class="f12h15_black">
    	
		    <span class="STYLE3">
		    <a href="stupg.do?courseid=8ae4b08b4c31a81c014c44b814e5654d&ctype=2&skid=8ae4b08c5af41ca3015b0391945d140f&contentid=8ae4b08b4c31a81c014c44b814e56570&tcid=8ae4b08b4c31a81c014c44b814e56571&cname=预防医学&tname=王剑&teacherid=8ae4b08b1643759301164772db7f16ed">未评价</a>
		   <!--  /<a href="stupg1.dq?courseid=8ae4b08b4c31a81c014c44b814e5654d&ctype=2&skid=8ae4b08c5af41ca3015b0391945d140f&contentid=8ae4b08b4c31a81c014c44b814e56570&tcid=8ae4b08b4c31a81c014c44b814e56571&cname=预防医学&tname=王剑&teacherid=8ae4b08b1643759301164772db7f16ed">I am a student</a>
		    </span>-->
		    
		  
		
	</th>
	
	 <th align="center" scope="col" class="f12h15_black">
	 
		 <a href="#" onclick="delSkrw('8ae4b08c5af41ca3015b0391945d140f','8ae4b08b4c31a81c014c44b814e5654d','2','8ae4b08b1643759301164772db7f16ed')">删除评教任务（该教师未上过课）</a>
	 </th>
	
  </tr>

  <tr  bgcolor="#FFFFFF" style="color:FFFFFF">
    <th align="center" scope="col" class="f12h15_black">预防医学</th>
    <!-- <th align="left" scope="col" class="f12h15_black">1</th> -->
    <th align="center" scope="col" class="f12h15_black">
     	实验、见习课 
    </th>
    <th align="center" scope="col" class="f12h15_black">韦霄
    </th>
    <th align="center" scope="col" class="f12h15_black">
    	
		    <span class="STYLE3">
		    <a href="stupg.do?courseid=8ae4b08b4c31a81c014c44b814e5654d&ctype=2&skid=8ae4b08c5af41ca3015b039d518a1c1e&contentid=8ae4b08b4c31a81c014c44b814e5655e&tcid=8ae4b08b4c31a81c014c44b814e5655f&cname=预防医学&tname=韦霄&teacherid=8ae4b0e332a8f6e30132ae05ffef38a0">未评价</a>
		   <!--  /<a href="stupg1.dq?courseid=8ae4b08b4c31a81c014c44b814e5654d&ctype=2&skid=8ae4b08c5af41ca3015b039d518a1c1e&contentid=8ae4b08b4c31a81c014c44b814e5655e&tcid=8ae4b08b4c31a81c014c44b814e5655f&cname=预防医学&tname=韦霄&teacherid=8ae4b0e332a8f6e30132ae05ffef38a0">I am a student</a>
		    </span>-->
		    
		  
		
	</th>
	
	 <th align="center" scope="col" class="f12h15_black">
	 
		 <a href="#" onclick="delSkrw('8ae4b08c5af41ca3015b039d518a1c1e','8ae4b08b4c31a81c014c44b814e5654d','2','8ae4b0e332a8f6e30132ae05ffef38a0')">删除评教任务（该教师未上过课）</a>
	 </th>
	
  </tr>

  <tr bgcolor="#F2F2F2" style="color:FFFFFF">
    <th align="center" scope="col" class="f12h15_black">预防医学</th>
    <!-- <th align="left" scope="col" class="f12h15_black">1</th> -->
    <th align="center" scope="col" class="f12h15_black">
     	实验、见习课 
    </th>
    <th align="center" scope="col" class="f12h15_black">黄志碧
    </th>
    <th align="center" scope="col" class="f12h15_black">
    	
		    <span class="STYLE3">
		    <a href="stupg.do?courseid=8ae4b08b4c31a81c014c44b814e5654d&ctype=2&skid=8ae4b08c5af41ca3015b0479fd092ead&contentid=8ae4b08b4c31a81c014c44b814e56580&tcid=8ae4b08b4c31a81c014c44b814e56581&cname=预防医学&tname=黄志碧&teacherid=8ae4b08b199d5f150119b196f9550170">未评价</a>
		   <!--  /<a href="stupg1.dq?courseid=8ae4b08b4c31a81c014c44b814e5654d&ctype=2&skid=8ae4b08c5af41ca3015b0479fd092ead&contentid=8ae4b08b4c31a81c014c44b814e56580&tcid=8ae4b08b4c31a81c014c44b814e56581&cname=预防医学&tname=黄志碧&teacherid=8ae4b08b199d5f150119b196f9550170">I am a student</a>
		    </span>-->
		    
		  
		
	</th>
	
	 <th align="center" scope="col" class="f12h15_black">
	 
		 <a href="#" onclick="delSkrw('8ae4b08c5af41ca3015b0479fd092ead','8ae4b08b4c31a81c014c44b814e5654d','2','8ae4b08b199d5f150119b196f9550170')">删除评教任务（该教师未上过课）</a>
	 </th>
	
  </tr>

  <tr  bgcolor="#FFFFFF" style="color:FFFFFF">
    <th align="center" scope="col" class="f12h15_black">预防医学</th>
    <!-- <th align="left" scope="col" class="f12h15_black">1</th> -->
    <th align="center" scope="col" class="f12h15_black">
     	实验、见习课 
    </th>
    <th align="center" scope="col" class="f12h15_black">苏晶Sujing
    </th>
    <th align="center" scope="col" class="f12h15_black">
    	
		    <span class="STYLE3">
		    <a href="stupg.do?courseid=8ae4b08b4c31a81c014c44b814e5654d&ctype=2&skid=8ae4b08c5af41ca3015b047edfad3174&contentid=8ae4b08b4c31a81c014c44b814e56554&tcid=8ae4b08b4c31a81c014c44b814e56555&cname=预防医学&tname=苏晶Sujing&teacherid=8ae4b08b199d5f150119b19ac2450176">未评价</a>
		   <!--  /<a href="stupg1.dq?courseid=8ae4b08b4c31a81c014c44b814e5654d&ctype=2&skid=8ae4b08c5af41ca3015b047edfad3174&contentid=8ae4b08b4c31a81c014c44b814e56554&tcid=8ae4b08b4c31a81c014c44b814e56555&cname=预防医学&tname=苏晶Sujing&teacherid=8ae4b08b199d5f150119b19ac2450176">I am a student</a>
		    </span>-->
		    
		  
		
	</th>
	
	 <th align="center" scope="col" class="f12h15_black">
	 
		 <a href="#" onclick="delSkrw('8ae4b08c5af41ca3015b047edfad3174','8ae4b08b4c31a81c014c44b814e5654d','2','8ae4b08b199d5f150119b19ac2450176')">删除评教任务（该教师未上过课）</a>
	 </th>
	
  </tr>

  <tr bgcolor="#F2F2F2" style="color:FFFFFF">
    <th align="center" scope="col" class="f12h15_black">预防医学</th>
    <!-- <th align="left" scope="col" class="f12h15_black">1</th> -->
    <th align="center" scope="col" class="f12h15_black">
     	实验、见习课 
    </th>
    <th align="center" scope="col" class="f12h15_black">王晓敏
    </th>
    <th align="center" scope="col" class="f12h15_black">
    	
		    <span class="STYLE3">
		    <a href="stupg.do?courseid=8ae4b08b4c31a81c014c44b814e5654d&ctype=2&skid=8ae4b08c5af41ca3015b0483f933338a&contentid=8ae4b08b4c31a81c014c44b814e56576&tcid=8ae4b08b4c31a81c014c44b814e56577&cname=预防医学&tname=王晓敏&teacherid=8ae4b0e341fe37eb014208bc5f250d07">未评价</a>
		   <!--  /<a href="stupg1.dq?courseid=8ae4b08b4c31a81c014c44b814e5654d&ctype=2&skid=8ae4b08c5af41ca3015b0483f933338a&contentid=8ae4b08b4c31a81c014c44b814e56576&tcid=8ae4b08b4c31a81c014c44b814e56577&cname=预防医学&tname=王晓敏&teacherid=8ae4b0e341fe37eb014208bc5f250d07">I am a student</a>
		    </span>-->
		    
		  
		
	</th>
	
	 <th align="center" scope="col" class="f12h15_black">
	 
		 <a href="#" onclick="delSkrw('8ae4b08c5af41ca3015b0483f933338a','8ae4b08b4c31a81c014c44b814e5654d','2','8ae4b0e341fe37eb014208bc5f250d07')">删除评教任务（该教师未上过课）</a>
	 </th>
	
  </tr>

  <tr  bgcolor="#FFFFFF" style="color:FFFFFF">
    <th align="center" scope="col" class="f12h15_black">预防医学</th>
    <!-- <th align="left" scope="col" class="f12h15_black"></th> -->
    <th align="center" scope="col" class="f12h15_black">
     	实验、见习课 
    </th>
    <th align="center" scope="col" class="f12h15_black">黄美梦
    </th>
    <th align="center" scope="col" class="f12h15_black">
    	
		    <span class="STYLE3">
		    <a href="stupg.do?courseid=8ae4b08b4c31a81c014c44b814e5654d&ctype=2&skid=8ae4b08c5af41ca3015b048908d5361f&contentid=8ae4b08c57f6bb830157f9bcb5183778&tcid=8ae4b08c57f6bb830157f9bcb5183779&cname=预防医学&tname=黄美梦&teacherid=8ae4b08c57b831130157d6c7b5672490">未评价</a>
		   <!--  /<a href="stupg1.dq?courseid=8ae4b08b4c31a81c014c44b814e5654d&ctype=2&skid=8ae4b08c5af41ca3015b048908d5361f&contentid=8ae4b08c57f6bb830157f9bcb5183778&tcid=8ae4b08c57f6bb830157f9bcb5183779&cname=预防医学&tname=黄美梦&teacherid=8ae4b08c57b831130157d6c7b5672490">I am a student</a>
		    </span>-->
		    
		  
		
	</th>
	
	 <th align="center" scope="col" class="f12h15_black">
	 
		 <a href="#" onclick="delSkrw('8ae4b08c5af41ca3015b048908d5361f','8ae4b08b4c31a81c014c44b814e5654d','2','8ae4b08c57b831130157d6c7b5672490')">删除评教任务（该教师未上过课）</a>
	 </th>
	
  </tr>

  <tr bgcolor="#F2F2F2" style="color:FFFFFF">
    <th align="center" scope="col" class="f12h15_black">医学微生物学</th>
    <!-- <th align="left" scope="col" class="f12h15_black">病毒学各论2</th> -->
    <th align="center" scope="col" class="f12h15_black">
     	理论课
    </th>
    <th align="center" scope="col" class="f12h15_black">宋德志SongDezhi
    </th>
    <th align="center" scope="col" class="f12h15_black">
    	
		    <span class="STYLE3">
		    <a href="stupg.do?courseid=8ae4b08b4c500d09014c540a11c83509&ctype=1&skid=8ae4b08c5b36dc64015b414658a30ef1&contentid=8ae4b08b4c6859e9014c6a2b3f906541&tcid=8ae4b08b4c6859e9014c6a2b3f906542&cname=医学微生物学&tname=宋德志SongDezhi&teacherid=8ae4b08b1fd6e7d3011fef5fd3d10053">未评价</a>
		   <!--  /<a href="stupg1.dq?courseid=8ae4b08b4c500d09014c540a11c83509&ctype=1&skid=8ae4b08c5b36dc64015b414658a30ef1&contentid=8ae4b08b4c6859e9014c6a2b3f906541&tcid=8ae4b08b4c6859e9014c6a2b3f906542&cname=医学微生物学&tname=宋德志SongDezhi&teacherid=8ae4b08b1fd6e7d3011fef5fd3d10053">I am a student</a>
		    </span>-->
		    
		  
		
	</th>
	
	 <th align="center" scope="col" class="f12h15_black">
	 
		 <a href="#" onclick="delSkrw('8ae4b08c5b36dc64015b414658a30ef1','8ae4b08b4c500d09014c540a11c83509','1','8ae4b08b1fd6e7d3011fef5fd3d10053')">删除评教任务（该教师未上过课）</a>
	 </th>
	
  </tr>

  <tr  bgcolor="#FFFFFF" style="color:FFFFFF">
    <th align="center" scope="col" class="f12h15_black">医学微生物学</th>
    <!-- <th align="left" scope="col" class="f12h15_black">0</th> -->
    <th align="center" scope="col" class="f12h15_black">
     	理论课
    </th>
    <th align="center" scope="col" class="f12h15_black">梁莹LiangYing
    </th>
    <th align="center" scope="col" class="f12h15_black">
    	
		    <span class="STYLE3">
		    <a href="stupg.do?courseid=8ae4b08b4c500d09014c540a11c83509&ctype=1&skid=8ae4b08c5b36dc64015b414664831277&contentid=8ae4b08b4c6859e9014c6a2b3f906543&tcid=8ae4b08b4c6859e9014c6a2b3f906544&cname=医学微生物学&tname=梁莹LiangYing&teacherid=8ae4b08b1664ebb60116669f953d062b">未评价</a>
		   <!--  /<a href="stupg1.dq?courseid=8ae4b08b4c500d09014c540a11c83509&ctype=1&skid=8ae4b08c5b36dc64015b414664831277&contentid=8ae4b08b4c6859e9014c6a2b3f906543&tcid=8ae4b08b4c6859e9014c6a2b3f906544&cname=医学微生物学&tname=梁莹LiangYing&teacherid=8ae4b08b1664ebb60116669f953d062b">I am a student</a>
		    </span>-->
		    
		  
		
	</th>
	
	 <th align="center" scope="col" class="f12h15_black">
	 
		 <a href="#" onclick="delSkrw('8ae4b08c5b36dc64015b414664831277','8ae4b08b4c500d09014c540a11c83509','1','8ae4b08b1664ebb60116669f953d062b')">删除评教任务（该教师未上过课）</a>
	 </th>
	
  </tr>

  <tr bgcolor="#F2F2F2" style="color:FFFFFF">
    <th align="center" scope="col" class="f12h15_black">医学微生物学</th>
    <!-- <th align="left" scope="col" class="f12h15_black">病毒学总论2</th> -->
    <th align="center" scope="col" class="f12h15_black">
     	理论课
    </th>
    <th align="center" scope="col" class="f12h15_black">张增峰ZhangZengfeng
    </th>
    <th align="center" scope="col" class="f12h15_black">
    	
		    <span class="STYLE3">
		    <a href="stupg.do?courseid=8ae4b08b4c500d09014c540a11c83509&ctype=1&skid=8ae4b08c5b36dc64015b41467bac1983&contentid=8ae4b08b4c6859e9014c6a2b3f906547&tcid=8ae4b08b4c6859e9014c6a2b3f906548&cname=医学微生物学&tname=张增峰ZhangZengfeng&teacherid=8ae4b08b1d2c7bdd011d417be6a77ad5">未评价</a>
		   <!--  /<a href="stupg1.dq?courseid=8ae4b08b4c500d09014c540a11c83509&ctype=1&skid=8ae4b08c5b36dc64015b41467bac1983&contentid=8ae4b08b4c6859e9014c6a2b3f906547&tcid=8ae4b08b4c6859e9014c6a2b3f906548&cname=医学微生物学&tname=张增峰ZhangZengfeng&teacherid=8ae4b08b1d2c7bdd011d417be6a77ad5">I am a student</a>
		    </span>-->
		    
		  
		
	</th>
	
	 <th align="center" scope="col" class="f12h15_black">
	 
		 <a href="#" onclick="delSkrw('8ae4b08c5b36dc64015b41467bac1983','8ae4b08b4c500d09014c540a11c83509','1','8ae4b08b1d2c7bdd011d417be6a77ad5')">删除评教任务（该教师未上过课）</a>
	 </th>
	
  </tr>

  <tr  bgcolor="#FFFFFF" style="color:FFFFFF">
    <th align="center" scope="col" class="f12h15_black">医学微生物学</th>
    <!-- <th align="left" scope="col" class="f12h15_black">2013级临床、病检、医检、生技、双语</th> -->
    <th align="center" scope="col" class="f12h15_black">
     	实验、见习课 
    </th>
    <th align="center" scope="col" class="f12h15_black">杨海波YangHaibo
    </th>
    <th align="center" scope="col" class="f12h15_black">
    	
		    <span class="STYLE3">
		    <a href="stupg.do?courseid=8ae4b08b4c6859e9014c6a1763f76510&ctype=2&skid=8ae4b08c5b36dc64015b4164bce435fe&contentid=8ae4b08b4c6859e9014c6a2ec8ea6559&tcid=8ae4b08b4c6859e9014c6a2ec8ea655a&cname=医学微生物学&tname=杨海波YangHaibo&teacherid=8ae4b08b1664ebb60116669cef330612">未评价</a>
		   <!--  /<a href="stupg1.dq?courseid=8ae4b08b4c6859e9014c6a1763f76510&ctype=2&skid=8ae4b08c5b36dc64015b4164bce435fe&contentid=8ae4b08b4c6859e9014c6a2ec8ea6559&tcid=8ae4b08b4c6859e9014c6a2ec8ea655a&cname=医学微生物学&tname=杨海波YangHaibo&teacherid=8ae4b08b1664ebb60116669cef330612">I am a student</a>
		    </span>-->
		    
		  
		
	</th>
	
	 <th align="center" scope="col" class="f12h15_black">
	 
		 <a href="#" onclick="delSkrw('8ae4b08c5b36dc64015b4164bce435fe','8ae4b08b4c6859e9014c6a1763f76510','2','8ae4b08b1664ebb60116669cef330612')">删除评教任务（该教师未上过课）</a>
	 </th>
	
  </tr>

  <tr bgcolor="#F2F2F2" style="color:FFFFFF">
    <th align="center" scope="col" class="f12h15_black">医学微生物学</th>
    <!-- <th align="left" scope="col" class="f12h15_black">2013级临床、病检、医检、生技、双语</th> -->
    <th align="center" scope="col" class="f12h15_black">
     	实验、见习课 
    </th>
    <th align="center" scope="col" class="f12h15_black">张增峰ZhangZengfeng
    </th>
    <th align="center" scope="col" class="f12h15_black">
    	
		    <span class="STYLE3">
		    <a href="stupg.do?courseid=8ae4b08b4c6859e9014c6a1763f76510&ctype=2&skid=8ae4b08c5b36dc64015b4164e5534799&contentid=8ae4b08b4c6859e9014c6a2ec8ea6563&tcid=8ae4b08b4c6859e9014c6a2ec8ea6564&cname=医学微生物学&tname=张增峰ZhangZengfeng&teacherid=8ae4b08b1d2c7bdd011d417be6a77ad5">未评价</a>
		   <!--  /<a href="stupg1.dq?courseid=8ae4b08b4c6859e9014c6a1763f76510&ctype=2&skid=8ae4b08c5b36dc64015b4164e5534799&contentid=8ae4b08b4c6859e9014c6a2ec8ea6563&tcid=8ae4b08b4c6859e9014c6a2ec8ea6564&cname=医学微生物学&tname=张增峰ZhangZengfeng&teacherid=8ae4b08b1d2c7bdd011d417be6a77ad5">I am a student</a>
		    </span>-->
		    
		  
		
	</th>
	
	 <th align="center" scope="col" class="f12h15_black">
	 
		 <a href="#" onclick="delSkrw('8ae4b08c5b36dc64015b4164e5534799','8ae4b08b4c6859e9014c6a1763f76510','2','8ae4b08b1d2c7bdd011d417be6a77ad5')">删除评教任务（该教师未上过课）</a>
	 </th>
	
  </tr>

  <tr  bgcolor="#FFFFFF" style="color:FFFFFF">
    <th align="center" scope="col" class="f12h15_black">英语(4)综合医学英语</th>
    <!-- <th align="left" scope="col" class="f12h15_black"></th> -->
    <th align="center" scope="col" class="f12h15_black">
     	理论课
    </th>
    <th align="center" scope="col" class="f12h15_black">罗燕
    </th>
    <th align="center" scope="col" class="f12h15_black">
    	
		    <span class="STYLE3">
		    <a href="stupg.do?courseid=8ae4b08c5b36dc64015b4162742635ea&ctype=1&skid=8ae4b08c5b36dc64015b47a1aa134483&contentid=8ae4b08c5b36dc64015b41657d664ea6&tcid=8ae4b08c5b36dc64015b41657d664ea7&cname=英语(4)综合医学英语&tname=罗燕&teacherid=8ae4b08b1655849401165be7156118f3">未评价</a>
		   <!--  /<a href="stupg1.dq?courseid=8ae4b08c5b36dc64015b4162742635ea&ctype=1&skid=8ae4b08c5b36dc64015b47a1aa134483&contentid=8ae4b08c5b36dc64015b41657d664ea6&tcid=8ae4b08c5b36dc64015b41657d664ea7&cname=英语(4)综合医学英语&tname=罗燕&teacherid=8ae4b08b1655849401165be7156118f3">I am a student</a>
		    </span>-->
		    
		  
		
	</th>
	
	 <th align="center" scope="col" class="f12h15_black">
	 
		 <a href="#" onclick="delSkrw('8ae4b08c5b36dc64015b47a1aa134483','8ae4b08c5b36dc64015b4162742635ea','1','8ae4b08b1655849401165be7156118f3')">删除评教任务（该教师未上过课）</a>
	 </th>
	
  </tr>

  <tr bgcolor="#F2F2F2" style="color:FFFFFF">
    <th align="center" scope="col" class="f12h15_black">病理学</th>
    <!-- <th align="left" scope="col" class="f12h15_black">病理学</th> -->
    <th align="center" scope="col" class="f12h15_black">
     	理论课
    </th>
    <th align="center" scope="col" class="f12h15_black">韦康来WeiKanglai
    </th>
    <th align="center" scope="col" class="f12h15_black">
    	
		    <span class="STYLE3">
		    <a href="stupg.do?courseid=8ae4b08b4c918ad5014cb1af399770d1&ctype=1&skid=8ae4b08c5b52bf34015b57952adc7aad&contentid=8ae4b08b51c327b40151d6d736e97ed2&tcid=8ae4b08b51c327b40151d6d736e97ed3&cname=病理学&tname=韦康来WeiKanglai&teacherid=8ae4b08b1655849401165b01f1c6172a">未评价</a>
		   <!--  /<a href="stupg1.dq?courseid=8ae4b08b4c918ad5014cb1af399770d1&ctype=1&skid=8ae4b08c5b52bf34015b57952adc7aad&contentid=8ae4b08b51c327b40151d6d736e97ed2&tcid=8ae4b08b51c327b40151d6d736e97ed3&cname=病理学&tname=韦康来WeiKanglai&teacherid=8ae4b08b1655849401165b01f1c6172a">I am a student</a>
		    </span>-->
		    
		  
		
	</th>
	
	 <th align="center" scope="col" class="f12h15_black">
	 
		 <a href="#" onclick="delSkrw('8ae4b08c5b52bf34015b57952adc7aad','8ae4b08b4c918ad5014cb1af399770d1','1','8ae4b08b1655849401165b01f1c6172a')">删除评教任务（该教师未上过课）</a>
	 </th>
	
  </tr>

  <tr  bgcolor="#FFFFFF" style="color:FFFFFF">
    <th align="center" scope="col" class="f12h15_black">病理学</th>
    <!-- <th align="left" scope="col" class="f12h15_black">病理学</th> -->
    <th align="center" scope="col" class="f12h15_black">
     	理论课
    </th>
    <th align="center" scope="col" class="f12h15_black">李祖云LiZuyun
    </th>
    <th align="center" scope="col" class="f12h15_black">
    	
		    <span class="STYLE3">
		    <a href="stupg.do?courseid=8ae4b08b4c918ad5014cb1af399770d1&ctype=1&skid=8ae4b08c5b52bf34015b579530877da1&contentid=8ae4b08b51c327b40151d6f1898e02ef&tcid=8ae4b08b51c327b40151d6f1898e02f0&cname=病理学&tname=李祖云LiZuyun&teacherid=8ae4b08b1655849401165afcb7841712">未评价</a>
		   <!--  /<a href="stupg1.dq?courseid=8ae4b08b4c918ad5014cb1af399770d1&ctype=1&skid=8ae4b08c5b52bf34015b579530877da1&contentid=8ae4b08b51c327b40151d6f1898e02ef&tcid=8ae4b08b51c327b40151d6f1898e02f0&cname=病理学&tname=李祖云LiZuyun&teacherid=8ae4b08b1655849401165afcb7841712">I am a student</a>
		    </span>-->
		    
		  
		
	</th>
	
	 <th align="center" scope="col" class="f12h15_black">
	 
		 <a href="#" onclick="delSkrw('8ae4b08c5b52bf34015b579530877da1','8ae4b08b4c918ad5014cb1af399770d1','1','8ae4b08b1655849401165afcb7841712')">删除评教任务（该教师未上过课）</a>
	 </th>
	
  </tr>

  <tr bgcolor="#F2F2F2" style="color:FFFFFF">
    <th align="center" scope="col" class="f12h15_black">病理学</th>
    <!-- <th align="left" scope="col" class="f12h15_black">病理学</th> -->
    <th align="center" scope="col" class="f12h15_black">
     	理论课
    </th>
    <th align="center" scope="col" class="f12h15_black">冯振博FengZhenbo
    </th>
    <th align="center" scope="col" class="f12h15_black">
    	
		    <span class="STYLE3">
		    <a href="stupg.do?courseid=8ae4b08b4c918ad5014cb1af399770d1&ctype=1&skid=8ae4b08c5b52bf34015b579536f50094&contentid=8ae4b08b51c327b40151d6f1898e02f1&tcid=8ae4b08b51c327b40151d6f1898e02f2&cname=病理学&tname=冯振博FengZhenbo&teacherid=8ae4b08b1655849401165af9c54e170c">未评价</a>
		   <!--  /<a href="stupg1.dq?courseid=8ae4b08b4c918ad5014cb1af399770d1&ctype=1&skid=8ae4b08c5b52bf34015b579536f50094&contentid=8ae4b08b51c327b40151d6f1898e02f1&tcid=8ae4b08b51c327b40151d6f1898e02f2&cname=病理学&tname=冯振博FengZhenbo&teacherid=8ae4b08b1655849401165af9c54e170c">I am a student</a>
		    </span>-->
		    
		  
		
	</th>
	
	 <th align="center" scope="col" class="f12h15_black">
	 
		 <a href="#" onclick="delSkrw('8ae4b08c5b52bf34015b579536f50094','8ae4b08b4c918ad5014cb1af399770d1','1','8ae4b08b1655849401165af9c54e170c')">删除评教任务（该教师未上过课）</a>
	 </th>
	
  </tr>

  <tr  bgcolor="#FFFFFF" style="color:FFFFFF">
    <th align="center" scope="col" class="f12h15_black">病理学</th>
    <!-- <th align="left" scope="col" class="f12h15_black">病理学</th> -->
    <th align="center" scope="col" class="f12h15_black">
     	理论课
    </th>
    <th align="center" scope="col" class="f12h15_black">陈罡ChenGang
    </th>
    <th align="center" scope="col" class="f12h15_black">
    	
		    <span class="STYLE3">
		    <a href="stupg.do?courseid=8ae4b08b4c918ad5014cb1af399770d1&ctype=1&skid=8ae4b08c5b52bf34015b57951e6c74c6&contentid=8ae4b08b51c327b40151d6d736e97ece&tcid=8ae4b08b51c327b40151d6d736e97ecf&cname=病理学&tname=陈罡ChenGang&teacherid=8ae4b0e33dfa89af013e16fcf80d0002">未评价</a>
		   <!--  /<a href="stupg1.dq?courseid=8ae4b08b4c918ad5014cb1af399770d1&ctype=1&skid=8ae4b08c5b52bf34015b57951e6c74c6&contentid=8ae4b08b51c327b40151d6d736e97ece&tcid=8ae4b08b51c327b40151d6d736e97ecf&cname=病理学&tname=陈罡ChenGang&teacherid=8ae4b0e33dfa89af013e16fcf80d0002">I am a student</a>
		    </span>-->
		    
		  
		
	</th>
	
	 <th align="center" scope="col" class="f12h15_black">
	 
		 <a href="#" onclick="delSkrw('8ae4b08c5b52bf34015b57951e6c74c6','8ae4b08b4c918ad5014cb1af399770d1','1','8ae4b0e33dfa89af013e16fcf80d0002')">删除评教任务（该教师未上过课）</a>
	 </th>
	
  </tr>

  <tr bgcolor="#F2F2F2" style="color:FFFFFF">
    <th align="center" scope="col" class="f12h15_black">病理学</th>
    <!-- <th align="left" scope="col" class="f12h15_black">病理学</th> -->
    <th align="center" scope="col" class="f12h15_black">
     	理论课
    </th>
    <th align="center" scope="col" class="f12h15_black">李萍LiPing
    </th>
    <th align="center" scope="col" class="f12h15_black">
    	
		    <span class="STYLE3">
		    <a href="stupg.do?courseid=8ae4b08b4c918ad5014cb1af399770d1&ctype=1&skid=8ae4b08c5b52bf34015b579524e177b9&contentid=8ae4b08b51c327b40151d6d736e97ed0&tcid=8ae4b08b51c327b40151d6d736e97ed1&cname=病理学&tname=李萍LiPing&teacherid=8ae4b08b1655849401165afe9f9d1720">未评价</a>
		   <!--  /<a href="stupg1.dq?courseid=8ae4b08b4c918ad5014cb1af399770d1&ctype=1&skid=8ae4b08c5b52bf34015b579524e177b9&contentid=8ae4b08b51c327b40151d6d736e97ed0&tcid=8ae4b08b51c327b40151d6d736e97ed1&cname=病理学&tname=李萍LiPing&teacherid=8ae4b08b1655849401165afe9f9d1720">I am a student</a>
		    </span>-->
		    
		  
		
	</th>
	
	 <th align="center" scope="col" class="f12h15_black">
	 
		 <a href="#" onclick="delSkrw('8ae4b08c5b52bf34015b579524e177b9','8ae4b08b4c918ad5014cb1af399770d1','1','8ae4b08b1655849401165afe9f9d1720')">删除评教任务（该教师未上过课）</a>
	 </th>
	
  </tr>

  <tr  bgcolor="#FFFFFF" style="color:FFFFFF">
    <th align="center" scope="col" class="f12h15_black">病理学</th>
    <!-- <th align="left" scope="col" class="f12h15_black">病理学</th> -->
    <th align="center" scope="col" class="f12h15_black">
     	理论课
    </th>
    <th align="center" scope="col" class="f12h15_black">曾晶晶ZengJingjing
    </th>
    <th align="center" scope="col" class="f12h15_black">
    	
		    <span class="STYLE3">
		    <a href="stupg.do?courseid=8ae4b08b4c918ad5014cb1af399770d1&ctype=1&skid=8ae4b08c5b52bf34015b57953dfc0387&contentid=8ae4b08b51c327b40151d6f346ee02fa&tcid=8ae4b08b51c327b40151d6f346ee02fb&cname=病理学&tname=曾晶晶ZengJingjing&teacherid=8ae4b08b1c977ee4011c9790d2210009">未评价</a>
		   <!--  /<a href="stupg1.dq?courseid=8ae4b08b4c918ad5014cb1af399770d1&ctype=1&skid=8ae4b08c5b52bf34015b57953dfc0387&contentid=8ae4b08b51c327b40151d6f346ee02fa&tcid=8ae4b08b51c327b40151d6f346ee02fb&cname=病理学&tname=曾晶晶ZengJingjing&teacherid=8ae4b08b1c977ee4011c9790d2210009">I am a student</a>
		    </span>-->
		    
		  
		
	</th>
	
	 <th align="center" scope="col" class="f12h15_black">
	 
		 <a href="#" onclick="delSkrw('8ae4b08c5b52bf34015b57953dfc0387','8ae4b08b4c918ad5014cb1af399770d1','1','8ae4b08b1c977ee4011c9790d2210009')">删除评教任务（该教师未上过课）</a>
	 </th>
	
  </tr>

  <tr bgcolor="#F2F2F2" style="color:FFFFFF">
    <th align="center" scope="col" class="f12h15_black">病理学</th>
    <!-- <th align="left" scope="col" class="f12h15_black">病理学</th> -->
    <th align="center" scope="col" class="f12h15_black">
     	理论课
    </th>
    <th align="center" scope="col" class="f12h15_black">蒋一强JiangYiqiang
    </th>
    <th align="center" scope="col" class="f12h15_black">
    	
		    <span class="STYLE3">
		    <a href="stupg.do?courseid=8ae4b08b4c918ad5014cb1af399770d1&ctype=1&skid=8ae4b08c5b52bf34015b57be80c72a6e&contentid=8ae4b08b51c327b40151d6f346ee02fc&tcid=8ae4b08b51c327b40151d6f346ee02fd&cname=病理学&tname=蒋一强JiangYiqiang&teacherid=8ae4b08b1655849401165b0ee6ca1738">未评价</a>
		   <!--  /<a href="stupg1.dq?courseid=8ae4b08b4c918ad5014cb1af399770d1&ctype=1&skid=8ae4b08c5b52bf34015b57be80c72a6e&contentid=8ae4b08b51c327b40151d6f346ee02fc&tcid=8ae4b08b51c327b40151d6f346ee02fd&cname=病理学&tname=蒋一强JiangYiqiang&teacherid=8ae4b08b1655849401165b0ee6ca1738">I am a student</a>
		    </span>-->
		    
		  
		
	</th>
	
	 <th align="center" scope="col" class="f12h15_black">
	 
		 <a href="#" onclick="delSkrw('8ae4b08c5b52bf34015b57be80c72a6e','8ae4b08b4c918ad5014cb1af399770d1','1','8ae4b08b1655849401165b0ee6ca1738')">删除评教任务（该教师未上过课）</a>
	 </th>
	
  </tr>

  <tr  bgcolor="#FFFFFF" style="color:FFFFFF">
    <th align="center" scope="col" class="f12h15_black">病理学</th>
    <!-- <th align="left" scope="col" class="f12h15_black">病理学</th> -->
    <th align="center" scope="col" class="f12h15_black">
     	理论课
    </th>
    <th align="center" scope="col" class="f12h15_black">顾永耀GuYongyao
    </th>
    <th align="center" scope="col" class="f12h15_black">
    	
		    <span class="STYLE3">
		    <a href="stupg.do?courseid=8ae4b08b4c918ad5014cb1af399770d1&ctype=1&skid=8ae4b08c5b52bf34015b57be711f2195&contentid=8ae4b08b4c918ad5014cb1af399770d2&tcid=8ae4b08b4c918ad5014cb1af399770d3&cname=病理学&tname=顾永耀GuYongyao&teacherid=8ae4b08b1655849401165aff22d71722">未评价</a>
		   <!--  /<a href="stupg1.dq?courseid=8ae4b08b4c918ad5014cb1af399770d1&ctype=1&skid=8ae4b08c5b52bf34015b57be711f2195&contentid=8ae4b08b4c918ad5014cb1af399770d2&tcid=8ae4b08b4c918ad5014cb1af399770d3&cname=病理学&tname=顾永耀GuYongyao&teacherid=8ae4b08b1655849401165aff22d71722">I am a student</a>
		    </span>-->
		    
		  
		
	</th>
	
	 <th align="center" scope="col" class="f12h15_black">
	 
		 <a href="#" onclick="delSkrw('8ae4b08c5b52bf34015b57be711f2195','8ae4b08b4c918ad5014cb1af399770d1','1','8ae4b08b1655849401165aff22d71722')">删除评教任务（该教师未上过课）</a>
	 </th>
	
  </tr>

  <tr bgcolor="#F2F2F2" style="color:FFFFFF">
    <th align="center" scope="col" class="f12h15_black">病理学</th>
    <!-- <th align="left" scope="col" class="f12h15_black">病理学</th> -->
    <th align="center" scope="col" class="f12h15_black">
     	理论课
    </th>
    <th align="center" scope="col" class="f12h15_black">罗殿中LuoDianzhong
    </th>
    <th align="center" scope="col" class="f12h15_black">
    	
		    <span class="STYLE3">
		    <a href="stupg.do?courseid=8ae4b08b4c918ad5014cb1af399770d1&ctype=1&skid=8ae4b08c5b52bf34015b57be764c2488&contentid=8ae4b08b51c327b40151d6ce39077e93&tcid=8ae4b08b51c327b40151d6ce39077e94&cname=病理学&tname=罗殿中LuoDianzhong&teacherid=8ae4b08b1655849401165af8c67c170a">未评价</a>
		   <!--  /<a href="stupg1.dq?courseid=8ae4b08b4c918ad5014cb1af399770d1&ctype=1&skid=8ae4b08c5b52bf34015b57be764c2488&contentid=8ae4b08b51c327b40151d6ce39077e93&tcid=8ae4b08b51c327b40151d6ce39077e94&cname=病理学&tname=罗殿中LuoDianzhong&teacherid=8ae4b08b1655849401165af8c67c170a">I am a student</a>
		    </span>-->
		    
		  
		
	</th>
	
	 <th align="center" scope="col" class="f12h15_black">
	 
		 <a href="#" onclick="delSkrw('8ae4b08c5b52bf34015b57be764c2488','8ae4b08b4c918ad5014cb1af399770d1','1','8ae4b08b1655849401165af8c67c170a')">删除评教任务（该教师未上过课）</a>
	 </th>
	
  </tr>

  <tr  bgcolor="#FFFFFF" style="color:FFFFFF">
    <th align="center" scope="col" class="f12h15_black">病理学</th>
    <!-- <th align="left" scope="col" class="f12h15_black">病理学</th> -->
    <th align="center" scope="col" class="f12h15_black">
     	理论课
    </th>
    <th align="center" scope="col" class="f12h15_black">吕自力LvZili
    </th>
    <th align="center" scope="col" class="f12h15_black">
    	
		    <span class="STYLE3">
		    <a href="stupg.do?courseid=8ae4b08b4c918ad5014cb1af399770d1&ctype=1&skid=8ae4b08c5b52bf34015b5795188171d3&contentid=8ae4b08b51c327b40151d6d398847eb5&tcid=8ae4b08b51c327b40151d6d398847eb6&cname=病理学&tname=吕自力LvZili&teacherid=8ae4b08b1655849401165afdf842171e">未评价</a>
		   <!--  /<a href="stupg1.dq?courseid=8ae4b08b4c918ad5014cb1af399770d1&ctype=1&skid=8ae4b08c5b52bf34015b5795188171d3&contentid=8ae4b08b51c327b40151d6d398847eb5&tcid=8ae4b08b51c327b40151d6d398847eb6&cname=病理学&tname=吕自力LvZili&teacherid=8ae4b08b1655849401165afdf842171e">I am a student</a>
		    </span>-->
		    
		  
		
	</th>
	
	 <th align="center" scope="col" class="f12h15_black">
	 
		 <a href="#" onclick="delSkrw('8ae4b08c5b52bf34015b5795188171d3','8ae4b08b4c918ad5014cb1af399770d1','1','8ae4b08b1655849401165afdf842171e')">删除评教任务（该教师未上过课）</a>
	 </th>
	
  </tr>

  <tr bgcolor="#F2F2F2" style="color:FFFFFF">
    <th align="center" scope="col" class="f12h15_black">病理学</th>
    <!-- <th align="left" scope="col" class="f12h15_black"></th> -->
    <th align="center" scope="col" class="f12h15_black">
     	实验、见习课 
    </th>
    <th align="center" scope="col" class="f12h15_black">罗殿中LuoDianzhong
    </th>
    <th align="center" scope="col" class="f12h15_black">
    	
		    <span class="STYLE3">
		    <a href="stupg.do?courseid=8ae4b08b4c918ad5014cb1ae188170c1&ctype=2&skid=8ae4b08c5b52bf34015b57e2538c44da&contentid=8ae4b08c5b52bf34015b57dcf1a843c4&tcid=8ae4b08c5b52bf34015b57dcf1a843c5&cname=病理学&tname=罗殿中LuoDianzhong&teacherid=8ae4b08b1655849401165af8c67c170a">未评价</a>
		   <!--  /<a href="stupg1.dq?courseid=8ae4b08b4c918ad5014cb1ae188170c1&ctype=2&skid=8ae4b08c5b52bf34015b57e2538c44da&contentid=8ae4b08c5b52bf34015b57dcf1a843c4&tcid=8ae4b08c5b52bf34015b57dcf1a843c5&cname=病理学&tname=罗殿中LuoDianzhong&teacherid=8ae4b08b1655849401165af8c67c170a">I am a student</a>
		    </span>-->
		    
		  
		
	</th>
	
	 <th align="center" scope="col" class="f12h15_black">
	 
		 <a href="#" onclick="delSkrw('8ae4b08c5b52bf34015b57e2538c44da','8ae4b08b4c918ad5014cb1ae188170c1','2','8ae4b08b1655849401165af8c67c170a')">删除评教任务（该教师未上过课）</a>
	 </th>
	
  </tr>

  <tr  bgcolor="#FFFFFF" style="color:FFFFFF">
    <th align="center" scope="col" class="f12h15_black">体育(4)</th>
    <!-- <th align="left" scope="col" class="f12h15_black">体育4</th> -->
    <th align="center" scope="col" class="f12h15_black">
     	理论课
    </th>
    <th align="center" scope="col" class="f12h15_black">吴静WuJing
    </th>
    <th align="center" scope="col" class="f12h15_black">
    	
		    <span class="STYLE3">
		    <a href="stupg.do?courseid=8ae4b08b533b0d9d01535455029e0ddc&ctype=1&skid=8ae4b08c5b52bf34015b602389ae5290&contentid=8ae4b08b533b0d9d01535455029e0dfb&tcid=8ae4b08b533b0d9d01535455029e0dfc&cname=体育(4)&tname=吴静WuJing&teacherid=8ae4b0e32bd841e0012c160b2aee0894">未评价</a>
		   <!--  /<a href="stupg1.dq?courseid=8ae4b08b533b0d9d01535455029e0ddc&ctype=1&skid=8ae4b08c5b52bf34015b602389ae5290&contentid=8ae4b08b533b0d9d01535455029e0dfb&tcid=8ae4b08b533b0d9d01535455029e0dfc&cname=体育(4)&tname=吴静WuJing&teacherid=8ae4b0e32bd841e0012c160b2aee0894">I am a student</a>
		    </span>-->
		    
		  
		
	</th>
	
	 <th align="center" scope="col" class="f12h15_black">
	 
		 <a href="#" onclick="delSkrw('8ae4b08c5b52bf34015b602389ae5290','8ae4b08b533b0d9d01535455029e0ddc','1','8ae4b0e32bd841e0012c160b2aee0894')">删除评教任务（该教师未上过课）</a>
	 </th>
	
  </tr>

  <tr bgcolor="#F2F2F2" style="color:FFFFFF">
    <th align="center" scope="col" class="f12h15_black">实验生理科学(1)</th>
    <!-- <th align="left" scope="col" class="f12h15_black">实验生理科学</th> -->
    <th align="center" scope="col" class="f12h15_black">
     	实验、见习课 
    </th>
    <th align="center" scope="col" class="f12h15_black">梁纲Lianggang
    </th>
    <th align="center" scope="col" class="f12h15_black">
    	
		    <span class="STYLE3">
		    <a href="stupg.do?courseid=8ae4b08b4c59fcc9014c5b5d75164090&ctype=2&skid=8ae4b08c5b52bf34015b652f27054d8d&contentid=8ae4b08b4c59fcc9014c5b5d75164093&tcid=8ae4b08b4c59fcc9014c5b5d75164094&cname=实验生理科学(1)&tname=梁纲Lianggang&teacherid=8ae4b08b1637f3c1011642266c4e08d1">未评价</a>
		   <!--  /<a href="stupg1.dq?courseid=8ae4b08b4c59fcc9014c5b5d75164090&ctype=2&skid=8ae4b08c5b52bf34015b652f27054d8d&contentid=8ae4b08b4c59fcc9014c5b5d75164093&tcid=8ae4b08b4c59fcc9014c5b5d75164094&cname=实验生理科学(1)&tname=梁纲Lianggang&teacherid=8ae4b08b1637f3c1011642266c4e08d1">I am a student</a>
		    </span>-->
		    
		  
		
	</th>
	
	 <th align="center" scope="col" class="f12h15_black">
	 
		 <a href="#" onclick="delSkrw('8ae4b08c5b52bf34015b652f27054d8d','8ae4b08b4c59fcc9014c5b5d75164090','2','8ae4b08b1637f3c1011642266c4e08d1')">删除评教任务（该教师未上过课）</a>
	 </th>
	
  </tr>

  <tr  bgcolor="#FFFFFF" style="color:FFFFFF">
    <th align="center" scope="col" class="f12h15_black">医学免疫学</th>
    <!-- <th align="left" scope="col" class="f12h15_black">免疫学</th> -->
    <th align="center" scope="col" class="f12h15_black">
     	理论课
    </th>
    <th align="center" scope="col" class="f12h15_black">甘瑞静GangRuijing
    </th>
    <th align="center" scope="col" class="f12h15_black">
    	
		    <span class="STYLE3">
		    <a href="stupg.do?courseid=8ae4b08b4c31a81c014c368ebc4220aa&ctype=1&skid=8ae4b08c5b52bf34015b66766df47015&contentid=8ae4b08b4c31a81c014c368ebc4220ab&tcid=8ae4b08b4c31a81c014c368ebc4220ac&cname=医学免疫学&tname=甘瑞静GangRuijing&teacherid=8ae4b08b1c977ee4011c988f60c10049">未评价</a>
		   <!--  /<a href="stupg1.dq?courseid=8ae4b08b4c31a81c014c368ebc4220aa&ctype=1&skid=8ae4b08c5b52bf34015b66766df47015&contentid=8ae4b08b4c31a81c014c368ebc4220ab&tcid=8ae4b08b4c31a81c014c368ebc4220ac&cname=医学免疫学&tname=甘瑞静GangRuijing&teacherid=8ae4b08b1c977ee4011c988f60c10049">I am a student</a>
		    </span>-->
		    
		  
		
	</th>
	
	 <th align="center" scope="col" class="f12h15_black">
	 
		 <a href="#" onclick="delSkrw('8ae4b08c5b52bf34015b66766df47015','8ae4b08b4c31a81c014c368ebc4220aa','1','8ae4b08b1c977ee4011c988f60c10049')">删除评教任务（该教师未上过课）</a>
	 </th>
	
  </tr>

  <tr bgcolor="#F2F2F2" style="color:FFFFFF">
    <th align="center" scope="col" class="f12h15_black">医学免疫学</th>
    <!-- <th align="left" scope="col" class="f12h15_black">免疫学</th> -->
    <th align="center" scope="col" class="f12h15_black">
     	理论课
    </th>
    <th align="center" scope="col" class="f12h15_black">曾霞ZengXia
    </th>
    <th align="center" scope="col" class="f12h15_black">
    	
		    <span class="STYLE3">
		    <a href="stupg.do?courseid=8ae4b08b4c31a81c014c368ebc4220aa&ctype=1&skid=8ae4b08c5b52bf34015b667c9b507b3b&contentid=8ae4b08b4c31a81c014c368ebc4220ad&tcid=8ae4b08b4c31a81c014c368ebc4220ae&cname=医学免疫学&tname=曾霞ZengXia&teacherid=8ae4b08b1664ebb60116669f036d0626">未评价</a>
		   <!--  /<a href="stupg1.dq?courseid=8ae4b08b4c31a81c014c368ebc4220aa&ctype=1&skid=8ae4b08c5b52bf34015b667c9b507b3b&contentid=8ae4b08b4c31a81c014c368ebc4220ad&tcid=8ae4b08b4c31a81c014c368ebc4220ae&cname=医学免疫学&tname=曾霞ZengXia&teacherid=8ae4b08b1664ebb60116669f036d0626">I am a student</a>
		    </span>-->
		    
		  
		
	</th>
	
	 <th align="center" scope="col" class="f12h15_black">
	 
		 <a href="#" onclick="delSkrw('8ae4b08c5b52bf34015b667c9b507b3b','8ae4b08b4c31a81c014c368ebc4220aa','1','8ae4b08b1664ebb60116669f036d0626')">删除评教任务（该教师未上过课）</a>
	 </th>
	
  </tr>

  <tr  bgcolor="#FFFFFF" style="color:FFFFFF">
    <th align="center" scope="col" class="f12h15_black">医学免疫学</th>
    <!-- <th align="left" scope="col" class="f12h15_black">免疫学</th> -->
    <th align="center" scope="col" class="f12h15_black">
     	理论课
    </th>
    <th align="center" scope="col" class="f12h15_black">卢小玲LuXiaoling
    </th>
    <th align="center" scope="col" class="f12h15_black">
    	
		    <span class="STYLE3">
		    <a href="stupg.do?courseid=8ae4b08b4c31a81c014c368ebc4220aa&ctype=1&skid=8ae4b08c5b52bf34015b667caef005ba&contentid=8ae4b08b4c31a81c014c368ebc5120b1&tcid=8ae4b08b4c31a81c014c368ebc5120b2&cname=医学免疫学&tname=卢小玲LuXiaoling&teacherid=8ae4b0e32b5cf7fb012b8aec275a11bb">未评价</a>
		   <!--  /<a href="stupg1.dq?courseid=8ae4b08b4c31a81c014c368ebc4220aa&ctype=1&skid=8ae4b08c5b52bf34015b667caef005ba&contentid=8ae4b08b4c31a81c014c368ebc5120b1&tcid=8ae4b08b4c31a81c014c368ebc5120b2&cname=医学免疫学&tname=卢小玲LuXiaoling&teacherid=8ae4b0e32b5cf7fb012b8aec275a11bb">I am a student</a>
		    </span>-->
		    
		  
		
	</th>
	
	 <th align="center" scope="col" class="f12h15_black">
	 
		 <a href="#" onclick="delSkrw('8ae4b08c5b52bf34015b667caef005ba','8ae4b08b4c31a81c014c368ebc4220aa','1','8ae4b0e32b5cf7fb012b8aec275a11bb')">删除评教任务（该教师未上过课）</a>
	 </th>
	
  </tr>

  <tr bgcolor="#F2F2F2" style="color:FFFFFF">
    <th align="center" scope="col" class="f12h15_black">医学免疫学</th>
    <!-- <th align="left" scope="col" class="f12h15_black">免疫学</th> -->
    <th align="center" scope="col" class="f12h15_black">
     	理论课
    </th>
    <th align="center" scope="col" class="f12h15_black">唐深TangShen
    </th>
    <th align="center" scope="col" class="f12h15_black">
    	
		    <span class="STYLE3">
		    <a href="stupg.do?courseid=8ae4b08b4c31a81c014c368ebc4220aa&ctype=1&skid=8ae4b08c5b52bf34015b666ab3ff6b0f&contentid=8ae4b08b4c31a81c014c368ebc5120b5&tcid=8ae4b08b4c31a81c014c368ebc5120b6&cname=医学免疫学&tname=唐深TangShen&teacherid=8ae4b08b1664ebb60116669d91100619">未评价</a>
		   <!--  /<a href="stupg1.dq?courseid=8ae4b08b4c31a81c014c368ebc4220aa&ctype=1&skid=8ae4b08c5b52bf34015b666ab3ff6b0f&contentid=8ae4b08b4c31a81c014c368ebc5120b5&tcid=8ae4b08b4c31a81c014c368ebc5120b6&cname=医学免疫学&tname=唐深TangShen&teacherid=8ae4b08b1664ebb60116669d91100619">I am a student</a>
		    </span>-->
		    
		  
		
	</th>
	
	 <th align="center" scope="col" class="f12h15_black">
	 
		 <a href="#" onclick="delSkrw('8ae4b08c5b52bf34015b666ab3ff6b0f','8ae4b08b4c31a81c014c368ebc4220aa','1','8ae4b08b1664ebb60116669d91100619')">删除评教任务（该教师未上过课）</a>
	 </th>
	
  </tr>

  <tr  bgcolor="#FFFFFF" style="color:FFFFFF">
    <th align="center" scope="col" class="f12h15_black">医学免疫学</th>
    <!-- <th align="left" scope="col" class="f12h15_black">免疫学</th> -->
    <th align="center" scope="col" class="f12h15_black">
     	理论课
    </th>
    <th align="center" scope="col" class="f12h15_black">侯小琼HouXiaoqiong
    </th>
    <th align="center" scope="col" class="f12h15_black">
    	
		    <span class="STYLE3">
		    <a href="stupg.do?courseid=8ae4b08b4c31a81c014c368ebc4220aa&ctype=1&skid=8ae4b08c5b52bf34015b667cb8e30afa&contentid=8ae4b08b4c31a81c014c368ebc5120b7&tcid=8ae4b08b4c31a81c014c368ebc5120b8&cname=医学免疫学&tname=侯小琼HouXiaoqiong&teacherid=8ae4b08b1664ebb60116669e0074061c">未评价</a>
		   <!--  /<a href="stupg1.dq?courseid=8ae4b08b4c31a81c014c368ebc4220aa&ctype=1&skid=8ae4b08c5b52bf34015b667cb8e30afa&contentid=8ae4b08b4c31a81c014c368ebc5120b7&tcid=8ae4b08b4c31a81c014c368ebc5120b8&cname=医学免疫学&tname=侯小琼HouXiaoqiong&teacherid=8ae4b08b1664ebb60116669e0074061c">I am a student</a>
		    </span>-->
		    
		  
		
	</th>
	
	 <th align="center" scope="col" class="f12h15_black">
	 
		 <a href="#" onclick="delSkrw('8ae4b08c5b52bf34015b667cb8e30afa','8ae4b08b4c31a81c014c368ebc4220aa','1','8ae4b08b1664ebb60116669e0074061c')">删除评教任务（该教师未上过课）</a>
	 </th>
	
  </tr>

  <tr bgcolor="#F2F2F2" style="color:FFFFFF">
    <th align="center" scope="col" class="f12h15_black">医学免疫学</th>
    <!-- <th align="left" scope="col" class="f12h15_black">免疫学</th> -->
    <th align="center" scope="col" class="f12h15_black">
     	实验、见习课 
    </th>
    <th align="center" scope="col" class="f12h15_black">唐深TangShen
    </th>
    <th align="center" scope="col" class="f12h15_black">
    	
		    <span class="STYLE3">
		    <a href="stupg.do?courseid=8ae4b08b4c31a81c014c36916a4b20be&ctype=2&skid=8ae4b08c5b52bf34015b66c344e3562a&contentid=8ae4b08b4c31a81c014c36916a4b20cb&tcid=8ae4b08b4c31a81c014c36916a4b20cc&cname=医学免疫学&tname=唐深TangShen&teacherid=8ae4b08b1664ebb60116669d91100619">未评价</a>
		   <!--  /<a href="stupg1.dq?courseid=8ae4b08b4c31a81c014c36916a4b20be&ctype=2&skid=8ae4b08c5b52bf34015b66c344e3562a&contentid=8ae4b08b4c31a81c014c36916a4b20cb&tcid=8ae4b08b4c31a81c014c36916a4b20cc&cname=医学免疫学&tname=唐深TangShen&teacherid=8ae4b08b1664ebb60116669d91100619">I am a student</a>
		    </span>-->
		    
		  
		
	</th>
	
	 <th align="center" scope="col" class="f12h15_black">
	 
		 <a href="#" onclick="delSkrw('8ae4b08c5b52bf34015b66c344e3562a','8ae4b08b4c31a81c014c36916a4b20be','2','8ae4b08b1664ebb60116669d91100619')">删除评教任务（该教师未上过课）</a>
	 </th>
	
  </tr>

  <tr  bgcolor="#FFFFFF" style="color:FFFFFF">
    <th align="center" scope="col" class="f12h15_black">医学遗传学</th>
    <!-- <th align="left" scope="col" class="f12h15_black">实验</th> -->
    <th align="center" scope="col" class="f12h15_black">
     	实验、见习课 
    </th>
    <th align="center" scope="col" class="f12h15_black">方玲
    </th>
    <th align="center" scope="col" class="f12h15_black">
    	
		    <span class="STYLE3">
		    <a href="stupg.do?courseid=8ae4b08b4c31a81c014c3d035fc54e94&ctype=2&skid=8ae4b08c5ba2bec1015ba455b6181bc1&contentid=8ae4b08b4c31a81c014c3d0fa6244ece&tcid=8ae4b08b4c31a81c014c3d0fa6244ecf&cname=医学遗传学&tname=方玲&teacherid=8ae4b08b1637f3c1011641e764be08a0">未评价</a>
		   <!--  /<a href="stupg1.dq?courseid=8ae4b08b4c31a81c014c3d035fc54e94&ctype=2&skid=8ae4b08c5ba2bec1015ba455b6181bc1&contentid=8ae4b08b4c31a81c014c3d0fa6244ece&tcid=8ae4b08b4c31a81c014c3d0fa6244ecf&cname=医学遗传学&tname=方玲&teacherid=8ae4b08b1637f3c1011641e764be08a0">I am a student</a>
		    </span>-->
		    
		  
		
	</th>
	
	 <th align="center" scope="col" class="f12h15_black">
	 
		 <a href="#" onclick="delSkrw('8ae4b08c5ba2bec1015ba455b6181bc1','8ae4b08b4c31a81c014c3d035fc54e94','2','8ae4b08b1637f3c1011641e764be08a0')">删除评教任务（该教师未上过课）</a>
	 </th>
	
  </tr>

  <tr bgcolor="#F2F2F2" style="color:FFFFFF">
    <th align="center" scope="col" class="f12h15_black">实验生理科学(1)</th>
    <!-- <th align="left" scope="col" class="f12h15_black">实验生理科学</th> -->
    <th align="center" scope="col" class="f12h15_black">
     	实验、见习课 
    </th>
    <th align="center" scope="col" class="f12h15_black">韦红巧WeiHongQiao
    </th>
    <th align="center" scope="col" class="f12h15_black">
    	
		    <span class="STYLE3">
		    <a href="stupg.do?courseid=8ae4b08b4c59fcc9014c5b5d75164090&ctype=2&skid=8ae4b08c5b52bf34015b6550925f173f&contentid=8ae4b08b4c59fcc9014c5b5d751640ad&tcid=8ae4b08b4c59fcc9014c5b5d751640ae&cname=实验生理科学(1)&tname=韦红巧WeiHongQiao&teacherid=8ae4b08b16558494011656b321e102db">未评价</a>
		   <!--  /<a href="stupg1.dq?courseid=8ae4b08b4c59fcc9014c5b5d75164090&ctype=2&skid=8ae4b08c5b52bf34015b6550925f173f&contentid=8ae4b08b4c59fcc9014c5b5d751640ad&tcid=8ae4b08b4c59fcc9014c5b5d751640ae&cname=实验生理科学(1)&tname=韦红巧WeiHongQiao&teacherid=8ae4b08b16558494011656b321e102db">I am a student</a>
		    </span>-->
		    
		  
		
	</th>
	
	 <th align="center" scope="col" class="f12h15_black">
	 
		 <a href="#" onclick="delSkrw('8ae4b08c5b52bf34015b6550925f173f','8ae4b08b4c59fcc9014c5b5d75164090','2','8ae4b08b16558494011656b321e102db')">删除评教任务（该教师未上过课）</a>
	 </th>
	
  </tr>

  <tr  bgcolor="#FFFFFF" style="color:FFFFFF">
    <th align="center" scope="col" class="f12h15_black">实验生理科学(1)</th>
    <!-- <th align="left" scope="col" class="f12h15_black">实验生理科学理论课</th> -->
    <th align="center" scope="col" class="f12h15_black">
     	理论课
    </th>
    <th align="center" scope="col" class="f12h15_black">庞辉PangHui
    </th>
    <th align="center" scope="col" class="f12h15_black">
    	
		    <span class="STYLE3">
		    <a href="stupg.do?courseid=8ae4b08b4c59fcc9014c5b42faa13a44&ctype=1&skid=8ae4b08c5b52bf34015b6535a18c6786&contentid=8ae4b08b4c59fcc9014c5b42faa13a4f&tcid=8ae4b08b4c59fcc9014c5b42faa13a50&cname=实验生理科学(1)&tname=庞辉PangHui&teacherid=8ae4b08b16558494011656ad8d2802cf">未评价</a>
		   <!--  /<a href="stupg1.dq?courseid=8ae4b08b4c59fcc9014c5b42faa13a44&ctype=1&skid=8ae4b08c5b52bf34015b6535a18c6786&contentid=8ae4b08b4c59fcc9014c5b42faa13a4f&tcid=8ae4b08b4c59fcc9014c5b42faa13a50&cname=实验生理科学(1)&tname=庞辉PangHui&teacherid=8ae4b08b16558494011656ad8d2802cf">I am a student</a>
		    </span>-->
		    
		  
		
	</th>
	
	 <th align="center" scope="col" class="f12h15_black">
	 
		 <a href="#" onclick="delSkrw('8ae4b08c5b52bf34015b6535a18c6786','8ae4b08b4c59fcc9014c5b42faa13a44','1','8ae4b08b16558494011656ad8d2802cf')">删除评教任务（该教师未上过课）</a>
	 </th>
	
  </tr>

  <tr bgcolor="#F2F2F2" style="color:FFFFFF">
    <th align="center" scope="col" class="f12h15_black">实验生理科学(1)</th>
    <!-- <th align="left" scope="col" class="f12h15_black">实验生理科学理论课</th> -->
    <th align="center" scope="col" class="f12h15_black">
     	理论课
    </th>
    <th align="center" scope="col" class="f12h15_black">刘承武LiuChengwu
    </th>
    <th align="center" scope="col" class="f12h15_black">
    	
		    <span class="STYLE3">
		    <a href="stupg.do?courseid=8ae4b08b4c59fcc9014c5b42faa13a44&ctype=1&skid=8ae4b08c5b52bf34015b653582cb5942&contentid=8ae4b08b4c59fcc9014c5b42faa13a45&tcid=8ae4b08b4c59fcc9014c5b42faa13a46&cname=实验生理科学(1)&tname=刘承武LiuChengwu&teacherid=8ae4b08b1637f3c10116422889de0911">未评价</a>
		   <!--  /<a href="stupg1.dq?courseid=8ae4b08b4c59fcc9014c5b42faa13a44&ctype=1&skid=8ae4b08c5b52bf34015b653582cb5942&contentid=8ae4b08b4c59fcc9014c5b42faa13a45&tcid=8ae4b08b4c59fcc9014c5b42faa13a46&cname=实验生理科学(1)&tname=刘承武LiuChengwu&teacherid=8ae4b08b1637f3c10116422889de0911">I am a student</a>
		    </span>-->
		    
		  
		
	</th>
	
	 <th align="center" scope="col" class="f12h15_black">
	 
		 <a href="#" onclick="delSkrw('8ae4b08c5b52bf34015b653582cb5942','8ae4b08b4c59fcc9014c5b42faa13a44','1','8ae4b08b1637f3c10116422889de0911')">删除评教任务（该教师未上过课）</a>
	 </th>
	
  </tr>

</table>
<br/>
  <div align="center">【<a href="stupanel.do" target="_parent" class="f12h17_blod_black">返回学生工作平台</a>】【<a href="alreadymission.do" target="_parent" class="f12h17_blod_black">已经完成评价任务</a>】</div>
</body>
</html>
