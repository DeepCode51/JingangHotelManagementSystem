package wyz.jingangHotel02.ssm.autoPo;

public class Roomtype {
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column roomtype.roomTypeID
     *
     * @mbggenerated Sun May 20 16:42:24 GMT+08:00 2018
     */
    private Integer roomtypeid;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column roomtype.roomType
     *
     * @mbggenerated Sun May 20 16:42:24 GMT+08:00 2018
     */
    private String roomtype;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column roomtype.numOfBeds
     *
     * @mbggenerated Sun May 20 16:42:24 GMT+08:00 2018
     */
    private Integer numofbeds;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column roomtype.price
     *
     * @mbggenerated Sun May 20 16:42:24 GMT+08:00 2018
     */
    private Double price;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column roomtype.roomTypeID
     *
     * @return the value of roomtype.roomTypeID
     *
     * @mbggenerated Sun May 20 16:42:24 GMT+08:00 2018
     */
    public Integer getRoomtypeid() {
        return roomtypeid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column roomtype.roomTypeID
     *
     * @param roomtypeid the value for roomtype.roomTypeID
     *
     * @mbggenerated Sun May 20 16:42:24 GMT+08:00 2018
     */
    public void setRoomtypeid(Integer roomtypeid) {
        this.roomtypeid = roomtypeid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column roomtype.roomType
     *
     * @return the value of roomtype.roomType
     *
     * @mbggenerated Sun May 20 16:42:24 GMT+08:00 2018
     */
    public String getRoomtype() {
        return roomtype;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column roomtype.roomType
     *
     * @param roomtype the value for roomtype.roomType
     *
     * @mbggenerated Sun May 20 16:42:24 GMT+08:00 2018
     */
    public void setRoomtype(String roomtype) {
        this.roomtype = roomtype == null ? null : roomtype.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column roomtype.numOfBeds
     *
     * @return the value of roomtype.numOfBeds
     *
     * @mbggenerated Sun May 20 16:42:24 GMT+08:00 2018
     */
    public Integer getNumofbeds() {
        return numofbeds;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column roomtype.numOfBeds
     *
     * @param numofbeds the value for roomtype.numOfBeds
     *
     * @mbggenerated Sun May 20 16:42:24 GMT+08:00 2018
     */
    public void setNumofbeds(Integer numofbeds) {
        this.numofbeds = numofbeds;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column roomtype.price
     *
     * @return the value of roomtype.price
     *
     * @mbggenerated Sun May 20 16:42:24 GMT+08:00 2018
     */
    public Double getPrice() {
        return price;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column roomtype.price
     *
     * @param price the value for roomtype.price
     *
     * @mbggenerated Sun May 20 16:42:24 GMT+08:00 2018
     */
    public void setPrice(Double price) {
        this.price = price;
    }
}