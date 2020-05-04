<%@ page language="java" isELIgnored="false" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

       <html>
       <head>
       <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
       <title>edit</title>
       <script type="text/javascript" src="/js/jquery.min.js"></script>
              <script>
                     function isNull( str ){
                            if ( str == "" ) return true;
                            var regu = "^[ ]+$";
                            var re = new RegExp(regu);
                            return re.test(str);
                     }
                     $(function () {

                            $("#ajaxBtn").bind("click",function () {
                                   var id = $('#id').val().trim();
                                   if(isNull(id)){
                                          id = null;
                                   }else{
                                          id = parseInt(id);
                                   }
                                   var json = {"id": id, "name": $('#name').val().trim(),
                                          "address":$('#address').val().trim(), "phone":$('#phone').val().trim()}
                                   // 发送ajax请求
                                   $.ajax({
                                          url: '/edit',
                                          type: 'POST',
                                          data: JSON.stringify(json),
                                          contentType: 'application/json;charset=utf-8',
                                          dataType: 'json',
                                          success: function (data) {
                                                 location.href="/list"
                                          }
                                   })

                            })


                     })
              </script>
              <STYLE type=text/css>
                     BODY {
                            TEXT-ALIGN: center;
                            PADDING-BOTTOM: 0px;
                            BACKGROUND-COLOR: #ddeef2;
                            MARGIN: 0px;
                            PADDING-LEFT: 0px;
                            PADDING-RIGHT: 0px;
                            PADDING-TOP: 350px
                     }
              </STYLE>
       </head>
       <body>
       <div>
              <fieldset>
                     <form>
                            id: <input id="id" type="text" name="id" value="${resume.id}" disabled="disabled"/><br>
                            <br>
                            name: <input id="name" type="text" name="name" value="${resume.name}" /><br>
                            <br>
                            &nbsp;address: <input id="address" type="text" name="address" value="${resume.address}" /><br>
                            <br>
                            phone: <input id="phone" type="text" name="phone" value="${resume.phone}" /><br>
                            <br>
                            <input type="button" value="提交" id="ajaxBtn" />
                     </form>
              </fieldset>
       </div>

       </body>
       </html>