package com.nwnu.pojo;

public class Account {
	private Integer id;       //�˻�ID
	private String username;  //�û���
	private Double balance;   //�˻����
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public Double getBalance() {
		return balance;
	}
	public void setBalance(Double balance) {
		this.balance = balance;
	}	
	public String toString(){
		return id+","+username+","+balance;
	}
}
