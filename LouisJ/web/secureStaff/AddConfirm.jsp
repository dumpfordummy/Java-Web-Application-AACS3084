<h3>
<%
  boolean success = (Boolean)session.getAttribute("success");
  if (success)
      out.println("Item added successfully.");
  else
      out.println("Error: Unable to add new item.");
%>
</h3>
<p><a href="index.html">Back to home page</a></p>