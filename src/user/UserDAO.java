package user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bbs.Bbs;
import utill.DatabaseUtill;

public class UserDAO {
	
	public int login(String userID,String userPassword) {
		String SQL="select userPassword from user where userID = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs= null;
		
		try {                       
			conn=DatabaseUtill.getConnection();
			pstmt=conn.prepareStatement(SQL);
			pstmt.setString(1,userID);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getString(1).equals(userPassword)) {
					return 1;
				}
				else {
					return 0;//비밀번호 없음
				}
			}
				return -1;//아이디 ㅇ벗음
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try{if(conn!=null) conn.close();}catch(Exception e){e.printStackTrace();}
			try{if(pstmt!=null) conn.close();}catch(Exception e){e.printStackTrace();}
			try{if(rs!=null) conn.close();}catch(Exception e){e.printStackTrace();}
		}
		return -2;//db오류
	}
	
	
	public int Join(UserDTO user) {
		String SQL="insert into user values(?,?,?,?,false,?,'','','','','')";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs= null;
		
		try {
			conn=DatabaseUtill.getConnection();
			pstmt=conn.prepareStatement(SQL);
			pstmt.setString(1,user.getUserID());
			pstmt.setString(2,user.getUserPassword());
			pstmt.setString(3,user.getUserEmail());
			pstmt.setString(4,user.getUserEmailHash());
			pstmt.setInt(5,user.getUserDiv());
			return pstmt.executeUpdate();
			
		
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try{if(conn!=null) conn.close();}catch(Exception e){e.printStackTrace();}
			try{if(pstmt!=null) conn.close();}catch(Exception e){e.printStackTrace();}
			try{if(rs!=null) conn.close();}catch(Exception e){e.printStackTrace();}
		}
		return -1;//회원가입 실패
	}
	
	public int userUpdate(String userID,String userEmail,String userName,String userHP, String MainContent,String userContent) {
		String SQL="update user set userEmail=?,userName=?,userHP=?,MainContent=?,userContent=?"
				+ " where userID= ? ";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs= null;
		
		try {
			conn=DatabaseUtill.getConnection();
			pstmt=conn.prepareStatement(SQL);
			pstmt.setString(1,userEmail);
			pstmt.setString(2,userName);
			pstmt.setString(3,userHP);
			pstmt.setString(4,MainContent);
			pstmt.setString(5,userContent);
			pstmt.setString(6,userID);
			
			return pstmt.executeUpdate();
			
		
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	
	
	public String getUserEmail(String userID) {
		String SQL="select userEmail from user where userID = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs= null;
		
		try {
			conn=DatabaseUtill.getConnection();
			pstmt=conn.prepareStatement(SQL);
			pstmt.setString(1,userID);
		rs= pstmt.executeQuery();
			
		if(rs.next()) {
			return rs.getString(1);
		}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try{if(conn!=null) conn.close();}catch(Exception e){e.printStackTrace();}
			try{if(pstmt!=null) conn.close();}catch(Exception e){e.printStackTrace();}
			try{if(rs!=null) conn.close();}catch(Exception e){e.printStackTrace();}
		}
		return null;//db오류
	}
	
	public int getUserDIV(String userID) {
		Connection conn = null;
		ResultSet rs= null;
		int DIV=0;
		String SQL="select userDIV from user where userID = ?";

		try {	
			conn=DatabaseUtill.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1,userID);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				
				DIV=Integer.parseInt(rs.getString(1));
				
			}
		
		}catch(Exception e) {
			e.printStackTrace();
		}
		return DIV;
	}	


	
	
	
	public ArrayList<UserDTO> getUserList() {
		Connection conn = null;
		ResultSet rs= null;
	
		String SQL="select * from user where userDIV = 0 AND UserEmailChecked=1";
		ArrayList<UserDTO> list = new ArrayList<UserDTO>();
		try {	
			conn=DatabaseUtill.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(SQL);
	
			rs = pstmt.executeQuery();
			while(rs.next()) {
				UserDTO userDTO = new UserDTO();
				userDTO.setUserID(rs.getString(1));
				userDTO.setUserEmail(rs.getString(3));
				userDTO.setUserName(rs.getString(7));
				userDTO.setUserHP(rs.getString(8));
				list.add(userDTO);
			}
		
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}	
	
	
	public ArrayList<UserDTO> getUser(String userID) {
		String SQL="select userID,userEmail,userDIV from user where userID = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs= null;
		ArrayList<UserDTO> list = new ArrayList<UserDTO>();
		try {
			conn=DatabaseUtill.getConnection();
			pstmt=conn.prepareStatement(SQL);
			pstmt.setString(1,userID);
			rs= pstmt.executeQuery();
			while(rs.next()) {
				UserDTO userDTO = new UserDTO();
				userDTO.setUserID(rs.getString(1));
				userDTO.setUserEmail(rs.getString(2));
				userDTO.setUserDiv(rs.getInt(3));
				
				list.add(userDTO);
			}
		
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}	
	public ArrayList<UserDTO> getUserALL(String userID) {
		String SQL="select * from user where userID = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs= null;
		ArrayList<UserDTO>list = new ArrayList<UserDTO>();
			try {
			conn=DatabaseUtill.getConnection();
			pstmt=conn.prepareStatement(SQL);
			pstmt.setString(1,userID);
			rs= pstmt.executeQuery();
			while(rs.next()) {
				UserDTO userDTO = new UserDTO();
				userDTO.setUserID(rs.getString(1));
				userDTO.setUserPassword(rs.getString(2));
				userDTO.setUserEmail(rs.getString(3));
				userDTO.setUserEmailHash(rs.getString(4));
				userDTO.setUserEmailChecked(rs.getBoolean(5));
				userDTO.setUserDiv(rs.getInt(6));
				userDTO.setUserName(rs.getString(7));
				userDTO.setUserHP(rs.getString(8));
				userDTO.setUserIMG(rs.getString(9));
				userDTO.setMainContent(rs.getString(10));
				userDTO.setUserContent(rs.getString(11));
				list.add(userDTO);
			}
		
		}catch(Exception e) {
			e.printStackTrace();
		}
			return list;
	}	
	
	
	
	
	
	
	public boolean getUserEmailChecked(String userID) {
		String SQL="select userEmailChecked from user where userID = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs= null;
		
		try {
			conn=DatabaseUtill.getConnection();
			pstmt=conn.prepareStatement(SQL);
			pstmt.setString(1,userID);
	
		rs= pstmt.executeQuery();
			
		if(rs.next()) {
			return rs.getBoolean(1);
		}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try{if(conn!=null) conn.close();}catch(Exception e){e.printStackTrace();}
			try{if(pstmt!=null) conn.close();}catch(Exception e){e.printStackTrace();}
			try{if(rs!=null) conn.close();}catch(Exception e){e.printStackTrace();}
		}
		return false;//db오류
	}
	

	public boolean setUserEmailChecked(String userID) {
		String SQL="update user set userEmailChecked = true where userID=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs= null;
		
		try {
			conn=DatabaseUtill.getConnection();
			pstmt=conn.prepareStatement(SQL);
			pstmt.setString(1,userID);
	
			 pstmt.executeUpdate();
			return true;
	
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try{if(conn!=null) conn.close();}catch(Exception e){e.printStackTrace();}
			try{if(pstmt!=null) pstmt.close();}catch(Exception e){e.printStackTrace();}
			try{if(rs!=null) rs.close();}catch(Exception e){e.printStackTrace();}
		}
		return false;//db오류
	}
	
	public String getUserImg(String userID)
	{
		Connection conn =null;
		PreparedStatement pstmt =null;
		ResultSet rs = null;
		String SQL = "select userIMG from user where userID = ?";
		
		try {
			conn=DatabaseUtill.getConnection();
			pstmt=conn.prepareStatement(SQL);
			pstmt.setString(1,userID);
			rs=pstmt.executeQuery();
			if(rs.next());
				if(rs.getString("userIMG").equals(""))
				{
					return "http://localhost:8080/Project/img/avataaars.svg";
				} 
				return "http://localhost:8080/Project/upload/" + rs.getString("userIMG");
		
						
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			try{if(conn!=null) conn.close();}catch(Exception e){e.printStackTrace();}
			try{if(pstmt!=null) conn.close();}catch(Exception e){e.printStackTrace();}
			try{if(rs!=null) conn.close();}catch(Exception e){e.printStackTrace();}
		}
		return "http://localhost:8080/Project/img/avataaars.svg";
		
		
	}
	
	public int setUserIMG(String userID,String userIMG) {
		Connection conn =null;
		PreparedStatement pstmt =null;
		ResultSet rs = null;
		String SQL = "update user set userIMG= ? where userID= ?";
		try {
		conn=DatabaseUtill.getConnection();
		pstmt=conn.prepareStatement(SQL);
		pstmt.setString(1,userIMG);
		pstmt.setString(2,userID);

		return pstmt.executeUpdate();
		
	
	}catch(Exception e) {
		e.printStackTrace();
	}finally {
		try{if(conn!=null) conn.close();}catch(Exception e){e.printStackTrace();}
		try{if(pstmt!=null) pstmt.close();}catch(Exception e){e.printStackTrace();}
		try{if(rs!=null) rs.close();}catch(Exception e){e.printStackTrace();}
	}
	return -1;
}
	


}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
