//preso in input un intero X, estrarre i dati degli appartamenti a cui sono associate
//spese la cui somma è maggiore di X

package cond;

import java.sql.*;
import java.util.*;

public class QueryCond
{
	public static void main(String [] args)
	{
		Scanner input = new Scanner(System.in);
		System.out.println("Inserisci la spesa totale attesa");
		int x = Integer.parseInt(input.nextLine());
		QueryCond.Esercizio(x);
	}
	
	public static void Esercizio(int x)
	{
		Connection con = null;
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/condominio"
					+ "?useUnicode=true&useJDBCCompliantTimezoneShift=true"
					+ "&useLegacyDatetimeCode=false&serverTimezone=UTC";
			
			String username = "root";
			String pwd = "inserirepwd";
			
			con = DriverManager.getConnection(url, username, pwd);
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
		
		try
		{
			Statement query = con.createStatement();
			ResultSet result = query.executeQuery("select condominio, scala, interno\r\n"
					+ "from rif_appartamento join spesa on rif_appartamento.spesa = spesa.codice\r\n"
					+ "group by condominio, scala, interno\r\n"
					+ "having sum(importo) > " + x);
			System.out.println("Condomini che hanno pagato più di " + x + " euro di spese:");
			while (result.next())
			{
				String condominio = result.getString("condominio");
				String scala = result.getString("scala");
				String interno = result.getString("interno");
				System.out.println(" | "+condominio+" | "+scala+" | "+interno+" | ");
			}
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
	}
}
