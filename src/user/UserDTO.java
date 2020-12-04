package user;

public class UserDTO {

	private String userID;
	private String userPassword;
	private String userEmail;
	private String userEmailHash;
	private boolean userEmailChecked;
	private int userDiv;
	private String userName;
	private String userHP;
	private String userIMG;
	private String MainContent;
	private String userContent;

	
	public UserDTO() {
		
	}
	
	public UserDTO(String userID, String userPassword, String userEmail, String userEmailHash,
			boolean userEmailChecked,int userDiv) {

		this.userID = userID;
		this.userPassword = userPassword;
		this.userEmail = userEmail;
		this.userEmailHash = userEmailHash;
		this.userEmailChecked = userEmailChecked;
		this.userDiv= userDiv;
	}

	
	
	public UserDTO(String userID, String userPassword, String userEmail, String userEmailHash, boolean userEmailChecked,
			int userDiv, String userName, String userHP, String userIMG, String mainContent, String userContent) {
		super();
		this.userID = userID;
		this.userPassword = userPassword;
		this.userEmail = userEmail;
		this.userEmailHash = userEmailHash;
		this.userEmailChecked = userEmailChecked;
		this.userDiv = userDiv;
		this.userName = userName;
		this.userHP = userHP;
		this.userIMG = userIMG; 
		this.MainContent = mainContent;
		this.userContent = userContent;

	}

	public String getUserID() {
		return userID;
	}

	public void setUserID(String userID) {
		this.userID = userID;
	}

	public String getUserPassword() {
		return userPassword;
	}

	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getUserEmailHash() {
		return userEmailHash;
	}

	public void setUserEmailHash(String userEmailHash) {
		this.userEmailHash = userEmailHash;
	}

	public boolean isUserEmailChecked() {
		return userEmailChecked;
	}

	public void setUserEmailChecked(boolean userEmailChecked) {
		this.userEmailChecked = userEmailChecked;
	}

	public int getUserDiv() {
		return userDiv;
	}

	public void setUserDiv(int userDiv) {
		this.userDiv = userDiv;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserHP() {
		return userHP;
	}

	public void setUserHP(String userHP) {
		this.userHP = userHP;
	}

	public String getUserIMG() {
		return userIMG;
	}

	public void setUserIMG(String userIMG) {
		this.userIMG = userIMG;
	}

	public String getMainContent() {
		return MainContent;
	}

	public void setMainContent(String mainContent) {
		MainContent = mainContent;
	}

	public String getUserContent() {
		return userContent;
	}

	public void setUserContent(String userContent) {
		this.userContent = userContent;
	}


	
	
	

}
