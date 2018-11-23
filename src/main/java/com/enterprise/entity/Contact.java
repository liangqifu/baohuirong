package com.enterprise.entity;

import com.enterprise.entity.page.PageModel;

import java.io.Serializable;

/**
 * 联系我们
 */
public class Contact extends PageModel implements Serializable{
    private static final long serialVersionUID = 1L;
    private String contentHtml;
    private String mobile;
    private String email;
    private String phone;
    private String address;
    private String website;

    @Override
    public void clean() {
        super.clean();
        contentHtml=null;
        mobile=null;
        email=null;
        phone=null;
        address=null;
        website=null;
    }

    public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getWebsite() {
		return website;
	}

	public void setWebsite(String website) {
		this.website = website;
	}

	public String getContentHtml() {
        return contentHtml;
    }

    public void setContentHtml(String contentHtml) {
        this.contentHtml = contentHtml;
    }
}
