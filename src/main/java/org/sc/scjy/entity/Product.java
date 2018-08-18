package org.sc.scjy.entity;

import java.util.Date;

public class Product {
    private Integer id;

    private String pname;

    private Double pprice;

    private String pcount;

    private String pstandard;

    private String pdesc;
    
    private String ppic;

    private String ptype;

    private User user;

    private Date pdate;

    private Integer uid;
    
    public Integer getUid() {
		return uid;
	}
    
    public void setUid(Integer uid) {
		this.uid = uid;
	}
    
    public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getPname() {
        return pname;
    }

    public void setPname(String pname) {
        this.pname = pname == null ? null : pname.trim();
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

    public String getPdesc() {
        return pdesc;
    }

    public void setPdesc(String pdesc) {
        this.pdesc = pdesc == null ? null : pdesc.trim();
    }

    public Date getPdate() {
        return pdate;
    }

    public void setPdate(Date pdate) {
        this.pdate = pdate;
    }

    public String getPpic() {
        return ppic;
    }

    public void setPpic(String ppic) {
        this.ppic = ppic == null ? null : ppic.trim();
    }

	public String getPtype() {
		return ptype;
	}

	public void setPtype(String ptype) {
		this.ptype = ptype;
	}

    

}