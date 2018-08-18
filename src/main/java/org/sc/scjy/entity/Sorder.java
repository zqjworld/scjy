package org.sc.scjy.entity;

public class Sorder {
    private Integer sid;

    private Integer pid;

    private String pname;

    private String ppic;

    private Double pprice;

    private String pcount;

    private String pstandard;
    
    private String ptype;

    private Integer suid;

    private Integer bid;

    public Integer getSid() {
        return sid;
    }

    public void setSid(Integer sid) {
        this.sid = sid;
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

    public String getPpic() {
        return ppic;
    }

    public void setPpic(String ppic) {
        this.ppic = ppic == null ? null : ppic.trim();
    }

    public Double getPprice() {
        return pprice;
    }

    public void setPprice(Double pprice) {
        this.pprice = pprice;
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

    public Integer getSuid() {
        return suid;
    }

    public void setSuid(Integer suid) {
        this.suid = suid;
    }

    public Integer getBid() {
        return bid;
    }

    public void setBid(Integer bid) {
        this.bid = bid;
    }

	public String getPtype() {
		return ptype;
	}

	public void setPtype(String ptype) {
		this.ptype = ptype;
	}

	public Sorder() {
		super();
	}

	public Sorder(Integer pid, String pname, String ppic, Double pprice, String pcount, String pstandard, String ptype,
			Integer suid, Integer bid) {
		super();
		this.pid = pid;
		this.pname = pname;
		this.ppic = ppic;
		this.pprice = pprice;
		this.pcount = pcount;
		this.pstandard = pstandard;
		this.ptype = ptype;
		this.suid = suid;
		this.bid = bid;
	}
    
    
}