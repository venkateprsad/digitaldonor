<%@ page import="com.javapapers.java.mail.JavaEmail"%>
<%@ page import="javax.mail.MessagingException;"%>
<%
	String message = null;
	String status = null;
	if (request.getParameter("submit") != null) {
		JavaEmail javaEmail = new JavaEmail();
		javaEmail.setMailServerProperties();
		String emailSubject = "Contact Form using Java JSP GMail";
		String emailBody = "";
		if (request.getParameter("name") != null) {
			emailBody = "Sender Name: " + request.getParameter("name")
					+ "<br>";
		}
		if (request.getParameter("email") != null) {
			emailBody = emailBody + "Sender Email: "
					+ request.getParameter("email") + "<br>";
		}
		
		if (request.getParameter("message") != null) {
			emailBody = emailBody + "Message: " + request.getParameter("message")
					+ "<br>";
		}
		javaEmail.createEmailMessage(emailSubject, emailBody);
		try {
			javaEmail.sendEmail();
			status = "success";
			message = "Email sent Successfully!";
		} catch (MessagingException me) {
			status = "error";
			message = "Error in Sending Email!";
		}
	}
%>