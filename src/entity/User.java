package entity;

import java.io.Serializable;
/**
 * 客户表
 * @author Administrator
 *
 */
@SuppressWarnings("serial")
public class User implements Serializable{
    private Integer userid;

    private String username;

    private String userpass;

    private Integer juriid;  //角色id

    private String workspace;

    private String idcard;

    private String studio;

    private String tel;

    private String address;

    private String email;

    private String code;

    private String district;
    
    private String name;

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    public String getUserpass() {
        return userpass;
    }

    public void setUserpass(String userpass) {
        this.userpass = userpass == null ? null : userpass.trim();
    }

    public Integer getJuriid() {
        return juriid;
    }

    public void setJuriid(Integer juriid) {
        this.juriid = juriid;
    }

    public String getWorkspace() {
        return workspace;
    }

    public void setWorkspace(String workspace) {
        this.workspace = workspace == null ? null : workspace.trim();
    }

    public String getIdcard() {
        return idcard;
    }

    public void setIdcard(String idcard) {
        this.idcard = idcard == null ? null : idcard.trim();
    }

    public String getStudio() {
        return studio;
    }

    public void setStudio(String studio) {
        this.studio = studio == null ? null : studio.trim();
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel == null ? null : tel.trim();
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code == null ? null : code.trim();
    }

    public String getDistrict() {
        return district;
    }

    public void setDistrict(String district) {
        this.district = district == null ? null : district.trim();
    }
    public String getName(){
    	return name;
    }
    public void setName(String name){
    	this.name = name == null ? null : name.trim();
    }
}