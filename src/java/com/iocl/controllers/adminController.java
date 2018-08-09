package com.iocl.controllers;

import com.google.gson.Gson;
import com.iocl.quiz.DatabaseConnectionFactory;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class adminController extends HttpServlet {

    Statement st = null;
    PreparedStatement ps = null;
    Connection con = DatabaseConnectionFactory.createConnection();
    ResultSet rs = null, rs1 = null;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // processRequest(request, response);
        HashMap<String, String> globallist = new HashMap<String, String>();
        con = DatabaseConnectionFactory.createConnection();
        String query1 = "SELECT * FROM CONTROL_TABLEU";
        try {
            st = con.createStatement();
            rs = st.executeQuery(query1);

            while (rs.next()) {
                globallist.put(rs.getString(1), rs.getString(2));
            }

            request.setAttribute("globallist", globallist);
            con.close();
            Gson gson = new Gson();
            gson.toJson(globallist,response.getWriter());

        } catch (SQLException ex) {
            ex.printStackTrace();
        }finally{
            if (con != null) {
                try { con.close(); } catch (Exception e) {  } 
            }
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        con = DatabaseConnectionFactory.createConnection();
        try {
            st = con.createStatement();
            
            String name = request.getParameter("name");
            String newValue = request.getParameter("newValue");
              
            String sql = "UPDATE CONTROL_TABLEU set p_value='"+newValue+"' where param='"+name+"'";
            st.executeUpdate(sql);
            con.close();           
            
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        

    }

}