/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sendmail;

import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author ThienPN
 */
public class SendMail {
    public static void Send(String toMail,String userid, String name, String roleid, String address, String birthday, int phone) {
        //create an instance of Properties Class   

        final String user = "thienpnse150137@fpt.edu.vn";
        final String pass = "asas1985!";

        Properties props = new Properties();

        
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");

        Session session = Session.getInstance(props, new javax.mail.Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(user, pass);
            }
        });

        try {

            String sub = "Code To Verify Your Account!";
            String msg = "<!DOCTYPE html>\n"
                    + "<html lang=\"en\">\n"
                    + "\n"
                    + "<head>\n"
                    + "</head>\n"
                    + "\n"
                    + "<body>\n"
                    + "    <h2>Thanks you for create new account from VegatableStore.</h2>\n"
                    + "    <h2>Your Account Profile is.</h2>\n"
                    + "    <h3>UserID    : "+ userid + "</h2>\n"
                    + "    <h3>Password  : ****** </h3>\n"
                    + "    <h3>Full Name : "+ name + "</h3>\n"
                    + "    <h3>RoleID    : "+ roleid + "</h3>\n"
                    + "    <h3>Addredd   : "+ address + "</h3>\n"
                    + "    <h3>Birthday  : "+ birthday + "</h3>\n"
                    + "    <h3>Phone     : "+ phone + "</h3>\n"
                    + "    <h3 style=\"color: cryan;\">Thank you very much!</h3>\n"
                    + "\n"
                    + "</body>\n"
                    + "\n"
                    + "</html>";
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(user));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(toMail));
            message.setSubject(sub);
            message.setContent(msg, "text/html");

            Transport.send(message);

        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }
}
