package wyz.jingangHotel02.ssm.autoPo;

public class RoomAndType{
	
	private String roomid;
	
	private Integer roomtypeid;
	
	private String image;
	
	private String description;
	
	private String roomtype;

	private Integer numofbeds;

	private Double price;

	public String getRoomid() {
		return roomid;
	}

	public void setRoomid(String roomid) {
		this.roomid = roomid == null ? null : roomid.trim();
	}

	public Integer getRoomtypeid() {
		return roomtypeid;
	}

	public void setRoomtypeid(Integer roomtypeid) {
		this.roomtypeid = roomtypeid;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image == null ? null : image.trim();
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description == null ? null : description.trim();
	}

	public String getRoomtype() {
		return roomtype;
	}

	public void setRoomtype(String roomtype) {
		this.roomtype = roomtype == null? null : roomtype.trim();
	}

	public Integer getNumofbeds() {
		return numofbeds;
	}

	public void setNumofbeds(Integer numofbeds) {
		this.numofbeds = numofbeds;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

}
