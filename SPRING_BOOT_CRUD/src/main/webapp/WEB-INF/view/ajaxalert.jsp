<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ajaxalert.jsp</title>
	
	<script type="text/javascript">
	
		function fun()
		{
			var fn = document.getElementById("firstName");
			
			var htp = new XMLHttpRequest();
			
			htp.onreadystatechange = function() {				
				if(htp.readyState == 4)	
				{
					alert(htp.responseText);
					var jsn = JSON.parse(htp.responseText);
					
					
					
					for(var i=0; i<jsn.length; i++ )
					{
						
					}
				}
			}
			
			htp.open("get","validfn?Firstname="+cn.value+" ",true);
			htp.send();
			
			
		}
		
		
		
	
	</script>

</head>
<body>

	<table border="1px solid black">
		<tr>
			<td>First Name: </td>
			<td><input type="text" name="firstName" id="firstName" onblur="f1()"> </td>
		</tr>
	
		<tr>
			<td>Last Name:</td>
			<td><input type="text" name="lastName" id="lastName"></td>
		</tr>

		<tr>
			<td colspan="2"><input type="submit" onclick="fan()"></td>
		</tr>
	</table>
	



</body>
</html>