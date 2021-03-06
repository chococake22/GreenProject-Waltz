<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>μλνκΈ°</title>
    <link rel="stylesheet" href="/resources/css/contestBoardUpdate.css">

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&family=Nanum+Gothic+Coding:wght@700&display=swap" rel="stylesheet">

    <script src="//code.jquery.com/jquery-3.3.1.min.js"></script>


	<script type="text/javascript">
      $(document).ready(function(){
         var formObj = $("form[name='updateForm']");
         
         $(document).on("click","#fileDel", function(){
            $(this).parent().remove();
         })
         
         fn_addFile();
         
         $(".cancel_btn").on("click", function(){
            event.preventDefault();
            self.location = "/contest/contestBoardDetail?"
                 + "PO_NUM=${detail.PO_NUM}"
                 + "&BO_NUM=1"
                  + "&page=${scri.page}&perPageNum=${scri.perPageNum}"
                  + "&searchType=${scri.searchType}&keyword=${scri.keyword}";
         })
         
         $(".update_btn").on("click", function(){
            if(fn_valiChk()){
               return false;
            }
            formObj.attr("action", "/contest/contestBoardUpdate");
            formObj.attr("method", "POST");
            formObj.submit();
         })
      })
         
      function fn_valiChk(){
         var updateForm = $("form[name='updateForm'] .chk").length;
         for(var i = 0; i<updateForm; i++){
            if($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null){
               alert($(".chk").eq(i).attr("PO_TITLE"));
               return true;
            }
         }
      }
      
      // νμΌμΆκ°
      function fn_addFile(){
          var fileIndex = 1;
         
          $(".fileAdd_btn").on("click", function(){
             $("#fileIndex").append("<div><input type='file' style='margin-bottom:5px;' name='file_"+(fileIndex++)+"'>"
             +"</button>"+"<button type='button' id='fileDelBtn'>"+"μ­μ "+"</button></div>");
          });
          
          $(document).on("click","#fileDelBtn", function(){
              $(this).parent().remove();
           });
        }
      
        var fileNoArry = new Array();
        var fileNameArry = new Array();
        
        // μ­μ 
        function fn_del(value, name){
           
           fileNoArry.push(value);
           fileNameArry.push(name);
           $("#fileNoDel").attr("value", fileNoArry);
           $("#fileNameDel").attr("value", fileNameArry);
        }
       
   </script>
</head>
<body>


   <header>
        <nav id="header_container">
            <ul id="menubar">
                <li>
                    <div>
                        <a href="/"><img src="/resources/images/logo.png" alt=""></a>
                    </div>
                </li>
                <li class="dropdown">
                    <div class="dropdown_menu">
                        <a href="/brand.jsp">λΈλλμ€ν λ¦¬</a> 
                    </div>
                </li>
                <li class="dropdown">
                    <div class="dropdown_menu">
                        <a href="#">μ»€λ?€λμΌμ΄μ</a> 
                    </div>
                    <div class="dropdown_content1">
                       <a href="/contest/contestBoardList">μλνκΈ°</a>
                        <a href="/market/marketBoardList">μμΈ μ₯ν°</a>
                        <a href="../html/find.html">μ°Ύμμ£ΌμΈμ</a>
                        <a href="/board/questionBoardList">κΆκΈν΄μ</a>
                    </div>
                </li>
                <li class="dropdown">
                    <div class="dropdown_menu">
                        <a href="/tools.jsp">ν΄μ¦</a>   
                    </div>
                    <div class="dropdown_content2">
                        <a href="/bcs.jsp">λΉλ§λ</a>
                        <a href="/daykcal.jsp">μΉΌλ‘λ¦¬</a>
                        <a href="/age.jsp">λμ΄</a>
                        
                    </div>
                </li>
                <li class="dropdown">
                    <div class="dropdown_menu">
                        <a href="#">μ§λ¨λ°κΈ°</a>
                    </div>
                    <div class="dropdown_content3">
                        <a href="/vetintro.jsp">μμμ¬ μκ°</a>
                        <a href="/hospital.jsp">μ£Όλ³ λ³μ</a>            
                    </div> 
                </li>
                <li class="dropdown">
                    <div class="dropdown_menu">
                        <a href="#">κ³ κ°μΌν°</a>
                    </div>
                    <div class="dropdown_content4">
                        <a href="/question.jsp">μμ£Ό λ¬»λ μ§λ¬Έ</a>
                        <a href="/oneonone.jsp">1:1 μ§λ¬ΈνκΈ°</a>    
                    </div> 
                </li>
            </ul>
            
            
            <c:catch>
             <c:choose>
                 <c:when test="${empty authInfo }">
                 <ul id="personal">
                 
                     <li>
                          <a href="/login" style="font-size:13px;"><i class="fa fa-sign-in"></i> λ‘κ·ΈμΈ</a>
                      </li>
                      <li>
                          <a href="/register/step1" style="font-size:13px;"><i class="fa fa-user"></i> νμκ°μ</a>
                      </li>
                  </ul>   
                 </c:when>
                 <c:otherwise>
                     <c:choose>
                     
                     
                         <c:when test="${authInfo.manager eq '1' }">
                         
                         <ul id="personal" style="margin-left:780px; margin-top:-52px;">
                     
                           <li style="font-size:13px; margin-right:20px; margin-top:2px;">
                              κ΄λ¦¬μ ${authInfo.name }
                           </li>
                              <%-- <h5>κ΄λ¦¬μ ${authInfo.name }λ, νμν©λλ€.</h5> --%>
                              
                             <li>
                                   <a href="/list" style="font-size:13px;"><i class="fa fa-sign-out"></i> νμλͺ©λ‘</a>
                             </li>                    
                             <li>
                                   <a href="/logout" style="font-size:13px;"><i class="fa fa-sign-out"></i> λ‘κ·Έμμ</a>
                             </li>
                   
                        </ul>
                         </c:when>
                         
                         
                         <c:otherwise>
                         <ul id="personal" style="margin-left:800px;">
                     
                              <li style="font-size:13px; margin-right:30px; margin-top:2px;" >
                                 ${authInfo.name }λ
                              </li>
         
                               <li>
                                   <a href="/logout" style="font-size:13px; "><i class="fa fa-sign-out"></i> λ‘κ·Έμμ</a>
                               </li>
                               <li>
                                    <a href="/myPost" style="font-size:13px;"> λ§μ΄νμ΄μ§</a>
                               </li>
                               
                          </ul>     
                               
                         </c:otherwise>
                     </c:choose>
                 </c:otherwise>
             </c:choose>
         </c:catch> 
            
            
        </nav>
    </header>


    <div id="header_back">
    </div>

    
    <div id="container">
        <div id="title" style="padding-top:80px; margin-bottom:50px; font-size:20px; font-weight:700;">
            <p>μλνκΈ°</p>
        </div>


        <div id="boast_update_box">      
            <form name="updateForm" action='<c:url value='/contest/contestBoardUpdate'/>' method="POST" enctype="multipart/form-data">   

                <div id="boast_title">
                    <label for="title">μ λͺ©</label> 
                    <div id="title_input">
                        <input type="text" style="width:500px; height:25px; border: rgb(218, 206, 206) solid 1px;" id="title" name="PO_TITLE" value=<c:out value="${detail.PO_TITLE }"/>><p/>
                    </div>       
                </div>


                <div id="boast_author">
                    <label for="author">μμ±μ</label>
                    <div id="author_input">
                        <input type="text" style="width:500px; height:25px; border: rgb(218, 206, 206) solid 1px;" id="author" name="MEM_ID" value=<c:out value="${detail.MEM_ID }"/> readonly><p/>
                    </div>
                </div>
                
                            
                <div id="boast_content">
                    <label for="content">λ΄μ©</label> <br>
                    <div id="text_input">
                        <textarea id="content" style="border: rgb(218, 206, 206) solid 1px;" rows="10" name="PO_CONTENT"><c:out value="${detail.PO_CONTENT }"/></textarea><p/>
                            
                        <input type="hidden" name="PO_NUM" value=<c:out value="${detail.PO_NUM }"/>>
                        <input type="hidden" name="BO_NUM" value=<c:out value="1"/>>
                        <input type="hidden" name="page" value=<c:out value="${scri.page}"/>>
                        <input type="hidden" name="perPageNum" value=<c:out value="${scri.perPageNum}"/>>
                        <input type="hidden" name="searchType" value=<c:out value="${scri.searchType}"/>>
                        <input type="hidden" name="keyword" value=<c:out value="${scri.keyword}"/>>
                        <input type="hidden" id="fileNoDel" name="fileNoDel[]" value=""> 
                        <input type="hidden" id="fileNameDel" name="fileNameDel[]" value=""> 
                    </div>
                    
                </div>   
           
               
               <%--  <div id="fileIndex">
                    <c:forEach var="file" items="${file}" varStatus="var">
                    <div>
                        <img src="/contest/fileDown?imageFileName=${file.ORG_FILE_NAME}&FI_NUM=${file.FI_NUM}&BO_NUM=1"><br>
                        <input type="hidden" id="FILE_NO" name="FI_NUM_${var.index}" value="${file.FI_NUM }">
                        <input type="hidden" id="FILE_NAME" name="FILE_NAME" value="FI_NUM_${var.index}">
                        <a href="#" id="fileName" onclick="return false;">${file.ORG_FILE_NAME}</a>(${file.FILE_SIZE}kb)
                        <button id="fileDel" onclick="fn_del('${file.FI_NUM}','FI_NUM_${var.index}');" type="button">μ­μ </button><br>
                    </div>
                    </c:forEach>
                </div> --%>
                
                <button type="button" class="fileAdd_btn">νμΌμΆκ°</button>
                
                <div id="fileIndex">
			          <c:forEach var="file" items="${file}" varStatus="var">
			               <div>
			                  <input type="hidden" id="FILE_NO" name="FI_NUM_${var.index}" value="${file.FI_NUM }">
			                  <input type="hidden" id="FILE_NAME" name="FILE_NAME" value="FI_NUM_${var.index}">
			                  <a href="#" id="fileName" onclick="return false;">${file.ORG_FILE_NAME}</a>(${file.FILE_SIZE}kb)
			                  <button id="fileDel" onclick="fn_del('${file.FI_NUM}','FI_NUM_${var.index}');" type="button">μ­μ </button><br>
			               </div>
			         </c:forEach>
			     </div>
               
               
               
               
               
                

                <div id="buttonBox">
                    <button type="button" style="width:100px; height:30px; margin-right:30px; cursor:pointer;" class="update_btn">μμ </button>
                    <button type="button" style="width:100px; height:30px;" class="cancel_btn">μ·¨μ</button>
                </div>
                
               
            </form> 
        </div>



        <div id="copyright" >
            <div id="copyright_box">
                <div id="copyright_left">
                    <p id="cs">κ³ κ°μΌν°<br>
                        080. 5498. 4890.<br>
                        waltzadmin@waltz.com</p>
                    <p id="address"> κ²½κΈ°λ μμμ νλ¬κ΅¬ λ§€μ°λ‘ 12-1 | μμΈ (μ£Ό) 
                        <br>λ±λ‘μΌμ : 2021λ 11μ 12μΌ 
                        <br>λ°νμΈ : μ€μΌλ¨ | νΈμ§μΈ : μ€μΌλ¨
                </div>
                <div id="copyright_right">
                    <div id="copyright_right1">
                        <p id="ment">
                            μμΈ μ λͺ¨λ  μ½νμΈ λ μ μκΆλ²μ μν΄ λ³΄νΈλ₯Ό λ°μ΅λλ€. <br>
                            λ¬΄λ¨ λ³΅μ , λͺ¨λ°© μ λ²μ μΈ μ²λ²μ λ°μ μ μμ΅λλ€.
                        </p> 
                    </div>
                
                    <div id="snslogo">
                        <a href="https://www.facebook.com"><img src="/resources/images/facebook.png" alt=""></a>
                        <a href="https://www.instagram.com"><img src="/resources/images/instagram.png" alt=""></a>
                        <a href="https://www.youtube.com"><img src="/resources/images/youtube.png" alt=""></a>
                    </div>
                </div>     
            </div>
        <hr id="copyright_line">
        <p id="copyright_last">Copyright (c) Waltz 2021, All Rights Reserved</p>
        </div>    

    </div>

    <!-- <div id="kakao">
        <img src="/resources/images/kakaoimage.png" alt="" id="kakao_logo">
        <div>
            <img src="/resources/images/up2.png" style="cursor: pointer;" alt="" id="up" onclick="window.scrollTo(0,0);">
        </div>
        
    </div> -->




    <!-- <form name="updateForm" action='<c:url value='/contest/contestBoardUpdate'/>' method="POST" enctype="multipart/form-data">   

        <label for="title"  >μ λͺ©</label> 
        <input type="text" id="title" name="PO_TITLE" value=<c:out value="${detail.PO_TITLE }"/>><p/>

        <label for="author">μμ±μ</label> 
        <input type="text" id="author" name="MEM_ID" value=<c:out value="${detail.MEM_ID }"/> readonly><p/>

       
        <label for="content" style="font-weight:700;">λ΄μ©</label> <br><br>
        <textarea id="content" rows="10" style="width:1000px; height:500px; resize:none;" name="PO_CONTENT"><c:out value="${detail.PO_CONTENT }"/></textarea><p/>
                   
        <input type="hidden" name="PO_NUM" value=<c:out value="${detail.PO_NUM }"/>>
        <input type="hidden" name="BO_NUM" value=<c:out value="1"/>>
        <input type="hidden" name="page" value=<c:out value="${scri.page}"/>>
        <input type="hidden" name="perPageNum" value=<c:out value="${scri.perPageNum}"/>>
        <input type="hidden" name="searchType" value=<c:out value="${scri.searchType}"/>>
        <input type="hidden" name="keyword" value=<c:out value="${scri.keyword}"/>>
        <input type="hidden" id="fileNoDel" name="fileNoDel[]" value=""> 
        <input type="hidden" id="fileNameDel" name="fileNameDel[]" value=""> 
        
        
         <div id="fileIndex">
            <c:forEach var="file" items="${file}" varStatus="var">
            <div>
              <img src="/contest/fileDown?imageFileName=${file.ORG_FILE_NAME}&FI_NUM=${file.FI_NUM}&BO_NUM=1"><br>
              <input type="hidden" id="FILE_NO" name="FI_NUM_${var.index}" value="${file.FI_NUM }">
              <input type="hidden" id="FILE_NAME" name="FILE_NAME" value="FI_NUM_${var.index}">
              <a href="#" id="fileName" onclick="return false;">${file.ORG_FILE_NAME}</a>(${file.FILE_SIZE}kb)
              <button id="fileDel" onclick="fn_del('${file.FI_NUM}','FI_NUM_${var.index}');" type="button">μ­μ </button><br>
            </div>
              </c:forEach>
          </div>


          <div style="margin-bottom:30px; width:100%; height:100px; ">
                <button type="button" class="fileAdd_btn">νμΌμΆκ°</button>
            </div>

        <div style="display:inline-flex; padding-left:370px; width:1030px; height:50px;">
           <button type="button" class="update_btn" style="margin-right:20px; width:100px; height:30px; ">μμ </button>
           <button type="button" class="cancel_btn" style="width:100px; height:30px;">μ·¨μ</button>
        </div>
    
    </form> -->



<!-- <div>      
   <form name="updateForm" action='<c:url value='/contest/contestBoardUpdate'/>' method="POST" enctype="multipart/form-data">      
      <label for="title">μ λͺ©</label>
      <input type="text" id="title" name="PO_TITLE" value=<c:out value="${detail.PO_TITLE }"/>><p/>
                  
      <label for="author">μμ±μ</label>
      <input type="text" id="author" name="MEM_ID" value=<c:out value="${detail.MEM_ID }"/> readonly><p/>

      <label for="content">λ΄μ©</label>
      <textarea id="content" rows="10" name="PO_CONTENT"><c:out value="${detail.PO_CONTENT }"/></textarea><p/>
                 
      <input type="hidden" name="PO_NUM" value=<c:out value="${detail.PO_NUM }"/>>
      <input type="hidden" name="BO_NUM" value=<c:out value="1"/>>
      <input type="hidden" name="page" value=<c:out value="${scri.page}"/>>
      <input type="hidden" name="perPageNum" value=<c:out value="${scri.perPageNum}"/>>
      <input type="hidden" name="searchType" value=<c:out value="${scri.searchType}"/>>
      <input type="hidden" name="keyword" value=<c:out value="${scri.keyword}"/>>
      <input type="hidden" id="fileNoDel" name="fileNoDel[]" value=""> 
      <input type="hidden" id="fileNameDel" name="fileNameDel[]" value=""> 
      
      
      <div id="fileIndex">
          <c:forEach var="file" items="${file}" varStatus="var">
               <div>
                  <input type="hidden" id="FILE_NO" name="FI_NUM_${var.index}" value="${file.FI_NUM }">
                  <input type="hidden" id="FILE_NAME" name="FILE_NAME" value="FI_NUM_${var.index}">
                  <a href="#" id="fileName" onclick="return false;">${file.ORG_FILE_NAME}</a>(${file.FILE_SIZE}kb)
                  <button id="fileDel" onclick="fn_del('${file.FI_NUM}','FI_NUM_${var.index}');" type="button">μ­μ </button><br>
               </div>
         </c:forEach>
     </div>
      
      <button type="button" class="fileAdd_btn">νμΌμΆκ°</button>
      <button type="button" class="update_btn">μμ </button>
      <button type="button" class="cancel_btn">μ·¨μ</button>
      
   </form>
</div>  -->



</body>
</html>