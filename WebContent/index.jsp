<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
     <%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>测试</title>
</head>
<body> 
<hr><center><h2>第one题</h2><p></center><center><h4>使用sql标签，查询id为002的英雄</h4></center>
<hr>
<sql:setDataSource 
var="lian" 
driver="com.microsoft.sqlserver.jdbc.SQLServerDriver"
url="jdbc:sqlserver://localhost:1433;DatabaseName=lol" 
user="zoujian" 
password=""/>

<c:set var="cha" value="002"/>
<sql:query dataSource="${lian }"
sql="select * from hero where id=?" var="result">
<sql:param value="${cha }"/>
</sql:query>
<c:forEach var="row" items="${result.rows }">
<center>
<table>
<tr><td><center>ID</center></td><td><center>名字</center></td><td><center>描述</center></td><td><center>别称</center></td></tr>
<tr>
<td><c:out value="${row.id }"/></td>
<td><c:out value="${row.name }"/></td>
<td><c:out value="${row.descs }"/></td>
<td><c:out value="${row.nick_name }"/></td>
</tr>
</table>
</center>
</c:forEach>
<br>
<br>
<hr><center><h2>第two题</h2><p><h4>使用sql标签，显示出id从002到003的英雄</h4></center>
<hr>
<center>
<table><tr><td>ID</td><td>名字</td><td>描述</td><td>别称</td></tr></table>

<sql:query var="zhong" dataSource="${lian }" sql="select * from hero where id>=002 and id<=003">
</sql:query>
<c:forEach var="rows" items="${zhong.rows }">
<table>
<tr>
<td><c:out value="${rows.id }"/></td>
<td><c:out value="${rows.name }"/></td>
<td><c:out value="${rows.descs }"/></td>
<td><c:out value="${rows.nick_name }"/></td>
</tr>
</table>
</c:forEach>
</center>
<br>
<hr><center><h2>第three题<p></h2><h4>使用fn标签，将查找出的艾希，全部换成盖伦</h4></center>
<hr>
<sql:query dataSource="${lian }"
sql="select * from hero" var="result02">
</sql:query>
<c:forEach items="${result02.rows }" var="hero1">
<c:if test="${fn:contains(hero1.name,'艾希')}">
<c:set var="string2" value="${fn:replace(hero1.name,'艾希','盖伦' )}"/>
<center>艾希，全部换成盖伦结果：${string2}</center>>
</c:if>
</c:forEach>
<br>
<hr><center><h2>第four题</h2><p><h4>使用fn标签，将盖伦的“德玛西亚之力”截断
   成为“德玛西亚”</h4></center>
   <sql:query dataSource="${lian }"
sql="select * from hero" var="result03">
</sql:query>
<c:forEach items="${result03.rows }" var="hero2">
<c:if test="${fn:contains(hero2.name,'盖伦')}">
<c:set var="string3" value="${fn:substring( hero2.nick_name,0,4)}"/>
<center>截断结果：${string3}</center>
</c:if>
</c:forEach>
<br>
<hr><center><h2>第five题<p></h2><h4>计算id为003的英雄的描述有多少个字。</h4></center>
<c:set var="id003" value="003"/>
<sql:query dataSource="${lian }"
sql="select * from hero where id=?" var="result01">
<sql:param value="${id003 }"/>
</sql:query>
<c:forEach items="${result01.rows }" var="hero3">
<c:if test="${fn:contains(hero3.id,id003) }">
<c:set var="string1" value="${fn:length(hero3.descs )}"/>
<center>id为003的英雄字符串描述有：${string1}个字节。</center>
</c:if>
</c:forEach>


</body>
</html>