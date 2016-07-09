package main.java.db_helper;

import org.fluttercode.datafactory.impl.DataFactory;

import java.sql.*;

/**
 * Created by kirill on 09.07.16
 */
public class TablePopulator {

    public static void populate(int rows) {
        Statement st;
        DataFactory df = new DataFactory();
        try {
            Class.forName("org.h2.Driver");
            Connection conn = DriverManager.getConnection("jdbc:h2:~/web-app/testDB", "test", "test");
            st = conn.createStatement();
            st.executeUpdate( "DROP TABLE IF EXISTS test_table" );
            st.execute("CREATE TABLE IF NOT EXISTS test_table( ID INT PRIMARY KEY , TEXT VARCHAR (40), INSERT_DATE DATE )");
            String city;
            for (int i = 1; i <= rows; i++) {
                city = df.getCity();
                st.executeUpdate( "INSERT INTO test_table ( ID, TEXT, INSERT_DATE ) VALUES (" + i + ", '" + city + "', CURRENT_TIMESTAMP )" );
            }
            st.close();
            conn.close();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }
}
