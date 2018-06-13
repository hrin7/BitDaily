package kr.co.bitdaily.repository.vo;

public class Member {
	private int userSeq;
	private String id; 
	private String name;
	private String pass;
	private String email;
	private int age;
	private int userHeight;
	private int userWeight;
	private char gender;
	private int goalWeight;
	private int goalCalorie;
	private int currentWeight;
	
	
	public int getUserSeq() {
		return userSeq;
	}
	public void setUserSeq(int userSeq) {
		this.userSeq = userSeq;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public int getUserHeight() {
		return userHeight;
	}
	public void setUserHeight(int userHeight) {
		this.userHeight = userHeight;
	}
	public int getUserWeight() {
		return userWeight;
	}
	public void setUserWeight(int userWeight) {
		this.userWeight = userWeight;
	}
	public char getGender() {
		return gender;
	}
	public void setGender(char gender) {
		this.gender = gender;
	}
	public int getGoalWeight() {
		return goalWeight;
	}
	public void setGoalWeight(int goalWeight) {
		this.goalWeight = goalWeight;
	}
	public int getGoalCalorie() {
		return goalCalorie;
	}
	public void setGoalCalorie(int goalCalorie) {
		this.goalCalorie = goalCalorie;
	}
	public int getCurrentWeight() {
		return currentWeight;
	}
	public void setCurrentWeight(int currentWeight) {
		this.currentWeight = currentWeight;
	}
	@Override
	public String toString() {
		return "Member [userSeq=" + userSeq + ", id=" + id + ", name=" + name + ", pass=" + pass + ", email=" + email
				+ ", age=" + age + ", userHeight=" + userHeight + ", userWeight=" + userWeight + ", gender=" + gender
				+ ", goalWeight=" + goalWeight + ", goalCalorie=" + goalCalorie + ", currentWeight=" + currentWeight
				+ "]";
	}
	
	
	
}
