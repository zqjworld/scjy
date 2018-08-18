package org.sc.scjy.entity;

import java.util.Date;

public class Forder {
    private Integer fid;

    private Integer pid;

    private String pname;

    private String pcount;

    private String pstandard;

    private Double pprice;

    private String ptype;

    private String ppic;

    private Integer bid;

    private String bname;

    private String btel;

    private String bwxAccount;

    private Integer sid;

    private String sname;

    private String stel;

    private String swxAccount;

    private String saddress;

    private Date tradetime;

    public Integer getFid() {
        return fid;
    }

    public void setFid(Integer fid) {
        this.fid = fid;
    }

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public String getPname() {
        return pname;
    }

    public void setPname(String pname) {
        this.pname = pname == null ? null : pname.trim();
    }

    public String getPcount() {
        return pcount;
    }

    public void setPcount(String pcount) {
        this.pcount = pcount == null ? null : pcount.trim();
    }

    public String getPstandard() {
        return pstandard;
    }

    public void setPstandard(String pstandard) {
        this.pstandard = pstandard == null ? null : pstandard.trim();
    }

    public Double getPprice() {
        return pprice;
    }

    public void setPprice(Double pprice) {
        this.pprice = pprice;
    }

    public String getPtype() {
        return ptype;
    }

    public void setPtype(String ptype) {
        this.ptype = ptype == null ? null : ptype.trim();
    }

    public String getPpic() {
        return ppic;
    }

    public void setPpic(String ppic) {
        this.ppic = ppic == null ? null : ppic.trim();
    }

    public Integer getBid() {
        return bid;
    }

    public void setBid(Integer bid) {
        this.bid = bid;
    }

    public String getBname() {
        return bname;
    }

    public void setBname(String bname) {
        this.bname = bname == null ? null : bname.trim();
    }

    public String getBtel() {
        return btel;
    }

    public void setBtel(String btel) {
        this.btel = btel == null ? null : btel.trim();
    }

    public String getBwxAccount() {
        return bwxAccount;
    }

    public void setBwxAccount(String bwxAccount) {
        this.bwxAccount = bwxAccount == null ? null : bwxAccount.trim();
    }

    public Integer getSid() {
        return sid;
    }

    public void setSid(Integer sid) {
        this.sid = sid;
    }

    public String getSname() {
        return sname;
    }

    public void setSname(String sname) {
        this.sname = sname == null ? null : sname.trim();
    }

    public String getStel() {
        return stel;
    }

    public void setStel(String stel) {
        this.stel = stel == null ? null : stel.trim();
    }

    public String getSwxAccount() {
        return swxAccount;
    }

    public void setSwxAccount(String swxAccount) {
        this.swxAccount = swxAccount == null ? null : swxAccount.trim();
    }

    public String getSaddress() {
        return saddress;
    }

    public void setSaddress(String saddress) {
        this.saddress = saddress == null ? null : saddress.trim();
    }

    public Date getTradetime() {
        return tradetime;
    }

    public void setTradetime(Date tradetime) {
        this.tradetime = tradetime;
    }

	public Forder(Integer pid, String pname, String pcount, String pstandard, Double pprice,String ptype ,String ppic, Integer bid,
			String bname, String btel, String bwxAccount, Integer sid, String sname, String stel, String swxAccount,
			String saddress, Date tradetime) {
		super();
		this.pid = pid;
		this.pname = pname;
		this.pcount = pcount;
		this.pstandard = pstandard;
		this.pprice = pprice;
		this.ptype=ptype;
		this.ppic = ppic;
		this.bid = bid;
		this.bname = bname;
		this.btel = btel;
		this.bwxAccount = bwxAccount;
		this.sid = sid;
		this.sname = sname;
		this.stel = stel;
		this.swxAccount = swxAccount;
		this.saddress = saddress;
		this.tradetime = tradetime;
	}

	public Forder() {
		// TODO Auto-generated constructor stub
	}

	public Forder(Integer fid, Integer pid, String pname, String pcount, String pstandard, Double pprice, String ptype,
			String ppic, Integer bid, String bname, String btel, String bwxAccount, Integer sid, String sname,
			String stel, String swxAccount, String saddress, Date tradetime) {
		super();
		this.fid = fid;
		this.pid = pid;
		this.pname = pname;
		this.pcount = pcount;
		this.pstandard = pstandard;
		this.pprice = pprice;
		this.ptype = ptype;
		this.ppic = ppic;
		this.bid = bid;
		this.bname = bname;
		this.btel = btel;
		this.bwxAccount = bwxAccount;
		this.sid = sid;
		this.sname = sname;
		this.stel = stel;
		this.swxAccount = swxAccount;
		this.saddress = saddress;
		this.tradetime = tradetime;
	}
	
	
    
    
}