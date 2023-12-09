package com.java.Pharmacy;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.*;
import javax.mail.internet.*;
import java.util.Properties;

public class ImageMailSend {

    public static String sendOtp(String toEmail, String subject, String body, String imagePath) {
        // Sender's email ID needs to be mentioned
        String from = "prasanna.trainer@gmail.com";

        // Assuming you are sending email through Gmail's SMTP
        String host = "smtp.gmail.com";

        // Get system properties
        Properties properties = System.getProperties();

        // Setup mail server
        properties.put("mail.smtp.host", host);
        properties.put("mail.smtp.port", "587");
        properties.put("mail.smtp.starttls.enable", "true");
        properties.put("mail.smtp.auth", "true");

        // Get the Session object and pass the username and password
        Session session = Session.getInstance(properties, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication("prasanna.vsp80@gmail.com", "soqdhechjkcchkgl");
            }
        });

        // Used to debug SMTP issues
        session.setDebug(true);

        try {
            // Create a default MimeMessage object.
            Message message = new MimeMessage(session);

            // Set From: header field of the header.
            message.setFrom(new InternetAddress(from));

            // Set To: header field of the header.
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail));

            // Set Subject: header field
            message.setSubject(subject);

            // Create MimeMultipart for mixed content
            MimeMultipart mixedMultipart = new MimeMultipart("mixed");

            // Create MimeMultipart for related content (HTML + Image)
            MimeMultipart relatedMultipart = new MimeMultipart("related");

            // Create MimeBodyPart for the HTML content
            MimeBodyPart htmlPart = new MimeBodyPart();
            String htmlText = "<html><body>" + body + "</body></html>";
            htmlPart.setContent(htmlText, "text/html");
            relatedMultipart.addBodyPart(htmlPart);

            // Create MimeBodyPart for the image
            MimeBodyPart imagePart = new MimeBodyPart();
            DataSource fds = new FileDataSource(imagePath);
            imagePart.setDataHandler(new DataHandler(fds));
            imagePart.setHeader("Content-ID", "<image>");
            relatedMultipart.addBodyPart(imagePart);

            // Add the relatedMultipart to the mixedMultipart
            MimeBodyPart mixedBodyPart = new MimeBodyPart();
            mixedBodyPart.setContent(relatedMultipart);
            mixedMultipart.addBodyPart(mixedBodyPart);

            // Set the content of the message
            message.setContent(mixedMultipart);

            // Send message
            Transport.send(message);
            return "Sent message successfully....";
        } catch (MessagingException e) {
            return e.getMessage();
        }
    }
}
