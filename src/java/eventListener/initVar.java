/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/ServletListener.java to edit this template
 */
package eventListener;

import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

/**
 * Web application lifecycle listener.
 *
 * @author vinhh
 */
public class initVar implements HttpSessionListener {

    @Override
    public void sessionCreated(HttpSessionEvent se) {
        
        //khoi tao slai set = 0
        se.getSession().setAttribute("slSai", 0);
        
    }

    @Override
    public void sessionDestroyed(HttpSessionEvent se) {
    }
}
